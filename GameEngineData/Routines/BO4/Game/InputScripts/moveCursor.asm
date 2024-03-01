	;; If input disabled, skip
	BIT bo4Flags
	BPL +
		RTS
	+

	;; Update game mode (1P, 2P-zapper, and maybe 2P-controller)
	LDY gameMode
	INY
	CPY #$02 ; max number of selectable options
	BNE +
		LDY #$00
    +
	STY gameMode

	LDA tblCursorYPosition,y
	STA Object_y_hi,x

	LDA tblChannelTwo,y
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2
    
    PlaySound #_sfx_select
    
    LDA gameMode
    BEQ +
        LDA #$17
        STA bckPal+5
        LDA #$27
        STA bckPal+6
        LDA #$37
        STA bckPal+7
        JMP +updatePalette
    +
    
    LDA #$0F
    STA bckPal+5
    STA bckPal+6
    STA bckPal+7
    
    +updatePalette:
    JSR doUpdateBackgroundPalette
    
	RTS