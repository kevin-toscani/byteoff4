
bo4MoveTowardsPlayer:

    ;; Store enemy slot ID in tempA
    STX tempA

    
    ;; Get and store enemy X
    LDA Object_x_hi,x
    SEC
    SBC camX
    STA temp

    ;; Compare player X to enemy X
    LDY player1_object
    LDA Object_x_hi,y
    SEC
    SBC camX
    CMP temp
    
    ; If player X is less than enemy X, enemy should go left
    BCC +goLeft
    
    ;; If we're here, enemy should go right (2)
    +goRight:
    LDY #2
    JMP +goMove
    
    ;; If we're here, enemy should go left (6)
    +goLeft:
    LDY #6
    
    ;; Y holds the direction now; let's move enemy
    +goMove:
	LDA DirectionTableOrdered,y
	STA tempB
	LDA FacingTableOrdered,y
    STA tempC
	StartMoving tempA, tempB
	ChangeFacingDirection tempA, tempC