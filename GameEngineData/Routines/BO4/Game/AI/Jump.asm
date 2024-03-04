    ;; Jump script copy/pasted from inputs
    LDY Object_type,x
    LDA ObjectJumpSpeedLo,y
    EOR #$FF
    STA Object_v_speed_lo,x
    LDA ObjectJumpSpeedHi,y
    EOR #$FF
    STA Object_v_speed_hi,x

    ;; Reuse "move towards player" script to jump towards player
    JMP bo4MoveTowardsPlayer
    
;    LDA Object_direction,x
;    AND #%00000111
;    CMP #FACE_LEFT
;    BEQ +goLeft
    
;    +goRight:
;    LDY #2
;    JMP +goMove
    
    ;; If we're here, enemy should go left (6)
;    +goLeft:
;    LDY #6
    
;    +goMove:
;    STX tempA
;	LDA DirectionTableOrdered,y
;	STA tempB
;	StartMoving tempA, tempB
