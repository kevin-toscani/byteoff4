    LDA Object_type,x
    CMP #$20
    BNE +notChute
        PlaySound #_sfx_bossLaunch
        LDA #$1E
        STA tempA
        LDA Object_x_hi,x
        SEC
        SBC #$04
        JMP +storeTempx
        
    +notChute:
    CMP #$1E
    BNE +notFlyingBall
        PlaySound #_sfx_flyingFire
        LDA #$1D
        STA tempA
        LDA Object_x_hi,x
        CLC
        ADC #$0C
        JMP +storeTempx
    
    +notFlyingBall:
    CMP #$17
    BNE +notPlane
        PlaySound #_sfx_flyingFire
        LDA #$25
        STA tempA
        LDA Object_x_hi,x
        CLC
        ADC #$0C
        JMP +storeTempx
        
    +notPlane:
        PlaySound #_sfx_smallFire
        LDA #$14
        STA tempA
        LDA Object_x_hi,x
        CLC
        ADC #$03
        ;JMP +storeTempx

    +storeTempx:
        STA tempx

    LDA Object_y_hi,x
    STA tempy
    
    LDA Object_screen,x
    STA tempC

    CreateObjectOnScreen tempx, tempy, tempA, #$00, tempC
