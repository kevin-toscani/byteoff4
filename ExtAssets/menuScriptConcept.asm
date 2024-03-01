;; zero page
gameMode .dsb 1
disableInput .dsb 1


;; input script: press DOWN or SELECT on menu screen for cursor object
;; [@TODO]: create Cursor object, update CURSOR_OBJECT_ID
;; [@TODO]: add DEX variation for UP press (wishlist)
;;
	;; if input disabled, skip
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
	RTS


;; input script: press A or START on menu screen for cursor object
	;; if input disabled, skip
	BIT bo4Flags
	BPL +
		RTS
	+

	;; Play the start game song
	LDA #$FF
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2
	PlaySong #song_StartGame

	;; Flash the cursor
	STX temp
	ChangeActionStep temp, #$01

	;; [@TODO] disable user input
	;; [@TODO] initiate fade-out and warptoscreen sequence
	RTS


;; post screen load, underneath the last +nextScreen: line
	
	CMP #$04
	BNE +nextScreen

	LDA #$00
	STA gameMode
	STA channelMuteStatus+CHANNEL_TRACK_PULSE2
	CreateObject #$50, tblCursorYPosition, #$0F, #$00

	+nextScreen:


;; extra tables:
tblChannelTwo:      .db #$00, #$FF
tblCursorYPosition: .db #$80, #$98