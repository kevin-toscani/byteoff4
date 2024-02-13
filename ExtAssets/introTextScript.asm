;;    00  [space]
;;    
;;    40  [ln]
;;    41  [bip]
;;    42  [pause]
;;    43  [clear]
;;    4F  [end]
;;    
;;    80  0       90 G       A0 W
;;    81  1       91 H       A1 X
;;    82  2       92 I       A2 Y
;;    83  3       93 J       A3 Z
;;    84  4       94 K       A4 .
;;    85  5       95 L       A5 &
;;    86  6       96 M       A6 :
;;    87  7       97 N       A7 ?
;;    88  8       98 O       A8 !
;;    89  9       99 P       A9 ,
;;    8A  A       9A Q       AA "
;;    8B  B       9B R       AB -
;;    8C  C       9C S       AC ...
;;    8D  D       9D T       AD 
;;    8E  E       9E U       AE 
;;    8F  F       9F V       AF 
;;    
;;    
;;    [space]...........  $00      Don't draw character, move pointer right 1 tile
;;    [ln]..............  $40      New line (move pointer to left and down 1 tile)
;;    [bip] ............  $41      Draw a period, play sfx_bip, pause for xx frames
;;    [pause][length] ..  $42 $xx  Pause output for [length] frames
;;    [clear] ..........  $43      Clear the text box
;;    [end] ............  $4F      Fade out screen, load actual game engine
;;    * ................  $80-FF   Draw character *
;;
;; play random sfx_speak[A-D] every xx characters
;;
;;


-introTextLoop:
    LDA tbl_IntroText,x
    BEQ +drawSpace         ;; $00
    BMI +drawCharacter     ;; $80-$FF

    AND #$0F
    BEQ +newLine

    CMP #$01
    BEQ +doBip

    CMP #$02
    BEQ +setPause

    CMP #$03
    BEQ +doClear

    JMP +doEnd

+doBip:
    PlaySound sfx_bip
    LDA #ARBITRARY_PAUSE_LENGTH
    STA pauseTimer
    LDA #DOT_TILE_ID
    JMP +drawCharacter

+drawSpace:
    INC speakTimer
    LDA #SPACE_TILE_ID

+drawCharacter:
    STA ramVariable+2,y
    ;; LDA high byte of PPU addr based on lineNumber & colNumber
    STA ramVariable,y
    INY
    ;; LDA low byte of PPU addr based on lineNumber & colNumber
    STA ramVariable,y
    INY
    INY
    INC colNumber
    DEC speakTimer
    JMP +doPause

+newLine:
    INC lineNumber
    LDA #START_COLUMN
    STA colNumber
    ;; LDA #$06
    ;; STA pauseTimer
    JMP doPause

+doClear:
    -
        ;; Clear row lineNumber
        JSR doWaitFrame
        DEC lineNumber
    BPL -
    JMP +doPause

+setPause:
    INX
    LDA tbl_IntroText,x
    STA pauseTimer

+doPause:
-pauseLoop:
    DEC pauseTimer
    BEQ +donePause
        JSR doWaitFrame
        JMP -pauseLoop
    +donePause:
    LDA #DEFAULT_CHARACTER_PAUSE_TIME
    STA pauseTimer

    LDA speakTimer
    BNE +
        JSR doGetRandomNumber
        AND #$03
        CLC
        ADC #sfx_speakA
        STA temp
        PlaySound temp
        LDA #SPEAK_TIMER_SPEED
        STA speakTimer
    +

    INX
    JMP -introTextLoop

+doEnd:

