
;; Screen 0: by default, do not take any extra actions post screen load
    LDA screenType
    BNE +nextScreen
        JMP +done
    
;; Screen 1: KEVIN81
+nextScreen:

    ; Disabled Raw PCM test
    ; .include "Routines/BO4/Sound/pcm_test.asm"

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



;; Next screen: [tba]
+nextScreen:


+done: