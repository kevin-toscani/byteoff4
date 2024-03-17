TEST_XPOS = #$7F
TEST_YPOS = #$7F

subBossIdle:
    RTS

subBossScrollIn:
    ;; Scroll boss into screen. Because this is a per-frame action,
    ;; based on phase number, there's no action to take here.
    RTS
    
subBossShoot:
    ;; Show fire animation
    CreateObject #$70, #$68, #$1F, #$00

    ;; Shoot one of three possible bouncy balls
    JSR doGetRandomNumberToo
    AND #$03
    TAX
    LDA tblBossNozzleBalls,x
    STA temp
    CreateObject #$82, #$74, temp, #$00
    
    PlaySound #_sfx_bosspew
    RTS
    
subBossLaunch:
    LDA gameMode
    AND #$01
    BEQ +onePlayerMode
        CreateObject #$C8, #$4E, #$20, #$00
        PlaySound #_sfx_bossOpenHatch
        RTS
        
    ;; Skip next phases
    +onePlayerMode:
    INC bossPhase
    RTS

subBossOpenEye:
    ;; Open eye

    ;; First, find the eye
    LDX #$00
    -
        LDA Object_type,x
        CMP #$18
        BEQ +eyeFound

        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -

    ;; No eye found, only light eye up
    JMP +lightEyeUp

    ;; Eye found, change action step to opening
    +eyeFound:
    STX temp
    ChangeActionStep temp, #$01
    

    +lightEyeUp:
    CreateObject #$B5, #$5A, #$19, #$00
    RTS


subBossLightEye:
    ;; Light up eye; moved to eye open
    RTS

    
subBossFireball:
    ;; Shoot a fireball from the eye
    CreateObject #$B5, #$62, #$1C, #$00
    PlaySound #_sfx_bossFire
    RTS
    
subBossCloseEye:
    ;; Close eye
    ;; First, find the eye
    LDX #$00
    -
        LDA Object_type,x
        CMP #$18
        BEQ +eyeFound

        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -

    ;; No eye found, no action needed
    JMP +destroyFlame

    ;; Eye found, change action step to closing
    +eyeFound:
    STX temp
    ChangeActionStep temp, #$03
    
    +destroyFlame:

    LDX #$00
    -
        LDA Object_type,x
        CMP #$19
        BNE +
            DestroyObject
            RTS
        +

        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -
    RTS


subBossScrollOut:
    ;; Scroll boss off screen. Because this is a per-frame action,
    ;; based on phase number, there's no action to take here.
    RTS
    
subBossDrop:
    ;; Drop a fireball from the sky
    PlaySound #_sfx_meteorFall
    CreateObject #$00, #$03, #$21, #$00
    JSR doGetRandomNumberToo
    AND #$07
    ASL
    ASL
    ASL
    ASL
    ASL 
    CLC
    ADC #$0A
    STA Object_x_hi,x
    CLC
    ADC #$80
    STA tempx
    CreateObject tempx, #$03, #$21, #$00
    RTS
    
subBossLoop:
    ;; Reset the boss phase index
    LDA #$00
    STA bossPhase
    RTS

subBossHurt:
    DEC bossHealth
    BNE +
        LDA #$13
        STA bossPhase
        LDA #$01
        STA bossTimer
    +
    PlaySound #_sfx_bossHurt
    RTS

subBossRetreat:
    LDA #$0A
    STA bossPhase
    LDA #$10
    STA bossTimer
    RTS

subBossDead:
    ;; Stop the music
    StopSound
    
    ;; Destroy all monsters
    LDX #$00
    -monsterLoop:
        INX
        LDA Object_flags,x
        AND #%00011000
        BEQ +
            DestroyObject
        +
        CPX #TOTAL_MAX_OBJECTS
    BNE -monsterLoop

    ;; Disable inputs
    LDA bo4Flags
    ORA #$80
    STA bo4Flags

    ;; Change color
    LDA #$16
    STA bckPal+1
    LDA #$26
    STA bckPal+2
    LDA #$0D
    STA bckPal+3
    JSR doUpdateBackgroundPalette
        
    ;; Immediately go to the first explosion


subBossExplosion:
    ;; Play explosion sound effect
    PlaySound #_sfx_explosionToo

    ;; Initiate screen shake
    LDA #$01
    STA camShake
    
    ;; Place two explosions on random spots of the discoball
    LDX #$02
    -explosionLoop:
        TXA
        PHA

        JSR doGetRandomNumber
        AND #$3F
        CLC
        ADC #$B4
        STA tempx
        
        JSR doGetRandomNumberToo
        AND #$1F
        STA tempy
        JSR doGetRandomNumber
        AND #$0F
        CLC
        ADC tempy
        ADC #$50
        STA tempy
        CreateObject tempx, tempy, #$1A, #$00
        
        PLA
        TAX
        DEX
    BNE -explosionLoop
    RTS
    
subBossFadeout:
    RTS

subBossVictory:
    ;; Play victory music
    PlaySong #_default_Win

    ;; Then, every x frames, load two exposions on a random ball spot
    ;; and play the explosion sound. Which is a repeating action
    ;; so we don't need to do anything here.
    RTS

subBossEnd:
    WarpToScreen #$00, #$C1, #$01
    RTS


;; Boss phase timer values (length per phase)
tblBossPhaseTimer:
    .db $40, $70, $40, $40
    .db $40, $40, $40, $40
    .db $40, $01, $40, $40
    .db $70, $40, $40, $40
    .db $40, $40, $40, $40
    .db $30, $30, $30, $30
    .db $30, $40, $FF, $20
    .db $40

;; Low byte table for phase action subroutine addresses
tblBossPhaseActionLo:

    ; $00-03
    .db #<subBossIdle, #<subBossScrollIn, #<subBossIdle, #<subBossShoot
    ; $04-07
    .db #<subBossShoot, #<subBossShoot, #<subBossLaunch, #<subBossIdle
    ; $08-0B
    .db #<subBossOpenEye, #<subBossLightEye, #<subBossFireball, #<subBossCloseEye
    ; $0C-0F
    .db #<subBossScrollOut, #<subBossIdle, #<subBossDrop, #<subBossDrop
    ; $10-13
    .db #<subBossDrop, #<subBossLoop, #<subBossHurt, #<subBossRetreat
    ; $14-17
    .db #<subBossDead, #<subBossExplosion, #<subBossExplosion, #<subBossExplosion
    ; $18-1B
    .db #<subBossExplosion, #<subBossFadeout, #<subBossVictory, #<subBossIdle
    ; $1C-1F
    .db #<subBossEnd

;; High byte table for phase action subroutine addresses
tblBossPhaseActionHi:
    .db #>subBossIdle,  #>subBossScrollIn, #>subBossIdle, #>subBossShoot
    .db #>subBossShoot, #>subBossShoot, #>subBossLaunch, #>subBossIdle
    .db #>subBossOpenEye, #>subBossLightEye, #>subBossFireball, #>subBossCloseEye
    .db #>subBossScrollOut, #>subBossIdle, #>subBossDrop, #>subBossDrop
    .db #>subBossDrop, #>subBossLoop, #>subBossHurt, #>subBossRetreat
    .db #>subBossDead, #>subBossExplosion, #>subBossExplosion, #>subBossExplosion
    .db #>subBossExplosion, #>subBossFadeout, #>subBossVictory, #>subBossIdle
    .db #>subBossEnd

tblBossNozzleBalls:
    .db $1B, $22, $1B, $23