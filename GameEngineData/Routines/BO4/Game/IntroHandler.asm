DOT_TILE_ID                  = $F4
SPACE_TILE_ID                = $C0
DEFAULT_CHARACTER_PAUSE_TIME = $04
ARBITRARY_PAUSE_LENGTH       = $0A
SPEAK_TIMER_SPEED            = $04


    ;; Only handle intro if timer is zero
    DEC introTimer
    BEQ +
        JMP +drawEyes
    +

    ;; Check intro pointer
    LDX introPointer
    LDA introPointer+1
    BEQ +
        LDA tblIntroText2,x
        JMP ++
    +
    LDA tblIntroText,x
    ++
    BEQ +drawSpace
    BMI +drawCharacter

    CMP #$40
    BCS +
        JMP +updateFacialExpression
    +

    AND #$0F
    BEQ lblIntroNewLine
    
    TAY
    LDA tblIntroPointerHi,y
    STA temp16+1
    LDA tblIntroPointerLo,y
    STA temp16
    JMP (temp16)


+drawSpace:
    INC speakTimer
    LDA #SPACE_TILE_ID

+drawCharacter:
    JSR doDrawCharacter
    DEC speakTimer
    JMP +doPause



lblIntroDoBip:
    PlaySound #_sfx_bip
    LDA #ARBITRARY_PAUSE_LENGTH
    STA introTimer
    LDA #DOT_TILE_ID
    JSR doDrawCharacter
    JMP +incrementPointer



lblIntroNewLine:
    ;; Move introPPU+1 to the next line
    ;; A line starts at 4E, 6E, 8E, ...
    ;; so:
    ;;     (4E-5F)    should go to 6E [4E + 20]
    ;;     (6E-7F)    should go to 8E [6E + 20]
    ;; or, applying logic:
    ;;     %abcxxxxx  should go to %abc01110 + $20
    ;;                    which is %abc00000 + $2E
    ;; therefore:
    LDA introPPU+1
    AND #%11100000
    CLC
    ADC #%00101110
    STA introPPU+1

    ;; Correct high byte with carry
    LDA introPPU
    ADC #$00
    STA introPPU
    
    INC speakTimer
    JMP +doPause


+updateFacialExpression:
    AND #$0F
    STA introEyeDraw
    INC introTimer
    JMP +incrementPointer

lblIntroSetPause:
    INX
    ; BNE +
    ; INC introPointer+1
    ; +
    STX introPointer
    LDA introPointer+1
    BEQ +
        LDA tblIntroText2,x
        JMP ++
    +
    LDA tblIntroText,x
    ++
    STA introTimer
    JMP +incrementPointer

+doPause:
    LDA #DEFAULT_CHARACTER_PAUSE_TIME
    STA introTimer
    LDA speakTimer
    BNE +
        JSR doGetRandomNumberToo
        AND #$03
        CLC
        ADC #_sfx_speakA
        STA temp
        PlaySound temp
        LDA #SPEAK_TIMER_SPEED
        STA speakTimer
    +
    JMP +incrementPointer


lblIntroDoEnd:
    LDA #$00
    STA introEyeDraw
    WarpToScreen #$00, #$E3, #$01
    JMP +drawEyes


lblIntroClearText:
    LDA #$21
    STA introPPU
    LDA #$6E
    STA introPPU+1
    
    LDA #10
    STA tempx
    -outer:
        LDY #$00    
        -inner:
            ;; Draw empty space at PPU pointer address
            LDA introPPU
            STA scrollUpdateRam,y
            INY
            LDA introPPU+1
            STA scrollUpdateRam,y
            INY
            LDA #SPACE_TILE_ID
            STA scrollUpdateRam,y
            INC introPPU+1
            INY
            CPY #48 ;; 16 characters x 3 bytes = 48
        BNE -inner

        ;; Clear line on screen
        STY maxScrollOffsetCounter
        LDA updateScreenData
        ORA #%00000100
        STA updateScreenData
        JSR doDrawEyes
        JSR doWaitFrame

        ;; Move PPU pointer to next line
        LDA introPPU+1
        AND #%11100000
        CLC
        ADC #%00101110
        STA introPPU+1
        LDA introPPU
        ADC #$00
        STA introPPU
        
        ;; Check next row
        DEC tempx
    BNE -outer

    LDA #$21
    STA introPPU
    LDA #$6E
    STA introPPU+1
    LDA #$20
    STA introTimer
    JMP +incrementPointer

