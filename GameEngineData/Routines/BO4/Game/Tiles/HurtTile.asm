
    CPX player1_object
    BNE +done
    
        ;; Temporarily disable inputs
        LDA bo4Flags
        ORA #%10000000
        STA bo4Flags

        ;; Move in non-facing direction
		LDA Object_direction,x
        AND #%00000111
        CMP #%00000100
        BCC +goRight
        
        +goLeft:
            ORA #%11000000
            JMP +goMove
        
        +goRight:
            ORA #%10000000
            AND #%10111111
        
        +goMove:
        STA Object_direction,x
        
        ;; Stop moving
        ChangeActionStep player1_object, #$07
        
        LDA #$80
        STA Object_v_speed_lo,x
        LDA #$FD
        STA Object_v_speed_hi,x
        LDA #$1E
        STA disabledTimer
    +done:
