subBossIdle:
    RTS

subBossScrollIn:
    ;; [@TODO] Scroll boss into screen
    RTS
    
subBossShoot:
    ;; [@TODO] Shoot a bouncy ball
    RTS
    
subBossLaunch:
    LDA gameMode
    AND #$01
    BEQ +onePlayerMode
        ;; [@TODO] Launch a flying ball
        RTS
        
    ;; Skip two phases
    +onePlayerMode:
    INC bossPhase
    INC bossPhase
    RTS

subBossOpenEye:
    ;; [@TODO] Open eye
    RTS

subBossLightEye:
    ;; [@TODO] Light up eye
    RTS
    
subBossFireball:
    ;; [@TODO] Shoot a fireball from the eye
    RTS
    
subBossCloseEye:
    ;; [@TODO] Close eye
    RTS

subBossScrollOut:
    ;; [@TODO] Scroll boss off screen
    
subBossDrop:
    ;; [@TODO] Drop a fireball from the sky

subBossEnd:
    LDA #$00
    STA bossPhase
    RTS