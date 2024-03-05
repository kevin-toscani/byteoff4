    BIT bo4Flags
    BPL +
        RTS
    +
    
    STX temp ;; assumes the object we want to move is in x.
;	GetActionStep temp
;    CMP #$07
;    BNE +notHurt
;        RTS
;    +notHurt
   
        StartMoving temp, #LEFT
        STX temp ;; assumes the object we want to move is in x.
        ChangeFacingDirection temp, #FACE_LEFT
        
        GetActionStep temp
        CMP #1 ;Walk
        BEQ +
        CMP #2 ;Jump
        BEQ +
            ChangeActionStep temp, #1 ;Change to walk state
        +

    RTS