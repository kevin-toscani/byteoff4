;; This is the correct script... now we just need to find the right spot to put it.

    ;; If the flying ball X is less than (player X - 8)
    ;; And flying ball is in action step 1
    ;; Go to action step 2
    LDX #$00

    -objectLoop:
        LDA Object_type,x
        CMP #$1E
        BNE +checkNext

            STX tempx
            LDA Object_x_hi,x
            CLC
            ADC #$08
            STA tempA

            LDX player1_object
            LDA Object_x_hi,x
            CMP tempA
            BCC +
                GetActionStep tempx
                CMP #$01
                BNE +
                ChangeActionStep tempx, #$02
                JMP +done
            +
            LDX tempx
            
        +checkNext:
        INX
        CPX #TOTAL_MAX_OBJECTS
    BNE -objectLoop
    +done