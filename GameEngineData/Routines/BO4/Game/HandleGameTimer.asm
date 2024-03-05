    LDA userScreenByte0
    BEQ +dontUpdateAnimatedTiles ;;making sure that this screen actually has animated tiles set up - thanks CGT
    DEC animTimer
    LDA animTimer
    BNE +dontUpdateAnimatedTiles
        LDA #$08
        STA animTimer
        INC animFrame
        LDA animFrame
        CMP #$03 ;;has it gone over the number of banks we filled?
        BEQ +resetAnimation
            SwitchCHRBank animFrame
            JMP +dontUpdateAnimatedTiles
        +resetAnimation
        LDA #$00
        STA animFrame
        SwitchCHRBank #$00
    +dontUpdateAnimatedTiles