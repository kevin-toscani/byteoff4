TextLibrary_lo: .db #$00
TextLibrary_hi: .db #$00



;; Defined constants for the intro text table actions
INTRO_SPACE = $00
INTRO_NL    = $40
INTRO_BIP   = $41
INTRO_PAUSE = $42
INTRO_CLEAR = $43     
INTRO_END   = $4F

tblIntroText:
    .db #INTRO_PAUSE, #$10
    .db #INTRO_BIP, #INTRO_BIP, #INTRO_BIP
    .db #INTRO_END