import { FileHandlerStatus } from "./file_handler";

type SendCommand = (command: string, data?: any) => void;
interface Runner {
  iobuffer: Int32Array,
  memory: Uint8Array,
  sendCommand: SendCommand
}

export class InterruptRuntime extends Error {}
export class RuntimeError extends Error {
  constructor(message: string) {
    super(`Runtime error: ${message}`);
  }
}

export function createImports(runner: Runner): Object {
  let linebuffer = "";
  const decoder = new TextDecoder();
  let currentFile = -1;

  const requestReadline = () => {

    if (currentFile < 0) {
      Atomics.store(runner.iobuffer, 0, 0);
      runner.sendCommand("read", {});
      Atomics.wait(runner.iobuffer, 0, 0);
    } else {
      sendFileCommand("read", {fileId: currentFile})
    }

    const length = runner.iobuffer[1];
    if (length === 0) return;
    else if (length < 0) throw new InterruptRuntime();

    const result = new Uint8Array(length);
    for (let i = 0; i < length; i++) {
      result[i] = runner.iobuffer[i+2];
    }

    linebuffer += decoder.decode(result);
  }

  const sendFileCommand = (command: string, data?: any) => {
    Atomics.store(runner.iobuffer, 0, 0);
    runner.sendCommand(command, data);
    Atomics.wait(runner.iobuffer, 0, 0);
    const result = Atomics.load(runner.iobuffer, 0) as FileHandlerStatus;

    if (result === FileHandlerStatus.OK) {
      return;
    }

    throw new RuntimeError(FileHandlerErrors[result]);
  }

  const getString = (addr: number): string => {
    const start = addr + 1;
    const end = start + runner.memory[addr];
    return decoder.decode(runner.memory.slice(start, end));
  }

  const padded = (str: string, spacing: number): string => {
    let padSize = spacing - str.length;
    if (padSize < 1) return str;

    return ' '.repeat(padSize) + str;
  }

  const sendWrite = (value: string | Uint8Array) => {
    const data: any = { value };
    if (currentFile < 0) {
      runner.sendCommand("write", data);
    } else {
      data.fileId = currentFile;
      sendFileCommand("write", data);
    }
  }

  const sendReadByte = (size: number) => {
    sendFileCommand("readbyte", {fileId: currentFile, size})
  }

  const importObject = {
    rtl: {
      $putint: (n: number, mode: number, spacing: number) => {
        let str;
        switch(mode) {
          case 1: str = String.fromCharCode(n); break;
          case 2: str = n === 0 ? "FALSE" : "TRUE"; break;
          default:
            str = n.toString();
        }

        sendWrite(padded(str, spacing));
      },
      $putreal: (x: number, spacing: number, decimal: number) => {
        let str = decimal < 0 ?
          x.toExponential() :
          x.toFixed(decimal);

        sendWrite(padded(str, spacing));
      },
      $putln: () => { sendWrite("\n"); },
      $putstr: (addr: number, spacing: number) => {
        sendWrite(padded(getString(addr), spacing));
      },

      $readint: () => {
        let str; let finished = false;
        do {
          linebuffer = skipWhitespace(linebuffer);
          [str, linebuffer] = getNonSpace(linebuffer);
          if (str) {
            let parsed = parseInt(str, 10);

            if (isNaN(parsed)) {
              throw new RuntimeError("Invalid integer format");
            }

            return parsed;
          } else {
            requestReadline();
          }
        } while (!finished);
      },

      $readchar: () => {
        if (linebuffer.length < 1) {
          requestReadline();
        }

        let c = linebuffer.charCodeAt(0);
        linebuffer = linebuffer.slice(1);
        return c;
      },

      $readreal: () => {
        let str; let finished = false;
        do {
          linebuffer = skipWhitespace(linebuffer);
          [str, linebuffer] = getNonSpace(linebuffer);
          if (str) {
            let parsed = parseFloat(str);

            if (isNaN(parsed)) {
              throw new RuntimeError("Invalid floating-point number format");
            }

            return parsed;
          } else {
            requestReadline();
          }
        } while (!finished);
      },

      $readstr: (addr: number, maxsize: number) => {
        if (linebuffer.length < 1) {
          requestReadline();
        }
        const newline = linebuffer.indexOf("\n");
        let str = "";

        if (newline >= 0) {
          str = linebuffer.slice(0, newline);
          linebuffer = linebuffer.slice(newline);
        }

        if (str.length > maxsize) {
          str = str.slice(0, maxsize);
        }

        runner.memory[addr] = str.length;
        for (let i = 0; i < str.length; i++) {
          runner.memory[addr + 1 + i] = str.charCodeAt(i);
        }
      },

      $readln: () => {
        if (linebuffer.length < 1) {
          requestReadline();
        }

        const newline = linebuffer.indexOf("\n");
        if (newline >= 0) {
          linebuffer = linebuffer.slice(newline+1);
        }
      },

      /* Files */

      $fset: (id: number) => {
        currentFile = id;
      },

      $funset: () => {
        currentFile = -1;
      },

      $fputint: (n: number, mode: number) => {
        let data;
        if (mode === 0) {
          let buffer = new ArrayBuffer(4);
          let int = new Int32Array(buffer);
          int[0] = n;
          data = new Uint8Array(buffer);
        } else {
          data = new Uint8Array(1);
          data[0] = n & 0xFF;
        }

        sendWrite(data);
      },

      $fputreal: (n: number) => {
        let buffer = new ArrayBuffer(8);
        let float = new Float64Array(buffer);
        float[0] = n;

        sendWrite(new Uint8Array(buffer));
      },

      $fputmem: (address: number, size: number) => {
        let data = new Uint8Array(size);
        for (let i = 0; i < size; i++) {
          data[i] = runner.memory[address + i];
        }

        sendWrite(data);
      },

      $freadint: (mode: number): number => {
        let size = mode === 0 ? 4 : 1;
        sendReadByte(size);

        if (mode !== 0) {
          return runner.iobuffer[2];
        }

        let buffer = new ArrayBuffer(4);
        let int = new Int32Array(buffer);
        let bytes = new Uint8Array(buffer);
        for (let i = 0; i < 4; i++) {
          bytes[i] = runner.iobuffer[i + 2];
        }

        return int[0];
      },

      $freadreal: (): number => {
        const size = 8;
        sendReadByte(size);

        let buffer = new ArrayBuffer(size);
        let float = new Float64Array(buffer);
        let bytes = new Uint8Array(buffer);
        for (let i = 0; i < size; i++) {
          bytes[i] = runner.iobuffer[i + 2];
        }

        return float[0];
      },

      $freadmem: (address: number, size: number) => {
        sendReadByte(size);

        for (let i = 0; i < size; i++) {
          runner.memory[address + i] = runner.iobuffer[i + 2];
        }
      },

      $assign: (fileId: number, nameAddr: number) => {
        const filename = getString(nameAddr);
        runner.sendCommand("assignFile", {fileId, filename});
      },

      $reset: (fileId: number) => {
        sendFileCommand("resetFile", {fileId});
      },

      $rewrite: (fileId: number) => {
        sendFileCommand("rewriteFile", {fileId});
      },

      $close: (fileId: number) => {
        sendFileCommand("closeFile", {fileId});
      },

      $eof: (fileId: number): boolean => {
        sendFileCommand("eofFile", {fileId});
        return runner.iobuffer[2] !== 0;
      },

      $pos: (substrAddr: number, sourceAddr: number): number => {
        const substr = getString(substrAddr);
        const source = getString(sourceAddr);
        return source.indexOf(substr) + 1;
      }
    }
  };

  return importObject;
}

function skipWhitespace(str: string): string{
  const match = str.match(/^\s+/);
  if (!match) return str;

  return str.slice(match[0].length);
}

function getNonSpace(str: string): [string, string] {
  const match = str.match(/^[^\s]+/);
  if (!match) return ["", str];

  return [match[0], str.slice(match[0].length)];
}

const FileHandlerErrors = {
  [FileHandlerStatus.NOT_FOUND]: "File not found.",
  [FileHandlerStatus.CLOSED]: "File is closed.",
  [FileHandlerStatus.ALREADY_OPENED]: "File already opened.",
  [FileHandlerStatus.NOT_ASSIGNED]: "File is not yet opened.",
  [FileHandlerStatus.READONLY]: "File is in read-only mode.",
  [FileHandlerStatus.WRITEONLY]: "File is in write-only mode.",
  [FileHandlerStatus.WRITE_ERROR]: "Error when writing file.",
  [FileHandlerStatus.FILE_ENDED]: "File is at end.",
}
