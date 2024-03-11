
    ;; If projectile, reset flag
    LDA Object_type,x
    CMP #$03
    BNE +
        LDA bo4Flags
        AND #%11111110
        STA bo4Flags
    +

    ;; Destroy the object
    DestroyObject
    
    