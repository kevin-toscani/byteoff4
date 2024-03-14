    LDA Object_type,x
    CMP #$1B
    BNE +defaultBehavior


+bouncyBallBehavior:
	LDA Object_v_speed_hi,x
	BEQ +
	BMI +
		LDA #$FA
		STA Object_v_speed_hi,x
	+
	RTS


+defaultBehavior:
    LDA ObjectUpdateByte
    ORA #%00000001
    STA ObjectUpdateByte
    RTS
	
	
	
