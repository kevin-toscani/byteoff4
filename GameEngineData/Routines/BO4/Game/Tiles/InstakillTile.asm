
    ;; If player, kill player
    CPX player1_object
    BNE +done

    GetActionStep player1_object
    CMP #$06
    BEQ +done

    LDA #$00
    STA myHealth
    JMP lblWeAreDead

    +done:
    