lblIntroScreenOn:
    ;; Load new palette
    LoadBackgroundPalettes #$04
    
    ;; Tell game to draw default eyes at default position
    LDA #$01
    STA introEyeDraw

    ;; Update next frame
    INC introTimer

+incrementPointer:
    INC introPointer
    BNE +
        INC introPointer+1
    +
    JMP +drawEyes




;; Defined constants for the intro text table actions
INTRO_SPACE     = $00
INTRO_NL        = $40
INTRO_BIP       = $41
INTRO_PAUSE     = $42
INTRO_CLEAR     = $43     
INTRO_SCREEN_ON = $44
INTRO_END       = $4F
INTRO_EYE       = $20

;; Defined constants for the character set used
NMBR    = $D0
LTTR    = $D9
L_DOT   = $F4
L_QMARK = $F7
L_EXCL  = $F8
L_COMMA = $F9
L_APOS  = $FA
L_DASH  = $FB

tblIntroText:
    ; $00-$3F
    .db INTRO_PAUSE, $80, INTRO_SCREEN_ON, INTRO_PAUSE, $28, INTRO_BIP, INTRO_BIP, INTRO_BIP       ; ppopp...
    .db INTRO_PAUSE, $20, INTRO_SPACE, LTTR+8, LTTR+5, LTTR+12, LTTR+12, LTTR+15                   ; pp_HELLO
    .db L_QMARK, INTRO_PAUSE, $20, INTRO_NL, INTRO_NL, LTTR+23, LTTR+8, LTTR+15, L_APOS            ; ?ppnnWHO'
    .db INTRO_EYE+3, LTTR+19, INTRO_EYE+1, INTRO_SPACE, LTTR+20, LTTR+8, LTTR+5, LTTR+18           ; iSi_THER
    .db LTTR+5, L_QMARK, INTRO_PAUSE, $40, INTRO_EYE+3, INTRO_SPACE, INTRO_EYE+1                   ; E?ppi_i
    .db INTRO_PAUSE, $16, INTRO_CLEAR, INTRO_EYE+4, LTTR+8, LTTR+9, INTRO_SPACE, LTTR+20           ; ppciHI_T
    .db LTTR+8, LTTR+5, LTTR+18, LTTR+5, L_COMMA, INTRO_SPACE, INTRO_PAUSE, $0A                    ; HERE,_pp
    .db LTTR+19, LTTR+16, LTTR+1, LTTR+3, LTTR+5, INTRO_NL, LTTR+20, LTTR+18                       ; SPACE_TR

    ; $40-80
    .db LTTR+1, LTTR+22, LTTR+5, LTTR+12, LTTR+5, LTTR+18, L_EXCL, INTRO_SPACE                     ; AVELER!_
    .db INTRO_PAUSE, $30, INTRO_EYE+1, INTRO_NL, INTRO_NL, LTTR+13, LTTR+25, INTRO_SPACE, LTTR+14  ; ppinnMY_N
    .db LTTR+1, LTTR+13, INTRO_EYE+3, LTTR+5, INTRO_EYE+1, INTRO_SPACE, LTTR+9, LTTR+19            ; AMiEi_IS
    .db INTRO_NL, LTTR+26, LTTR+1, LTTR+16, LTTR+8, LTTR+25, LTTR+18, LTTR+15                      ; nZAPHYRO
    .db LTTR+24, INTRO_EYE+3, L_DASH, INTRO_EYE+1, LTTR+2, NMBR+0, NMBR+4, L_COMMA                 ; Xi-iB04,
    .db INTRO_PAUSE, $18, INTRO_NL, LTTR+2, LTTR+21, LTTR+20, INTRO_SPACE, LTTR+25                 ; ppnBUT_Y
    .db LTTR+15, LTTR+21, INTRO_SPACE, LTTR+3, LTTR+1, LTTR+14, INTRO_NL, LTTR+3                   ; OU_CAN_C
    .db LTTR+1, INTRO_EYE+3, LTTR+12, INTRO_EYE+1, LTTR+12, INTRO_SPACE, LTTR+13, LTTR+5           ; AiLiL_ME
    
    ; $81-C0
    .db INTRO_SPACE, LTTR+26, LTTR+1, LTTR+16, LTTR+16, L_DOT, INTRO_PAUSE, $60                    ; _ZAPP.pp
    .db INTRO_CLEAR, INTRO_EYE+4, LTTR+23, LTTR+5, LTTR+12, LTTR+3, LTTR+15, LTTR+13               ; ciWELCOM
    .db LTTR+5, INTRO_SPACE, LTTR+20, LTTR+15, INTRO_NL, LTTR+16, LTTR+12, LTTR+1                  ; E_TOnPLA
    .db LTTR+14, LTTR+5, LTTR+20, INTRO_SPACE, LTTR+14, LTTR+5, LTTR+13, LTTR+1                    ; NET_NEMA
    .db LTTR+18, LTTR+5, LTTR+24, L_EXCL, INTRO_PAUSE, $60, INTRO_CLEAR, INTRO_EYE+1               ; REX!ppci
    .db LTTR+23, LTTR+5, L_APOS, LTTR+22, LTTR+5, INTRO_SPACE, LTTR+7, LTTR+15                     ; WE'VE_GO
    .db LTTR+20, INTRO_SPACE, LTTR+15, LTTR+14, LTTR+5, INTRO_PAUSE, $1A, INTRO_BIP                ; T_ONEppb
    .db INTRO_BIP, INTRO_BIP, INTRO_PAUSE, $20, INTRO_EYE+2, INTRO_NL, LTTR+20, LTTR+9             ; bbppinTI

    ; $C1-FF
    .db LTTR+14, LTTR+25, INTRO_SPACE, LTTR+16, LTTR+18, LTTR+15, LTTR+2, LTTR+12                  ; NY_PROBL
    .db LTTR+5, LTTR+13, INTRO_NL, LTTR+20, LTTR+8, LTTR+15, LTTR+21, LTTR+7                       ; EMnTHOUG
    .db LTTR+8, INTRO_BIP, INTRO_BIP, INTRO_BIP, INTRO_PAUSE, $50, INTRO_EYE+3                     ; Hbbbppi
    .db INTRO_NL, INTRO_NL, LTTR+15, INTRO_EYE+5, LTTR+21, LTTR+18, INTRO_SPACE, LTTR+16           ; nnOiUR_P
    .db LTTR+12, LTTR+1, LTTR+14, LTTR+5, LTTR+20, INTRO_SPACE, LTTR+8, LTTR+1                     ; LANET_HA
    .db LTTR+19, INTRO_NL, LTTR+2, LTTR+5, LTTR+5, LTTR+14, INTRO_SPACE, LTTR+9                    ; SnBEEN_I
    .db LTTR+14, LTTR+22, LTTR+1, LTTR+4, LTTR+5, LTTR+4, INTRO_SPACE, LTTR+2                      ; NVADED_B
    .db LTTR+25, INTRO_NL, LTTR+5, LTTR+22, LTTR+9, LTTR+12, INTRO_SPACE, LTTR+1                   ; YnEVIL_A
    
