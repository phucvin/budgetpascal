cd ..

npm install

npm run build

npm start -- testcases/arrays.pas

mkdir tmp

npm start -- testcases/arrays.pas --compile 

npm install -g @irongeek/wabt

wasm2wat tmp/compiled.wasm -o test/arrays.wat

npm start -- testcases/records.pas --compile 

wasm2wat tmp/compiled.wasm -o test/records.wat

npm start -- test/fib01.pas --compile 

wasm2wat tmp/compiled.wasm -o test/fib01.wat
