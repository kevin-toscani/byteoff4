
    DestroyObject
    
    LDA screenType
    CMP #$08
    BNE +
        LDA #$1A
        JMP ++
    +
    LDA #$24
    ++
    STA tempA
    
    LDA Object_x_hi,x
    SEC
    SBC #$04
    STA tempx

    LDA Object_y_hi,x
    CLC
    ADC #$08
    STA tempy

    LDA Object_screen,x
    STA tempC

    CreateObjectOnScreen tempx, tempy, tempA, #$00, tempC
    PlaySound #_sfx_explosion