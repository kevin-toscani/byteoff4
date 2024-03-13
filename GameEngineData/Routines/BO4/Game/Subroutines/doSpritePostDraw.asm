
;; Screen 0: (default screens)
    LDA screenType
    BNE +nextScreen
        JMP +done
    
    
;; Screen 1: KEVIN81
+nextScreen:    
    CMP #$01
    BEQ +
        JMP +nextScreen
    +
    
    ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0A
    STA bckPal+14
    LDA #$1A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait 8 frames, then load the final colors
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0A
    STA bckPal+13
    LDA #$1A
    STA bckPal+14
    LDA #$2A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait $88 frames, then fade out
    LDX #$88
    JSR doWaitXFrames

    LDA #$0F
    STA bckPal+13
    LDA #$0A
    STA bckPal+14
    LDA #$1A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0F
    STA bckPal+14
    LDA #$0A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait 8 frames, then warp to the next screen
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0F
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames
    
    WarpToScreen #$00, #$E1, #$01
    JMP +done

    
;; Screen 2: BYTE OFF 4
+nextScreen:
    CMP #$02
    BEQ +
        JMP +nextScreen
    +
    
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$00
    STA bckPal+3
    STA bckPal+7
    JSR doUpdateBackgroundPalette
    
    LDX #$08
    JSR doWaitXFrames

    LDA #$10
    STA bckPal+3
    STA bckPal+7
    LDA #$00
    STA bckPal+2
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames

    LDA #$20
    STA bckPal+3
    STA bckPal+7
    LDA #$10
    STA bckPal+2
    LDA #$00
    STA bckPal+1
    STA bckPal+5
    JSR doUpdateBackgroundPalette
    
    LDX #$88
    JSR doWaitXFrames

    LDA #$10
    STA bckPal+3
    STA bckPal+7
    LDA #$00
    STA bckPal+2
    LDA #$0F
    STA bckPal+1
    STA bckPal+5
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames

    LDA #$00
    STA bckPal+3
    STA bckPal+7
    LDA #$0F
    STA bckPal+2
    JSR doUpdateBackgroundPalette
    
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0F
    STA bckPal+3
    STA bckPal+7
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames
    
    WarpToScreen #$00, #$E2, #$01
    JMP +done

;; Screen 3: ZAPHYROX-B04 INTRODUCTION
+nextScreen:
    CMP #$03
    BEQ +
        JMP +nextScreen
    +
    
    .include "Routines/BO4/Game/IntroHandler.asm"
    JMP +done


;; Screen 4: END SCREEN
+nextScreen:
    CMP #$04
    BEQ +
        JMP +nextScreen
    +

    ;; Draw robo sprites on screen
    DrawSprite #$89, #$6D, #$82, #$02
    DrawSprite #$91, #$6D, #$83, #$02
    DrawSprite #$99, #$6D, #$84, #$02

    DrawSprite #$89, #$75, #$92, #$00
    DrawSprite #$91, #$75, #$93, #$00
    DrawSprite #$99, #$75, #$94, #$00

    DrawSprite #$89, #$7D, #$A2, #$00
    DrawSprite #$91, #$7D, #$A3, #$00
    DrawSprite #$99, #$7D, #$A4, #$00
    
    ;; Draw disco ball on screen
    DrawSprite #$9F, #$7C, #$90, #$01
    DrawSprite #$A7, #$7C, #$91, #$01
    DrawSprite #$9F, #$84, #$A0, #$01
    DrawSprite #$A7, #$84, #$A1, #$01

    ;; Draw eyes on face
    DrawSprite #$6D, #$65, #$80, #$00
    DrawSprite #$79, #$65, #$81, #$00
    ;rawSprite Xpos, Ypos, Chr#, Attr
    
    JMP +done

    
