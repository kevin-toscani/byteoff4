;Music Bank

doHandleUpdateMusic: ;from the main loop 
	LDA updateSoundByte
	AND #%00000001
	BEQ dontStopMusic
		;; stop music
		jsr sabre_stopTrack
		LDA updateSoundByte
		AND #%11111110
		STA updateSoundByte
	dontStopMusic
	LDA updateSoundByte
	AND #%00000010
	BEQ dontPlaySound
		
		;;; play sound
        LDA sfxToPlay
        STA currentSFX
        JSR sabre_playSFX

		LDA updateSoundByte
		AND #%11111101
		STA updateSoundByte
	dontPlaySound:
    
    LDA updateSoundByte
    AND #%00000100
    BEQ dontPlaySong

		;; play song
		LDA songToPlay
		sta currentTrack
		jsr sabre_playTrack

		LDA updateSoundByte
		AND #%11111011
		STA updateSoundByte
	dontPlaySong:
	RTS


doSoundEngineUpdate:
	soundengine_update  
	RTS

	.include "Routines\Sabre\sabre.asm"
IntroSong:
	.include "Routines\BO4\Sound\BO4.dnm_default.asm"
