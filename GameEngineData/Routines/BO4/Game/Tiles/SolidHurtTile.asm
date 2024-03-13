
    ;; Make #$04 hurt tiles solid
    LDA ObjectUpdateByte
    ORA #%00000001
    STA ObjectUpdateByte
    JMP lblOriginalHurtTile