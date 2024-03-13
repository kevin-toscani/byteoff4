
;; Screen 0: default screens
    LDA screenType
    BNE +nextScreen

        ;; Re-enable inputs
        LDA bo4Flags
        AND #%01111111
        STA bo4Flags

        ;; Reset player action step
        ChangeActionStep player1_object, #$00
        JMP +done
    
;; Screen 1: KEVIN81
+nextScreen:

    CMP #$01
    BNE +nextScreen

    LDA #$0F
    STA bckPal+13
    STA bckPal+14
    STA bckPal+15
    JSR doUpdateBackgroundPalette
    JMP +done


;; Screen 2: BYTE OFF 4
+nextScreen:
    CMP #$02
    BNE +nextScreen

    LDA #$0F
    STA bckPal+1
    STA bckPal+2
    STA bckPal+3
    STA bckPal+5
    STA bckPal+7
    JSR doUpdateBackgroundPalette
    JMP +done


;; Screen 3: INTRO SEQUENCE
+nextScreen:
    CMP #$03
    BNE +nextScreen

    STA speakTimer
    LDA #$00
    STA introTimer+1
    LDA #$01
    STA introTimer
    LDA #$21
    STA introPPU
    LDA #$6E
    STA introPPU+1
    JMP +done



;; Screen 4: END GAME
+nextScreen:
    CMP #$04
    BNE +nextScreen

    .include "Routines/BO4/Sound/play_sample.asm"
    TXA
    PHA
    LDX player1_object
    DestroyObject
    PLA
    TAX



;; Screen 5: MAIN MENU
+nextScreen:
    CMP #$05
    BEQ +
        JMP +nextScreen
    +

    ;; Re-enable inputs
    LDA bo4Flags
    AND #%01111111
    STA bo4Flags

    LDA #$03
    STA myLives
    LDA #$06
    STA myHealth

	LDA #$00
	STA gameMode
    STA introTimer
    STA introTimer+1
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2
	CreateObject #$50, tblCursorYPosition, #$08, #$00

    LDA bo4Flags
    ORA #%00000010
    STA bo4Flags

    JMP +done



;; Screen 6: 16x16 BUFFER SCREEN
;; (no action needed)



;; Screen 7: GAME OVER
+nextScreen:
    CMP #$07
    BEQ +
        JMP +nextScreen
    +

    LDA #$FF
    STA warpTimer
    JMP +done



;; Next screen: [tba]
+nextScreen:



+done: