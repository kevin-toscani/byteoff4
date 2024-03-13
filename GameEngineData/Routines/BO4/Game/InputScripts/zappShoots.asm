    ;; Check if Zapp can shoot right now
    ;; (i.e. bit 7 is unset)
	LDA bo4Flags
    BPL +
		RTS
	+
    
    ;; Check if Zapp can fire based on a timer    
    LDA fireTimer
    BEQ +
        RTS
    +
    
    ;; Set cooldown timer
    LDA #$20
    STA fireTimer


    ;; Push X&Y on stack
    TXA
    PHA
    TYA
    PHA

    ;; Set projectile X position (based on player + offset)
    LDX player1_object
    LDA Object_x_hi,x
    CLC
    ADC #$04
    STA tempA
    
    ;; Set projectile screen (based on player screen + carry)
    LDA Object_screen,x
    ADC #$00
    STA tempD
    
    ;; Set projectile Y position (based on player + offset)
    LDA Object_y_hi,x
    CLC
    ADC #$04
    STA tempB
    LDA Object_direction,x
    AND #%00000111
    STA tempC

    ;; Create projectile
    CreateObjectOnScreen tempA, tempB, #$03, #$00, tempD

    ;; Set projectile direction (based on player direction)
    LDA tempC
    BNE +
        LDA #$02
    +
    STA Object_direction,x
    TAY
    LDA DirectionTableOrdered,y
    STA temp1
    TXA
    STA temp
    StartMoving temp, temp1
    
    ;; Play sound
    PlaySound #_sfx_zapp

    ;; Pull Y&X from stack
    PLA
    TAY
    PLA
    TAX
