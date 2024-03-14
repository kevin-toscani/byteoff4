doGetRandomNumber:
	LDA randomSeed1
	ASL A
	ASL A
	CLC
	ADC temp2
	SEC
	SBC tempx
	ADC #$11
	SBC gamepad
	ADC #$36
	ADC tileY
	SBC temp16
	ADC pointer
	ADC tempA
	STA randomSeed1
	ADC #$03
	SBC vBlankTimer
	SBC vBlankTimer
	RTS

doGetRandomNumberToo:
    LDA randomSeed1
    ASL
    BCS +
        EOR #$9E
    +
    ADC #$81
    STA randomSeed1
    RTS

;doGetRandomNumberToo:
;        lda randomSeed1
;        beq +doEor
;        asl
;        beq +noEor
;        bcc +noEor
;+doEor: eor #$1d
;+noEor: sta randomSeed1
;        rts
        
