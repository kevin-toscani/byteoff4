MACRO SwitchCHRBank arg0
	LDA arg0
	ASL
	ASL
	ASL
	ASL
	ASL
	AND #%01100000
	STA chrRamBank
	

	LDA currentBank
	AND #%00011111
	ORA chrRamBank


	STA $c000
ENDM