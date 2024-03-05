
    LDA Object_x_hi,x
    CLC
    ADC #$03
    STA tempx

    LDA Object_y_hi,x
    STA tempy

    ;x y obj state (screen)
    CreateObject tempx, tempy, #$14, #$00
    ;CreateObjectOnScreen tempx, tempy, #$14, #$00, scrollUpdateScreen
