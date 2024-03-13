TextLibrary_lo: .db $00
TextLibrary_hi: .db $00

tblChannelTwo:      .db $00, $FF
tblCursorYPosition: .db $8F, $A7

tblBossPhaseTimer:
    .db $10, $10, $10
    .db $10, $10, $10
    .db $10, $10, $10
    .db $10, $10, $10
    .db $10, $10
    .db $10, $10, $10
    .db $10

tblBossPhaseActionLo:
    .db #<subBossIdle,  #<subBossScrollIn, #<subBossIdle
    .db #<subBossShoot, #<subBossShoot, #<subBossShoot
    .db #<subBossLaunch, #<subBossIdle, #<subBossOpenEye
    .db #<subBossLightEye, #<subBossFireball, #<subBossCloseEye
    .db #<subBossScrollOut, #<subBossIdle
    .db #<subBossDrop, #<subBossDrop, #<subBossDrop
    .db #<subBossEnd

tblBossPhaseActionHi:
    .db #>subBossIdle,  #>subBossScrollIn, #>subBossIdle
    .db #>subBossShoot, #>subBossShoot, #>subBossShoot
    .db #>subBossLaunch, #>subBossIdle, #>subBossOpenEye
    .db #>subBossLightEye, #>subBossFireball, #>subBossCloseEye
    .db #>subBossScrollOut, #>subBossIdle
    .db #>subBossDrop, #>subBossDrop, #>subBossDrop
    .db #>subBossEnd
    
