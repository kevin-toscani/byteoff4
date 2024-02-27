doUpdateBackgroundPalette:
    ;; Update palette data (bit-0)
    LDA updateScreenData
    ORA #%00000001
    STA updateScreenData
    RTS