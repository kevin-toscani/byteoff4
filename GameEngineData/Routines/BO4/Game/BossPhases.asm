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
    ;; Shoot a bouncy ball
    CreateObject #$82, #$74, #$1B, #$00
    RTS
    
subBossLaunch:
    LDA gameMode
    AND #$01
    BEQ +onePlayerMode
        CreateObject #$C8, #$4E, #$20, #$00
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
    CreateObject #$B5, #$62, #$19, #$00
    RTS


subBossLightEye:
    ;; Light up eye
    RTS

    
subBossFireball:
    ;; Shoot a fireball from the eye
    CreateObject #TEST_XPOS, #TEST_YPOS, #$1C, #$00
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
    CreateObject #$00, #$03, #$1D, #$00
    JSR doGetRandomNumberToo
    AND #$07
    ASL
    ASL
    ASL
    ASL
    ASL    
    STA Object_x_hi,x
    RTS
    
subBossEnd:
    ;; Reset the boss phase index
    LDA #$00
    STA bossPhase
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
    .db TEST_SPEED

;; Low byte table for phase action subroutine addresses
tblBossPhaseActionLo:
    .db #<subBossIdle,  #<subBossScrollIn, #<subBossIdle
    .db #<subBossShoot, #<subBossShoot, #<subBossShoot
    .db #<subBossLaunch, #<subBossIdle, #<subBossOpenEye
    .db #<subBossLightEye, #<subBossFireball, #<subBossCloseEye
    .db #<subBossScrollOut, #<subBossIdle
    .db #<subBossDrop, #<subBossDrop, #<subBossDrop
    .db #<subBossEnd

;; High byte table for phase action subroutine addresses
tblBossPhaseActionHi:
    .db #>subBossIdle,  #>subBossScrollIn, #>subBossIdle
    .db #>subBossShoot, #>subBossShoot, #>subBossShoot
    .db #>subBossLaunch, #>subBossIdle, #>subBossOpenEye
    .db #>subBossLightEye, #>subBossFireball, #>subBossCloseEye
    .db #>subBossScrollOut, #>subBossIdle
    .db #>subBossDrop, #>subBossDrop, #>subBossDrop
    .db #>subBossEnd