tblIntroText2:
    ; $00-3F
    .db LTTR+12, LTTR+9, LTTR+5, LTTR+14, LTTR+19, L_EXCL, INTRO_PAUSE, $60                        ; LIENS!pp
    .db INTRO_CLEAR, INTRO_EYE+1, LTTR+9, INTRO_SPACE, LTTR+3, LTTR+1, LTTR+14, INTRO_SPACE        ; ciI_CAN_
    .db LTTR+20, LTTR+18, INTRO_EYE+3, LTTR+25, INTRO_EYE+1, INTRO_SPACE, LTTR+1, LTTR+14          ; TRiYi_AN
    .db LTTR+4, INTRO_NL, LTTR+6, LTTR+9, LTTR+7, LTTR+8, LTTR+20, INTRO_SPACE                     ; DnFIGHT_
    .db LTTR+20, LTTR+8, LTTR+5, LTTR+13, INTRO_SPACE, LTTR+15, LTTR+6, LTTR+6                     ; THEM_OFF
    .db INTRO_NL, LTTR+2, LTTR+25, INTRO_SPACE, LTTR+13, LTTR+25, INTRO_EYE+3, LTTR+19             ; nBY_MYiS
    .db INTRO_EYE+1, LTTR+5, LTTR+12, LTTR+6, L_COMMA, INTRO_PAUSE, $24, INTRO_NL                  ; iELF,ppn
    .db LTTR+2, LTTR+21, LTTR+20, INTRO_BIP, INTRO_BIP, INTRO_BIP, INTRO_PAUSE, $40                ; BUTbbbpp

    ; $40-62
    .db INTRO_EYE+4, INTRO_NL, INTRO_NL, LTTR+13, LTTR+1, LTTR+25, LTTR+2, LTTR+5                  ; innMAYBE
    .db INTRO_SPACE, LTTR+25, LTTR+15, LTTR+21, INTRO_SPACE, LTTR+23, LTTR+15, LTTR+21             ; _YOU_WOU
    .db LTTR+12, LTTR+4, INTRO_NL, LTTR+12, LTTR+9, LTTR+11, LTTR+5, INTRO_SPACE                   ; LDnLIKE_
    .db LTTR+20, LTTR+15, INTRO_SPACE, LTTR+8, LTTR+5, LTTR+12, LTTR+16, L_QMARK                   ; TO_HELP?
    .db INTRO_PAUSE, $80, #INTRO_END                                                               ; ppx
    
    
