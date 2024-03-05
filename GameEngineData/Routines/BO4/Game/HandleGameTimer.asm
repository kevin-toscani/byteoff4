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
    
    LDA disabledTimer
    BEQ +
        AND #%11111000
        BNE ++
        LDX player1_object
        LDA Object_direction,x
        BPL ++
            AND #%01111111
            STA Object_direction,x
        ++
        DEC disabledTimer
        BNE +
        LDA bo4Flags
        AND #%01111111
        STA bo4Flags
    +