
    LDA Object_x_hi,x
    CLC
    ADC #$03
    STA tempx

    LDA Object_y_hi,x
    STA tempy
    
    LDA Object_screen,x
    STA tempC

    CreateObjectOnScreen tempx, tempy, #$14, #$00, tempC
