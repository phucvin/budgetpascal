program branching;
var
  a: integer;
  c: char;

begin
  if true then writeln(1);

  if false then
  else writeln(2);

  a := 3;

  if a = 3 then begin
    writeln(3);
  end;

  if a = 4 then begin
    writeln(4);
  end else begin
    writeln(5);
  end;

  a := 7;

  if a = 1 then begin
    writeln(6);
    writeln(6.5);
  end else if a = 8 then begin
    writeln(7);
    writeln(7.5);
  end else if a = 7 then begin
    writeln(8);
    writeln(8.5);
  end else begin
    writeln(9);
    writeln(9.5);
  end;

  a := 9;
  case a of
    5, 6: writeln(56);
    1, 7..9:
      case a of
        8: writeln(8)
      else
        writeln(179)
      end
    10..13: writeln(1013);
  else
    write(#97, #32);
    writeln(a);
  end;

  c := #97;
  case c of
    #97..#99: writeln(123);
    #100..#102: writeln(456);
  end;

end.
