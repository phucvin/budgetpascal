(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (param i32 i32)))
  (import "rtl" "$updatemem" (func (;0;) (type 0)))
  (import "rtl" "$putint" (func (;1;) (type 2)))
  (import "rtl" "$putln" (func (;2;) (type 1)))
  (import "rtl" "$putstr" (func (;3;) (type 3)))
  (func (;4;) (type 0) (param i32)
    (local i32)
    global.get 0
    local.get 0
    i32.add
    global.set 0
    global.get 0
    global.get 2
    i32.le_s
    if  ;; label = @1
      return
    end
    global.get 3
    i32.const 1
    i32.shl
    local.tee 1
    global.get 0
    i32.const 65536
    i32.div_s
    i32.const 1
    i32.add
    local.tee 0
    i32.gt_s
    if  ;; label = @1
      local.get 1
      local.set 0
    end
    local.get 0
    i32.const 64
    i32.gt_s
    if  ;; label = @1
      i32.const 64
      local.set 0
    end
    local.get 0
    global.get 3
    i32.sub
    memory.grow
    call 0
    local.get 0
    global.set 3
    local.get 0
    i32.const 16
    i32.shl
    global.set 2)
  (func (;5;) (type 0) (param i32)
    global.get 1
    global.get 0
    i32.store
    global.get 1
    local.get 0
    i32.store offset=4
    global.get 1
    i32.const 8
    i32.add
    global.set 1)
  (func (;6;) (type 1)
    global.get 1
    i32.const 8
    i32.sub
    global.set 1
    global.get 1
    i32.load
    global.set 0)
  (func (;7;) (type 0) (param i32)
    (local i32)
    i32.const 1
    call 5
    i32.const 8
    call 4
    global.get 0
    i32.const 8
    i32.sub
    local.tee 1
    local.get 0
    i64.load align=1
    i64.store align=1
    local.get 1
    local.tee 0
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 32
    i32.const 1
    i32.const 0
    call 1
    local.get 0
    i32.const 4
    i32.add
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    call 2
    call 6)
  (func (;8;) (type 2) (param i32 i32 i32)
    i32.const 2
    call 5
    local.get 0
    local.get 1
    i32.store align=1
    local.get 0
    i32.const 4
    i32.add
    local.get 2
    i32.store align=1
    call 6)
  (func (;9;) (type 1)
    i32.const 3
    call 5
    i32.const 40
    i32.const 1
    i32.const 0
    call 1
    i32.const 66576
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 44
    i32.const 1
    i32.const 0
    call 1
    i32.const 66580
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 0
    i32.const 0
    call 3
    i32.const 66584
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 44
    i32.const 1
    i32.const 0
    call 1
    i32.const 66588
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 41
    i32.const 1
    i32.const 0
    call 1
    call 2
    call 6)
  (func (;10;) (type 1)
    (local i32 i32 i32)
    i32.const 8
    call 4
    i32.const 8
    call 4
    global.get 0
    i32.const 8
    i32.sub
    local.set 0
    i32.const 16
    call 4
    i32.const 66560
    i32.const 1
    i32.const 2
    call 8
    i32.const 66560
    call 7
    local.get 0
    i32.const 66560
    i64.load align=1
    i64.store align=1
    local.get 0
    i32.const 4
    i32.add
    i32.const 10
    i32.store align=1
    local.get 0
    call 7
    i32.const 66576
    i32.const 66560
    i64.load align=1
    i64.store align=1
    i32.const 66584
    i32.const 23
    i32.const 15
    call 8
    call 9
    i32.const 4
    call 5
    i32.const 8
    call 4
    global.get 0
    i32.const 8
    call 4
    i32.const 5
    call 5
    global.get 1
    i32.const 8
    i32.sub
    i32.load
    i32.const 8
    i32.sub
    local.set 1
    block (result i32)  ;; label = @1
      global.get 1
      local.set 0
      loop (result i32)  ;; label = @2
        i32.const -1
        local.get 0
        i32.const 8
        i32.sub
        local.tee 0
        i32.const 65536
        i32.lt_s
        br_if 1 (;@1;)
        drop
        local.get 0
        i32.load offset=4
        i32.const 4
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.load
      end
    end
    i32.const -1
    i32.const -1
    call 8
    local.get 1
    i32.const -2
    i32.store align=1
    local.get 1
    i32.const 4
    i32.add
    i32.const -2
    i32.store align=1
    call 6
    global.set 0
    i32.const 66584
    local.get 1
    i64.load align=1
    i64.store align=1
    i32.const 66576
    global.get 1
    i32.const 8
    i32.sub
    i32.load
    i64.load align=1
    i64.store align=1
    call 6
    call 9)
  (memory (;0;) 2 64)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) (mut i32) (i32.const 65536))
  (global (;2;) (mut i32) (i32.const 131072))
  (global (;3;) (mut i32) (i32.const 2))
  (export "mem" (memory 0))
  (export "main" (func 10))
  (data (;0;) (i32.const 0) "\05) - ("))
