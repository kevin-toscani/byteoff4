subBossIdle:
    RTS

subBossScrollIn:
    ;; Scroll boss into screen. Because this is a per-frame action,
    ;; based on phase number, there's no action to take here.
    RTS
    
subBossShoot:
    ;; Shoot a bouncy ball
    CreateObject [x], [y], [OBJ_BOUNCY_BALL], #$00
    CreateObject [x], [y], [OBJ_NOZZLE_FIRE], #$00
    RTS
    
subBossLaunch:
    LDA gameMode
    AND #$01
    BEQ +onePlayerMode
        ;; Draw the boss hatch that'll launch a flying ball
        CreateObject [x], [y], [OBJ_HATCH], #$00
        RTS
        
    ;; Skip two phases
    +onePlayerMode:
    INC bossPhase
    INC bossPhase
    RTS

subBossOpenEye:
    ;; Open eye

    ;; First, find the eye
    LDX #$00
    -
        LDA Object_type,x
        CMP [OBJ_EYE]
        BEQ +eyeFound

        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -

    ;; No eye found, no action needed
    +eyeNotFound:
    RTS

    ;; Eye found, change action step to opened
    +eyeFound:
    STX temp
    ChangeActionStep temp, #$01
    RTS


subBossLightEye:
    ;; Light up eye
    CreateObject [X], [Y], [OBJ_EYEFIRE], #$00
    RTS

    
subBossFireball:
    ;; Shoot a fireball from the eye
    CreateObject [X], [Y], [OBJ_EYEBALL], #$00
    RTS
    
subBossCloseEye:
    ;; Close eye
    CreateObject [X], [Y], [OBJ_EYE], #$02
    RTS

subBossScrollOut:
    ;; Scroll boss off screen. Because this is a per-frame action,
    ;; based on phase number, there's no action to take here.
    RTS
    
subBossDrop:
    ;; Drop a fireball from the sky
    CreateObject [X], [Y], [OBJ_FROM_SKY], #$00
    ;; [@TODO] check if x register holds object slot
    JSR getRandomNumberToo
    AND #$07
    LSR
    LSR
    LSR
    LSR
    LSR
    STA Object_y_hi,x
    RTS
    
subBossEnd:
    ;; Reset the boss phase index
    LDA #$00
    STA bossPhase
    RTS


;; Test constants to play with (or quickly test) phase speeds
TEST_SPEED   = $10
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