TextLibrary_lo: .db $00
TextLibrary_hi: .db $00


tblChannelTwo:      .db $00, $FF
tblCursorYPosition: .db $8F, $A7


tblCamShake:
    .db 0,3,3,0,0,3,3,0
    .db 0,2,2,2,0,0,0,2
    .db 2,2,0,0,0,2,2,0
    .db 0,2,2,0,0,1,1,0
    .db 0,1,1,0,0,1,0,1
    .db 0,1,0,0
tblCamShakeEnd:


tblBossDeadPal:
    .db $0d, $0d
    .db $0d, $0d
    .db $0d, $06
    .db $06, $16
    .db $06, $16