tblIntroPointerHi:
    .db #>lblIntroNewLine, #>lblIntroDoBip, #>lblIntroSetPause, #>lblIntroClearText
    .db #>lblIntroScreenOn, #>lblIntroDoEnd, #>lblIntroDoEnd, #>lblIntroDoEnd
    .db #>lblIntroDoEnd, #>lblIntroDoEnd, #>lblIntroDoEnd, #>lblIntroDoEnd
    .db #>lblIntroDoEnd, #>lblIntroDoEnd, #>lblIntroDoEnd, #>lblIntroDoEnd

tblIntroPointerLo:
    .db #<lblIntroNewLine, #<lblIntroDoBip, #<lblIntroSetPause, #<lblIntroClearText
    .db #<lblIntroScreenOn, #<lblIntroDoEnd, #<lblIntroDoEnd, #<lblIntroDoEnd
    .db #<lblIntroDoEnd, #<lblIntroDoEnd, #<lblIntroDoEnd, #<lblIntroDoEnd
    .db #<lblIntroDoEnd, #<lblIntroDoEnd, #<lblIntroDoEnd, #<lblIntroDoEnd

tblIntroEyeX:   .db $00, $22, $25, $22, $22, $22
tblIntroEyeY:   .db $00, $5C, $59, $5C, $5F, $5C
tblIntroEyeChr: .db $00, $B0, $B0, $B2, $B4, $B6

doDrawEyes:
    ;; Check if eyes should be drawn
    LDA introEyeDraw
    BNE +
        JMP +done
    +

    ;; Draw eyes
    LDY spriteRamPointer
    TAX
    
    ;; Set sprite X
    LDA tblIntroEyeX,x
    STA SpriteRam+3,y
    STA SpriteRam+11,y
    CLC
    ADC #$08
    STA SpriteRam+7,y
    STA SpriteRam+15,y
    CLC
    ADC #$10
    STA SpriteRam+19,y
    STA SpriteRam+27,y
    CLC
    ADC #$08
    STA SpriteRam+23,y
    STA SpriteRam+31,y
    
    ;; Set sprite Y
    LDA tblIntroEyeY,x
    STA SpriteRam+0,y
    STA SpriteRam+4,y
    STA SpriteRam+16,y
    STA SpriteRam+20,y
    CLC
    ADC #$08
    STA SpriteRam+8,y
    STA SpriteRam+12,y
    STA SpriteRam+24,y
    STA SpriteRam+28,y

    ;; Set sprite chr
    LDA tblIntroEyeChr,x
    STA SpriteRam+1,y
    STA SpriteRam+17,y

    CLC
    ADC #$01
    STA SpriteRam+5,y
    STA SpriteRam+21,y

    CLC
    ADC #$0F
    STA SpriteRam+9,y
    STA SpriteRam+25,y

    CLC
    ADC #$01
    STA SpriteRam+13,y
    STA SpriteRam+29,y
    
    ;; Set sprite attr
    LDA #$00
    STA SpriteRam+2,y
    STA SpriteRam+6,y
    STA SpriteRam+10,y
    STA SpriteRam+14,y
    STA SpriteRam+18,y
    STA SpriteRam+22,y
    STA SpriteRam+26,y
    STA SpriteRam+30,y
    
    TYA
    CLC
    ADC #32
    STA spriteRamPointer
    RTS


doGetRandomNumberToo:
    lda randomSeed1
    beq +doEor
    asl
    beq +noEor
    bcc +noEor
    +doEor: eor #$1d
    +noEor: sta randomSeed1
    rts


+drawEyes:
    JSR doDrawEyes
    
    
+done: