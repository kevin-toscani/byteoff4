    BIT bo4Flags
    BPL +
        RTS
    +

    STX temp ;; assumes the object we want to move is in x.
	GetActionStep temp
    CMP #$06
    BNE +notDead
        RTS
    +notDead
    
        StartMoving temp, #RIGHT
        STX temp ;; assumes the object we want to move is in x.
        ChangeFacingDirection temp, #FACE_RIGHT
        
        GetActionStep temp
        CMP #1 ;Walk
        BEQ +
        CMP #2 ;Jump
        BEQ +
        CMP #7 ;Hurt
        BEQ +
            ChangeActionStep temp, #1 ;Change to walk state
        +
        
    RTS