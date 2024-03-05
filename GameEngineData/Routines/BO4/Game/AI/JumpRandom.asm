    
    ;; Jump
    LDY Object_type,x
    LDA ObjectJumpSpeedLo,y
    EOR #$FF
    STA Object_v_speed_lo,x
    LDA ObjectJumpSpeedHi,y
    EOR #$FF
    STA Object_v_speed_hi,x
    
    ;; Get a number between 1 and 3 inclusive
    -
        JSR doGetRandomNumberToo
        AND #$03
    BEQ -
    
    CMP #$01
    BEQ +goRight
    
    CMP #$02
    BEQ +goLeft
    
    RTS

    +goRight:
    LDY #2
    JMP +goMove
    
    ;; If we're here, enemy should go left (6)
    +goLeft:
    LDY #6
    
    ;; Y holds the direction now; let's move enemy
    +goMove:
    STX tempA
	LDA DirectionTableOrdered,y
	STA tempB
	StartMoving tempA, tempB
