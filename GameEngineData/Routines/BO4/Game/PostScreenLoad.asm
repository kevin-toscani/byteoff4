
;; Screen 0: by default, do not take any extra actions post screen load
    LDA screenType
    BNE +screen01
        JMP +done
    
;; Screen 1: KEVIN81
+screen01:
    CMP #$01
    BNE +screen02

    LDA #$0F
    STA bckPal+13
    STA bckPal+14
    STA bckPal+15
    JSR doUpdateBackgroundPalette
    JMP +done


;; Screen 2: BYTE OFF 4
+screen02:
    CMP #$02
    BNE +screen03

    LDA #$0F
    STA bckPal+1
    STA bckPal+2
    STA bckPal+3
    STA bckPal+5
    STA bckPal+7
    JSR doUpdateBackgroundPalette
    JMP +done


+screen03:


+done: