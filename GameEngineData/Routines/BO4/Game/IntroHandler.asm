DOT_TILE_ID                  = $E4
SPACE_TILE_ID                = $B0
DEFAULT_CHARACTER_PAUSE_TIME = $02
ARBITRARY_PAUSE_LENGTH       = $0A
SPEAK_TIMER_SPEED            = $03


    ;; Only handle intro on screen type 3
    LDA screenType
    CMP #$03
    BEQ +
        JMP +done
    +

    ;; Only handle intro if timer is zero
    LDA introTimer
    BEQ +
        JMP +done
    +

    ;; Check intro pointer
    LDX introPointer
    LDA tblIntroText,x
    BEQ +drawSpace
    BMI +drawCharacter

    CMP #$40
    BCS +
        JMP +updateFacialExpression
    +

    AND #$0F
    BEQ +newLine

    CMP #$01
    BEQ +doBip

    CMP #$02
    BEQ +setPause

    CMP #$03
    BEQ +clearText

    JMP +doEnd

+doBip:
    PlaySound #_sfx_bip
    LDA #ARBITRARY_PAUSE_LENGTH
    STA introTimer
    LDA #DOT_TILE_ID
    JMP +drawCharacter

+drawSpace:
    INC speakTimer
    LDA #SPACE_TILE_ID

+drawCharacter:
    STA scrollUpdateRam+2
    LDA introPPU
    STA scrollUpdateRam
    LDA introPPU+1
    STA scrollUpdateRam+1
    LDA #$03
    STA maxScrollOffsetCounter
    INC introPPU+1
    DEC speakTimer
    JMP +doPause

+newLine:
    ;; [@TODO] Move introPPU+1 to the next line
    ;; Correct high byte with carry
    LDA introPPU
    ADC #$00
    STA introPPU
    JMP +doPause

+clearText:
    ;; [@TODO] Clear the text area
    JMP +doPause

+updateFacialExpression:
    ;; [@TODO] update sprite data based on lower A nybble
    JMP +doPause

+setPause:
    INX
    STX introPointer
    LDA tblIntroText,x
    JMP +applyPause

+doPause:
    LDA #DEFAULT_CHARACTER_PAUSE_TIME

+applyPause:
    STA introTimer

    LDA speakTimer
    BNE +
        JSR doGetRandomNumber
        AND #$03
        CLC
        ADC #_sfx_speakA
        STA temp
        PlaySound temp
        LDA #SPEAK_TIMER_SPEED
        STA speakTimer
    +

    INC introPointer
    JMP +done

+doEnd:
    WarpToScreen #$00, #$E3, #$01

+done: