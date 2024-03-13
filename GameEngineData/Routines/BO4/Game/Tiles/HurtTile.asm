OBJTYPE_EXPLOSION = #$09


lblOriginalHurtTile:
    CPX player1_object
    BEQ +
        JMP +done
    +
    
    ;; Check if we're not hurting or dead yet
    GetActionStep player1_object
    CMP #$06
    BCC +
        JMP +done
    +
        
    PlaySound #_sfx_hit

    ;; Take a hit point away (if there's any left)
    LDA myHealth
    BNE +
        JMP +notDead
    +

    DEC myHealth
    BEQ +
        JMP +notDead
    +

    ;; We're dead
    
    ;; Play death song
    PlaySong #_default_Death
    
    ;; Disable input
    LDA bo4Flags
    ORA #$80
    STA bo4Flags
    
    ;; Set player invisible
    ChangeActionStep player1_object, #$06
    
    ;; Stop moving
    StopMoving player1_object, #$FF, #$00
    
    LDA Object_x_hi,x
    STA tempx
    LDA Object_y_hi,x
    STA tempy
    LDA Object_screen,x
    STA tempC
    CreateObjectOnScreen tempx, tempy, #OBJTYPE_EXPLOSION, #$00, tempC
    
    ;; Set warp timer
    LDA #$A0
    STA warpTimer
    
    ;; Set warp to either warp screen or game over, based on number of lives
    LDA #$00
    STA warpToMap

    DEC myLives
    BNE +
        LDA #$E5
        STA warpToScreen
    +

    JMP +done



    +notDead:

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
