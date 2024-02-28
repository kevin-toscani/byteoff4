doDrawCharacter:
    ;Acc holds chr ID to draw
    STA scrollUpdateRam+2
    LDA introPPU
    STA scrollUpdateRam
    LDA introPPU+1
    STA scrollUpdateRam+1
    LDA #$03

    STA maxScrollOffsetCounter
    INC introPPU+1

    LDA updateScreenData
    ORA #%00000100
    STA updateScreenData
    RTS