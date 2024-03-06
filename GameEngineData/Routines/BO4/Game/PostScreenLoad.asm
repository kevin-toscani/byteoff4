
;; Screen 0: by default, do not take any extra actions post screen load
    LDA screenType
    BNE +nextScreen
    
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

	LDA #$00
	STA gameMode
    STA introTimer
    STA introTimer+1
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2
	CreateObject #$50, tblCursorYPosition, #$08, #$00

    LDX #$06
    -objectLoop:
        TXA
        PHA

        JSR doGetRandomNumberToo
        AND #$01
        ORA #$10
        STA temp
        
        -
            JSR doGetRandomNumberToo
            CMP #$B0
        BCS -
        ADC #$20
        STA tempx

        -
            JSR doGetRandomNumberToo
            AND #$3F
            CMP #$30
        BCS -
        CLC
        ADC #$2C
        STA tempy
       
        CreateObject tempx, tempy, temp, #$00

        PLA
        TAX
        
        DEX
    BNE -objectLoop

    JMP +done



;; Next screen: [tba]
+nextScreen:



+done: