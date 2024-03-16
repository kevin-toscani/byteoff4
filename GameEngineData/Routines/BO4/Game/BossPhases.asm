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
    ;; Light up eye
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

    ;; Then, every x frames, load two exposions on a random ball spot
    ;; and play the explosion sound. Which is a repeating action
    ;; so we don't need to do anything here.
    RTS

subBossEnd:
    WarpToScreen #$00, #$C0, #$01
    RTS

;; Test constants to play with (or quickly test) phase speeds
TEST_SPEED   = $40
TEST_HISPEED = $01
TEST_LOSPEED = $70


;; Boss phase timer values (length per phase)
tblBossPhaseTimer:
    .db TEST_SPEED, TEST_LOSPEED, TEST_SPEED
    .db TEST_SPEED, TEST_SPEED, TEST_SPEED
    .db TEST_SPEED, TEST_SPEED, TEST_SPEED
    .db TEST_SPEED, TEST_SPEED, TEST_SPEED
    .db TEST_LOSPEED, TEST_SPEED
    .db TEST_SPEED, TEST_SPEED, TEST_SPEED
    .db TEST_SPEED, TEST_SPEED

;; Low byte table for phase action subroutine addresses
tblBossPhaseActionLo:
    .db #<subBossIdle,  #<subBossScrollIn, #<subBossIdle
    .db #<subBossShoot, #<subBossShoot, #<subBossShoot
    .db #<subBossLaunch, #<subBossIdle, #<subBossOpenEye
    .db #<subBossLightEye, #<subBossFireball, #<subBossCloseEye
    .db #<subBossScrollOut, #<subBossIdle
    .db #<subBossDrop, #<subBossDrop, #<subBossDrop
    .db #<subBossLoop 
    .db #<subBossHurt, #<subBossRetreat
    .db #<subBossDead, #<subBossEnd

;; High byte table for phase action subroutine addresses
tblBossPhaseActionHi:
    .db #>subBossIdle,  #>subBossScrollIn, #>subBossIdle
    .db #>subBossShoot, #>subBossShoot, #>subBossShoot
    .db #>subBossLaunch, #>subBossIdle, #>subBossOpenEye
    .db #>subBossLightEye, #>subBossFireball, #>subBossCloseEye
    .db #>subBossScrollOut, #>subBossIdle
    .db #>subBossDrop, #>subBossDrop, #>subBossDrop
    .db #>subBossLoop
    .db #>subBossHurt, #>subBossRetreat
    .db #>subBossDead, #>subBossEnd

tblBossNozzleBalls: .db #$1B, #$22, #$1B, #$23