;; Screen 5: MENU SCREEN
+nextScreen:
    CMP #$05
    BEQ +
        JMP +nextScreen
    +

    LDA introTimer
    BEQ +
        CMP #1
        BNE ++
            WarpToScreen #$00, #$DF, #$01
        ++
        DEC introTimer
    +
    

    LDA bo4Flags
    AND #%00000010
    BNE +
        JMP +updateSprites
    +

    LDX #$0C
    LDY #$08 ; instead of spriteRamPointer because NESMaker
    
    -objectLoop:
        ;; Push X to stack
        TXA
        PHA

        ;; Set Y-coordinate
        -
            JSR doGetRandomNumberToo
            AND #$3F
            CMP #$30
        BCS -
        CLC
        ADC #$2C
        STA $0200,y
        INY

        ;; Set big or small star
        JSR doGetRandomNumberToo
        AND #$01
        CLC
        ADC #$85
        STA $0200,y
        INY
        
        ;; Set attribute ($21)
        LDA #$21
        STA $0200,y
        INY

        ;; Set X-coordinate
        -
            JSR doGetRandomNumberToo
            CMP #$B0
        BCS -
        ADC #$20
        STA $0200,y
        INY

        PLA
        TAX
        
        DEX
    BNE -objectLoop
    STY spriteRamPointer
    
    LDA bo4Flags
    AND #%11111101
    STA bo4Flags
    JMP +done


    +updateSprites:

    LDX #$0C
    LDY spriteRamPointer
    -objectLoop:
        TXA
        PHA

        LDX $0203,y
        INX
        INX
        LDA $0201,y
        CMP #$86
        BEQ +
            INX
        +
        TXA
        STA $0203,y

        CPX #$D0
        BCC +
            LDA #$20
            STA $0203,y
            -
                JSR doGetRandomNumberToo
                AND #$3F
                CMP #$30
            BCS -
            CLC
            ADC #$2C
            STA $0200,y
        +
        
        INY
        INY
        INY
        INY
        
        PLA
        TAX
        DEX
    BNE -objectLoop
    STY spriteRamPointer
    
    JMP +done


;; Screen 6: 16x16 BUFFER SCREEN
+nextScreen:    
    CMP #$06
    BEQ +
        JMP +nextScreen
    +
    WarpToScreen #$00, #$00, #$01
    JMP +done
    

;; SCREEN 8 - BOSS FIGHT
+nextScreen:
    CMP #$08
    BEQ +
        JMP +nextScreen
    +
    
    DEC bossTimer
    BNE +
        INC bossPhase
        LDX bossPhase
        LDA tblBossPhaseTimer,x
        STA bossTimer
        
        LDA tblBossPhaseActionLo,x
        STA temp16
        LDA tblBossPhaseActionHi,x
        STA temp16+1
        JSR doTemp16
    +
    JMP +done
  
.include "Routines\BO4\Game\BossPhases.asm"



;; Future screens go here
+nextScreen:



+done:

    ;; Draw sprite HUD
    LDA ScreenFlags00
    AND #%01000000
    BEQ +
        JMP +done
    +
    
    LDA myLives
    CLC
    ADC #$27
    STA temp
    
    ;DrawSprite #$10, #$16, #$17, #$00
    ;DrawSprite #$18, #$16, #$18, #$00
    ;DrawSprite #$20, #$16, temp, #$00
    DrawSprite #$18, #$3A, temp, #$00
    
    LDX myHealth
    LDA tblTopHud,x
    STA temp
    DrawSprite #$18, #$20, temp, #$00
    
    LDA tblMidHud,x
    STA temp
    DrawSprite #$18, #$28, temp, #$00

    LDA tblBotHud,x
    STA temp
    DrawSprite #$18, #$30, temp, #$00

    JMP +drawZapperHud
    
tblTopHud:    .db #$32, #$32, #$32, #$32, #$32, #$31, #$30
tblMidHud:    .db #$42, #$42, #$42, #$41, #$40, #$40, #$40
tblBotHud:    .db #$52, #$51, #$50, #$50, #$50, #$50, #$50

tblTopZapHud: .db #$33, #$34, #$35, #$35, #$35, #$35, #$35
tblMidZapHud: .db #$43, #$43, #$43, #$44, #$45, #$45, #$45
tblBotZapHud: .db #$53, #$53, #$53, #$53, #$53, #$54, #$55

+drawZapperHud:
    
    ;; Check for 2 player mode
    LDA gameMode
    AND #$01
    BNE +
        JMP +done
    +
    
    ;; Draw zapper HUD
    LDA zapperTimer  ; $6F max
    LSR
    LSR
    LSR
    LSR
    TAX

    LDA tblTopZapHud,x
    STA temp
    DrawSprite #$D8, #$20, temp, #$00
    
    LDA tblMidZapHud,x
    STA temp
    DrawSprite #$D8, #$28, temp, #$00

    LDA tblBotZapHud,x
    STA temp
    DrawSprite #$D8, #$30, temp, #$00
    
+done: