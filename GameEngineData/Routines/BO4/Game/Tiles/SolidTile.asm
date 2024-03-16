    LDY Object_type,x
    LDA MonsterBits,y
    AND #%00100000
    BEQ +defaultBehavior


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
	
	
	
