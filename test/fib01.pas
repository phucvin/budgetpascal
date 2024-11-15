program fib01;
    function fib(n: integer): integer;
    begin
        if n < 2 then
        begin
            fib := n;
        end
        else
        begin
            fib := fib(n - 1) + fib(n - 2);
        end
    end;
begin
    writeln(fib(40));
end.