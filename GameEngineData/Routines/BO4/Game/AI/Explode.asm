
    DestroyObject
    
    LDA Object_x_hi,x
    SEC
    SBC #$04
    STA tempx

    LDA Object_y_hi,x
    CLC
    ADC #$08
    STA tempy

    LDA #$00
    STA tempC

    CreateObjectOnScreen tempx, tempy, #$1A, #$00, tempC
    PlaySound #_sfx_explosion