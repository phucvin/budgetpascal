(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (import "rtl" "$updatemem" (func (;0;) (type 0)))
  (import "rtl" "$putint" (func (;1;) (type 4)))
  (import "rtl" "$putln" (func (;2;) (type 1)))
  (import "rtl" "$putstr" (func (;3;) (type 2)))
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
  (func (;7;) (type 3) (param i32) (result i32)
    (local i32)
    global.get 1
    local.set 1
    loop (result i32)  ;; label = @1
      local.get 1
      i32.const 8
      i32.sub
      local.tee 1
      i32.const 65536
      i32.lt_s
      if  ;; label = @2
        i32.const -1
        return
      end
      local.get 0
      local.get 1
      i32.load offset=4
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load
    end)
  (func (;8;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 0
    i32.store8
    local.get 1
    local.tee 3
    i32.load8_u
    local.tee 1
    i32.const 5
    local.get 0
    i32.load8_u
    local.tee 2
    i32.sub
    local.tee 4
    i32.gt_s
    if  ;; label = @1
      local.get 4
      local.set 1
    end
    local.get 1
    if  ;; label = @1
      local.get 0
      local.get 2
      i32.add
      i32.const 1
      i32.add
      local.get 3
      i32.const 1
      i32.add
      local.get 1
      memory.copy
      local.get 0
      local.get 1
      local.get 2
      i32.add
      i32.store8
    end)
  (func (;9;) (type 0) (param i32)
    (local i32 i32)
    i32.const 1
    call 5
    i32.const 6
    local.set 2
    loop  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        i32.load align=1
        i32.const 0
        i32.const 0
        call 1
        i32.const 32
        i32.const 1
        i32.const 0
        call 1
        br 1 (;@1;)
      end
    end
    call 2
    call 6)
  (func (;10;) (type 0) (param i32)
    (local i32 i32)
    i32.const 4
    call 5
    i32.const 6
    local.set 2
    loop  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.const 2
        i32.shl
        i32.add
        local.get 1
        i32.store align=1
        br 1 (;@1;)
      end
    end
    call 6)
  (func (;11;) (type 0) (param i32)
    (local i32 i32 i32 i32)
    i32.const 6
    call 5
    i32.const 2
    local.set 3
    loop  ;; label = @1
      block  ;; label = @2
        local.get 3
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 6
        local.set 4
        i32.const 0
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.const 28
            i32.mul
            i32.const 24
            i32.sub
            i32.add
            local.get 2
            i32.const 2
            i32.shl
            i32.add
            i32.load align=1
            i32.const 0
            i32.const 0
            call 1
            i32.const 32
            i32.const 1
            i32.const 0
            call 1
            br 1 (;@3;)
          end
        end
        call 2
        br 1 (;@1;)
      end
    end
    call 6)
  (func (;12;) (type 1)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 28
    call 4
    global.get 0
    i32.const 28
    i32.sub
    i32.const 6
    i32.store align=1
    i32.const 28
    call 4
    global.get 0
    i32.const 28
    i32.sub
    i32.const 6
    i32.store align=1
    i32.const 60
    call 4
    global.get 0
    i32.const 60
    i32.sub
    local.tee 2
    i32.const 2
    i32.store align=1
    i32.const 60
    call 4
    global.get 0
    i32.const 60
    i32.sub
    i32.const 2
    i32.store align=1
    global.get 0
    i32.const 60
    i32.sub
    local.set 1
    i32.const 6
    call 4
    global.get 0
    i32.const 6
    i32.sub
    local.set 4
    i32.const 20
    call 4
    global.get 0
    i32.const 20
    i32.sub
    local.tee 3
    i32.const 4
    i32.store align=1
    i32.const 16
    call 4
    global.get 0
    i32.const 16
    i32.sub
    local.tee 5
    i32.const 2
    i32.store align=1
    i32.const 66560
    call 10
    i32.const 66588
    call 10
    i32.const 66564
    i32.const 10
    i32.store align=1
    i32.const 66568
    i32.const 66564
    i32.load align=1
    i32.const 100
    i32.add
    i32.store align=1
    i32.const 66564
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    i32.const 32
    i32.const 1
    i32.const 0
    call 1
    i32.const 66568
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    call 2
    i32.const 66560
    call 9
    i32.const 66588
    call 9
    i32.const 66588
    i32.const 66560
    i32.const 28
    memory.copy
    i32.const 66588
    call 9
    local.get 2
    i32.const 4
    i32.add
    call 10
    local.get 2
    i32.const 32
    i32.add
    i32.const 66560
    i32.const 28
    memory.copy
    local.get 1
    local.get 2
    i32.const 60
    memory.copy
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 6
      i32.le_s
      if  ;; label = @2
        local.get 0
        i32.const 1
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 1
          i32.const 4
          i32.add
          local.get 0
          i32.const 2
          i32.shl
          i32.add
          i32.const -1
          i32.store align=1
        end
        br 1 (;@1;)
      end
    end
    local.get 2
    call 11
    local.get 1
    call 11
    i32.const 7
    call 5
    i32.const 4
    call 4
    global.get 0
    i32.const 4
    i32.sub
    i32.const 66560
    i32.store align=1
    i32.const 28
    call 4
    global.get 0
    i32.const 28
    i32.sub
    i32.const 6
    i32.store align=1
    i32.const 8
    call 5
    i32.const 7
    call 7
    i32.const 4
    i32.add
    call 10
    i32.const 7
    call 7
    i32.const 8
    i32.add
    i32.const 99
    i32.store align=1
    i32.const 7
    call 7
    i32.load align=1
    i32.const 4
    i32.add
    i32.const 98
    i32.store align=1
    call 6
    global.get 1
    i32.const 8
    i32.sub
    i32.load
    i32.const 4
    i32.add
    call 9
    i32.const 66560
    call 9
    i32.const 66564
    i32.const 12
    i32.store align=1
    call 6
    i32.const 66560
    call 9
    i32.const 66588
    call 10
    i32.const 66560
    global.get 0
    i32.const 0
    local.set 0
    i32.const 28
    call 4
    i32.const 5
    call 5
    i32.const 28
    call 4
    global.get 0
    i32.const 28
    i32.sub
    local.tee 8
    i32.const 66588
    i32.const 28
    memory.copy
    global.get 1
    i32.const 8
    i32.sub
    i32.load
    i32.const 28
    i32.sub
    local.set 1
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 6
      i32.le_s
      if  ;; label = @2
        local.get 1
        local.get 0
        i32.const 2
        i32.shl
        local.tee 6
        i32.add
        local.get 6
        local.get 8
        i32.add
        local.tee 6
        i32.load align=1
        local.get 0
        i32.add
        i32.store align=1
        local.get 6
        i32.const -1
        i32.store align=1
        br 1 (;@1;)
      end
    end
    call 6
    global.set 0
    local.get 1
    i32.const 28
    memory.copy
    i32.const 66560
    call 9
    i32.const 66588
    call 9
    local.get 4
    i32.const 0
    call 8
    local.get 4
    i32.const 2
    i32.add
    local.tee 0
    i32.load8_u
    i32.const 1
    i32.const 0
    call 1
    call 2
    local.get 0
    i32.const 112
    i32.store8
    local.get 4
    i32.const 0
    call 3
    call 2
    i32.const 2
    call 5
    i32.const 4
    call 4
    global.get 0
    i32.const 4
    i32.sub
    local.get 2
    i32.const 32
    i32.add
    i32.store align=1
    i32.const 3
    call 5
    i32.const 2
    call 7
    i32.load align=1
    call 9
    call 6
    call 6
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 4
      i32.le_s
      if  ;; label = @2
        local.get 3
        local.get 0
        i32.const 2
        i32.shl
        i32.add
        local.get 0
        i32.store align=1
        br 1 (;@1;)
      end
    end
    local.get 3
    i32.const 4
    i32.add
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    local.get 3
    i32.const 8
    i32.add
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    local.get 3
    i32.const 12
    i32.add
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    local.get 3
    i32.const 16
    i32.add
    i32.load align=1
    i32.const 0
    i32.const 0
    call 1
    call 2
    local.get 5
    i32.const 4
    i32.add
    i32.const 6
    call 8
    local.get 5
    i32.const 5
    i32.add
    i32.load8_u
    i32.const 1
    i32.const 0
    call 1
    local.get 5
    i32.const 9
    i32.add
    i32.load8_u
    i32.const 1
    i32.const 0
    call 1
    call 2)
  (memory (;0;) 2 64)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) (mut i32) (i32.const 65536))
  (global (;2;) (mut i32) (i32.const 131072))
  (global (;3;) (mut i32) (i32.const 2))
  (export "mem" (memory 0))
  (export "main" (func 12))
  (data (;0;) (i32.const 0) "\05hello")
  (data (;1;) (i32.const 6) "\05world"))
