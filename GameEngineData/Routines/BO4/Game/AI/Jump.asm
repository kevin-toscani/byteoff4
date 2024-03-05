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
