
    ;; Health pickup
    LDA Object_type,x
    CMP #$04
    BNE +nextPickup
    
    LDA #$06
    STA myHealth
    PlaySound #_sfx_powerup
    JMP +done
    
+nextPickup:
+done:
