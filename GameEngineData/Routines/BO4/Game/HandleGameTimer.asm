    LDA userScreenByte0
    BNE +
        JMP +dontUpdateAnimatedTiles ;;making sure that this screen actually has animated tiles set up - thanks CGT
    +
    
    BPL +
        JMP +disappearingPlatforms
    +
    
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
        JMP +dontUpdateAnimatedTiles


;; 00-1F    CHR1
;; 20-9F    CHR0
;; A0-BF    CHR1
;; C0-FF    CHR2

+disappearingPlatforms:
    DEC platformTimer
    LDA platformTimer
    CMP #$20
    BCC +loadChr01
    
    CMP #$A0
    BCC +loadChr00
    
    CMP #$C0
    BCC +loadChr01
    
    +loadChr02:
    LDA #$02
    JMP +staTemp
    
    +loadChr01:
    LDA #$01
    JMP +staTemp
    
    +loadChr00:
    LDA #$00
    
    +staTemp:
    STA temp
    SwitchCHRBank temp

+dontUpdateAnimatedTiles:
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
    
    ;; Handle zapper timer
    LDA zapperTimer
    BEQ +
        DEC zapperTimer
        BNE +
        
        LDA bo4Flags
        AND #%10111111
        STA bo4Flags
    +
    
    ;; Zapp zapp timer
    LDA fireTimer
    BEQ +
        DEC fireTimer
    +
    
    ;; Warp timer
    LDA warpTimer
    BEQ +
        DEC warpTimer
        BNE +
        
        ;; Restore health
        LDA #$06
        STA myHealth
        
        ;; Re-enable inputs
        LDA bo4Flags
        ORA #%10000000
        STA bo4Flags
        
        ;; Warp to prepared continue point
        WarpToScreen warpToMap, warpToScreen, #$01
    +
        