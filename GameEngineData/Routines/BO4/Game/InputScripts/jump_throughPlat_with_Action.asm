    BIT bo4Flags
    BPL +
        RTS
    +

;; Only can jump if the place below feet is free.
    SwitchBank #$1C
    LDY Object_type,x
    LDA ObjectBboxTop,y
    CLC
    ADC ObjectHeight,y
    sta temp2
    
    LDA Object_x_hi,x
    CLC
    ADC ObjectBboxLeft,y
    STA temp
    JSR getPointColTable
    
    LDA Object_y_hi,x
    CLC
    ADC #$02
    CLC
    ADC temp2
    STA temp1
    CheckCollisionPoint temp, temp1, #$01, tempA ;; check below feet to see if it is solid.
                                        ;;; if it is (equal), can jump.
                                        ;;; if not, skips jumping.
    BNE +checkMore 
        JMP +doJump
    +checkMore
    
    CheckCollisionPoint temp, temp1, #$07, tempA ;; check below feet to see if it is jumpthrough platform.
                                        ;;; if it is (equal), can jump.
                                        ;;; if not, skips jumping.
    BNE +checkMore

        LDA platformTimer
        CMP #$C0
        BCS +dontDoJump

        JMP +doJump
    +checkMore


;     CheckCollisionPoint temp, temp1, #$09, tempA ;; check below feet to see if it is prize block .
;                                        ;;; if it is (equal), can jump.
;                                        ;;; if not, skips jumping.
;    BNE +checkMore 
;        JMP +doJump
;    +checkMore
;    CheckCollisionPoint temp, temp1, #$0A, tempA ;; check below feet to see if it is ladder.
;                                        ;;; if it is (equal), can jump.
;                                        ;;; if not, skips jumping.
;     BNE +dontDoJump
;          JMP  +doJump
        +dontDoJump
            ;; check second point.
        LDY Object_type,x
        LDA ObjectWidth,y
        CLC
        ADC temp
        STA temp
        JSR getPointColTable
        CheckCollisionPoint temp, temp1, #$01, tempA ;; check below feet to see if it is solid.
                                            ;;; if it is (equal), can jump.
                                            ;;; if not, skips jumping.          
        BEQ +doJump
        
        CheckCollisionPoint temp, temp1, #$07, tempA ;; check below feet to see if it is jumpthrough platform.
                                        ;;; if it is (equal), can jump.
                                        ;;; if not, skips jumping.
        BNE +dontDoJump

        LDA platformTimer
        CMP #$C0
        BCS +dontDoJump

        JMP +doJump
        
        +dontDoJump:
;        CheckCollisionPoint temp, temp1, #$09, tempA ;; check below feet to see if it is jumpthrough platform.
;                                        ;;; if it is (equal), can jump.
;                                        ;;; if not, skips jumping.
;        BEQ +doJump
;        CheckCollisionPoint temp, temp1, #$0A, tempA ;; check below feet to see if it is ladder.
;                                        ;;; if it is (equal), can jump.
;                                        ;;; if not, skips jumping.
;        BEQ +doJump
;            JMP +skipJumping

+doJump:
    ;PlaySound #sfx_thump

    LDY Object_type,x
    LDA ObjectJumpSpeedLo,y
    EOR #$FF
    STA Object_v_speed_lo,x
    LDA ObjectJumpSpeedHi,y
    EOR #$FF
    STA Object_v_speed_hi,x
        
    STX temp
    GetActionStep temp
    CMP #$06
    BCS +
        ChangeActionStep temp, #2 ;Jump
    +

+skipJumping:
    ReturnBank
    RTS