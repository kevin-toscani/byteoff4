;doHandleHurtMonster:

    ;; Store X as the other object first
    STX otherObject
    
    ;; NOTE:
    ;; selfObject = player weapon
    ;; otherObject = monster
    
    ;; Destroy the player weapon
    LDX selfObject
    DestroyObject
    
    ;; Check the monster type
    LDX otherObject
    LDA Object_type,x
    
    ;; If it is the flame, set monster in step #$12
    CMP #$19
    BNE +defaultMonster
    
        ;flameMonster:
        ;; hurt phase is $12, we load $11 and set the timer to 1,
        ;; so next frame the boss will go in hurt state
        LDA #$11    
        STA bossPhase
        LDA #$01
        STA bossTimer
        ;; Also, remove the eye
        DestroyObject
        RTS

    +defaultMonster:
    ;; [@TODO] Determine if we want to give monsters health points
    ;; For now, just destroy 'em
    PlaySound #_sfx_quickHit
    DestroyObject
    LDA Object_x_hi,x
    STA tempx
    LDA Object_y_hi,x
    STA tempy
    LDA Object_screen,x
    STA tempC
    CreateObjectOnScreen tempx, tempy, #$24, #$00, tempC
    ;RTS



;   Saved for using possible health points / invincibility later
;
;	TXA
;	STA temp
;	GetActionStep temp
;	CMP #$07
;	BEQ +doSkipHurtingThisObject
;
;	   	ChangeActionStep temp, #$07
;       
;		LDA #$80
;		STA Object_action_timer,x
;       
;		DEC Object_health,x
;		LDA Object_health,x
;		BNE +doSkipHurtingThisObject
;        
;			DestroyObject
;			CountObjects #%00001000
;			BNE +notZeroCount
;				LDA scrollByte
;				ORA #%00000010
;				STA scrollByte
;				;;; if there are no more monsters left, we want to disable
;				;;; the edge check for scrolling.
;				LDA ScreenFlags00
;				AND #%11101111
;				STA ScreenFlags00
;			+notZeroCount
;	+doSkipHurtingThisObject
;
