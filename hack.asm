CUR_BUTTONS     = $ffd726
BIT_BUTTON_UP   = 0
BIT_BUTTON_C    = 5

    org 0
    incbin "xmen.md"

    org $016942
            jmp     gambit

    org $016156
            jmp     nightcrawler

    org $0148ca
            jmp     wolverine

    org $0159b8
            jmp     cyclops

    org $0ff800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gambit:
            ; replace original instructions
            bne     .cont
            tst.w   ($4e, a5)
            bpl.b   .double_jump
.spin_jump
            jmp     $01694a
.cont
.check_for_counter
            tst.w   ($4e, a5)
            bne     .do_nothing
.check_for_up_button
            btst.b  #BIT_BUTTON_UP, CUR_BUTTONS
            beq.b   .do_nothing
.check_for_c_button
            btst.b  #BIT_BUTTON_C, CUR_BUTTONS
            beq.b   .do_nothing
            bra     .double_jump
.do_nothing
            jmp     $0169a0
.double_jump
            jmp     $016976

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nightcrawler:
            ; replace original instructions
            bne     .cont
            tst.w   ($4e, a5)
            bmi.b   .do_nothing
.double_jump
            jmp     $016976
.cont
.check_for_counter
            tst.w   ($4e, a5)
            bne     .do_nothing
.check_for_up_button
            btst.b  #BIT_BUTTON_UP, CUR_BUTTONS
            beq.b   .do_nothing
.check_for_c_button
            btst.b  #BIT_BUTTON_C, CUR_BUTTONS
            beq.b   .do_nothing
            bra     .double_jump
.do_nothing
            jmp     $016182

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wolverine:
            ; replace original instructions
            bne     .cont
            btst.b  #2, ($33, a5)
            bne.b   .special_jump
            tst.w   ($4e, a5)
            bmi.b   .do_nothing
.double_jump
            jmp     $0148da
.cont
.check_for_counter
            tst.w   ($4e, a5)
            bne     .do_nothing
.check_for_up_button
            btst.b  #BIT_BUTTON_UP, CUR_BUTTONS
            beq.b   .do_nothing
.check_for_c_button
            btst.b  #BIT_BUTTON_C, CUR_BUTTONS
            beq.b   .do_nothing
            bra     .double_jump
.do_nothing
            jmp     $0169a0
.special_jump
            jmp     $0148fe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cyclops:
            ; replace original instructions
            bne     .cont
            tst.w   ($4e, a5)
            bpl.b   .double_jump
.spin_jump
            jmp     $0159c0
.cont
.check_for_counter
            tst.w   ($4e, a5)
            bne     .do_nothing
.check_for_up_button
            btst.b  #BIT_BUTTON_UP, CUR_BUTTONS
            beq.b   .do_nothing
.check_for_c_button
            btst.b  #BIT_BUTTON_C, CUR_BUTTONS
            beq.b   .do_nothing
            bra     .double_jump
.do_nothing
            jmp     $015a10
.double_jump
            jmp     $0159e6
