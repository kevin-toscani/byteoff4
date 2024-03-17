;doHandleHurtPlayer:

    ;; Store X as the other object first
    STX otherObject

    ;; NOTE:
    ;; selfObject = player
    ;; otherObject = either monster or monster weapon

    ;; Can player get hurt based on game handler?
    LDA gameHandler
    AND #%10000000
    BEQ +
        JMP +done
    +
    
    ;; Can player get hurt based on input availability?
    LDA bo4Flags
    AND #$80
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

    ;; Recoil in direction opposite to other object
    LDX otherObject
    LDA Object_x_hi,x
    CLC
    ADC camX
    STA temp
    LDX selfObject
    LDA Object_x_hi,x
    CLC
    ADC camX
    CMP temp
    BCC +recoilRight
    
    ;recoilLeft:
        LDA Object_direction,x
        AND #%00000111
        ORA #%11000000
        JMP +doRecoil
    
    +recoilRight:
        LDA Object_direction,x
        AND #%00000111
        ORA #%10000000
    
    +doRecoil:
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
    ;RTS
