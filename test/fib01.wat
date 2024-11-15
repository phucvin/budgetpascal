(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (import "rtl" "$putint" (func (;0;) (type 2)))
  (import "rtl" "$putln" (func (;1;) (type 0)))
  (func (;2;) (type 1) (param i32) (result i32)
    global.get 1
    global.get 0
    i32.store
    global.get 1
    i32.const 1
    i32.store offset=4
    global.get 1
    i32.const 8
    i32.add
    global.set 1
    local.get 0
    i32.const 2
    i32.ge_s
    if  ;; label = @1
      local.get 0
      i32.const 1
      i32.sub
      call 2
      local.get 0
      i32.const 2
      i32.sub
      call 2
      i32.add
      local.set 0
    end
    global.get 1
    i32.const 8
    i32.sub
    global.set 1
    global.get 1
    i32.load
    global.set 0
    local.get 0)
  (func (;3;) (type 0)
    i32.const 40
    call 2
    i32.const 0
    i32.const 0
    call 0
    call 1)
  (memory (;0;) 2 64)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) (mut i32) (i32.const 65536))
  (export "mem" (memory 0))
  (export "main" (func 3)))
