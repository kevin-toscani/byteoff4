;;;; 
    STX temp ;; assumes the object we want to move is in x. 
	GetActionStep temp
    CMP #$07
    BNE +notHurt
        RTS
    +notHurt
    
	GetActionStep temp
    BEQ +
        ChangeActionStep temp, #0 ;Change to idle state
    +
	
+stopPlayerMovement:
	
    StopMoving temp, #$FF, #$00
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    RTS