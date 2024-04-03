pcmTestStart:
    .incbin "Routines/BO4/Sound/sample.bin"
pcmTestEnd:

doHandleGameTimer1D:
    LDA userScreenByte0
    BNE +
        JMP +doneUpdatingAnimatedTiles ;;making sure that this screen actually has animated tiles set up - thanks CGT
    +
    
    BPL +
        JMP +disappearingPlatforms
    +
    
    DEC animTimer
    LDA animTimer
    BEQ +
        JMP +doneUpdatingAnimatedTiles
    +

    LDA #$08
    STA animTimer
    
    INC animFrame
    LDA animFrame
    CMP #$03 ;;has it gone over the number of banks we filled?
    BNE +
        LDA #$00
        STA animFrame
    +

    LDA screenType
    CMP #$08
    BNE +defaultAnim

    +bossAnim:
        LDA bossPhase
        CMP #$01
        BEQ +defaultAnim
        
        CMP #$0C
        BEQ +reverseAnim
        
        LDA #$00
        JMP +switchTempChrBank

    +reverseAnim:
        LDA #$02
        SEC
        SBC animFrame
        JMP +switchTempChrBank

    +defaultAnim:
        LDA animFrame
    

    +switchTempChrBank:
        STA temp
        SwitchCHRBank temp
        JMP +doneUpdatingAnimatedTiles

            

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

+doneUpdatingAnimatedTiles:
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


    ;; Flicker screen if boss is hurt
    LDA bossPhase
    CMP #$12
    BNE +
        LDA bossTimer
        AND #$04
        BEQ +black
        
        +red:
            LDA #$26
            STA bckPal+2
            LDA #$16
            JMP +setPal
            
        +black:
            LDA #$2C
            STA bckPal+2
            LDA #$1C
            
        +setPal:
        STA bckPal+1
        JSR doUpdateBackgroundPalette
    +
    
    ;; Fade background (see ExtraTables.asm for values)
    CMP #$19
    BNE +
        LDA bossTimer
        LSR
        LSR
        LSR
        AND #%00001110
        TAX
        LDA tblBossDeadPal,x
        STA bckPal+1
        LDA tblBossDeadPal+1,x
        STA bckPal+2
        JSR doUpdateBackgroundPalette
    +


    ;; Span zappable enemies on screen
    
    ;; Only in 2P game mode
    LDA gameMode
    AND #$01
    BEQ +spawnZapEnemyDone
    
    ;; And only on default game screen types
    LDA screenType
    BNE +spawnZapEnemyDone
    
    ;; Unless there's no input available
    LDA bo4Flags
    AND #$80
    BNE +spawnZapEnemyDone

        DEC zapEnemyTimer
        BNE +spawnZapEnemyDone
        
        LDA #$3C
        STA zapEnemyTimer
        JSR doGetRandomNumberToo
        AND #$03
        BNE +spawnZapEnemyDone
        
        LDA #$B4
        STA zapEnemyTimer
        JSR doGetRandomNumberToo
        AND #$01
        CLC
        ADC #$16
        STA temp
        
        LDA camScreen
        STA tempC
        LDA #$D8
        CLC
        ADC camX
        STA tempx
        BCC +
            INC tempC
        +
        
        CreateObjectOnScreen tempx, #$20, temp, #$00, tempC

    +spawnZapEnemyDone:
    RTS
    
.org $BFFE
.dw  pcmTestEnd-pcmTestStart
