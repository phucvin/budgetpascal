(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32)))
  (import "rtl" "$putstr" (func (;0;) (type 1)))
  (import "rtl" "$putln" (func (;1;) (type 0)))
  (func (;2;) (type 0)
    i32.const 0
    i32.const 0
    call 0
    call 1)
  (memory (;0;) 2 64)
  (export "mem" (memory 0))
  (export "main" (func 2))
  (data (;0;) (i32.const 0) "\05fib01"))
