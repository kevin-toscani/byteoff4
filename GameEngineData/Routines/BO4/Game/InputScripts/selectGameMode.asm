	;; If input disabled, skip
	BIT bo4Flags
	BPL +
		RTS
	+

	;; Play the start game song
	PlaySong #_default_StartGame
	LDA #$FF
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2

	;; Disable user input
    LDA bo4Flags
    AND #%01111111
    STA bo4Flags
    
	;; Set warp timer
    LDA #$A0
    STA introTimer

	RTS
