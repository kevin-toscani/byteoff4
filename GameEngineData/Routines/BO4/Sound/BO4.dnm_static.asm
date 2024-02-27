sabre_maxTracks:
	.byte 7
sabre_maxSFX:
	.byte 11

trackHeaderTable_lo:
	.byte <_default_Intro_header
	.byte <_default_Title_header
	.byte <_default_StartGame_header
	.byte <_default_Stage_header
	.byte <_default_Transmission_header
	.byte <_default_Boss_header
	.byte <_default_Win_header
trackHeaderTable_hi:
	.byte >_default_Intro_header
	.byte >_default_Title_header
	.byte >_default_StartGame_header
	.byte >_default_Stage_header
	.byte >_default_Transmission_header
	.byte >_default_Boss_header
	.byte >_default_Win_header
trackTable_PRGbank:
	.byte $00,$00,$00,$00,$00,$00,$00

sfxHeaderTable_lo:
	.byte <_sfx_zap_header
	.byte <_sfx_jump_header
	.byte <_sfx_powerup_header
	.byte <_sfx_rumble_header
	.byte <_sfx_select_header
	.byte <_sfx_start_header
	.byte <_sfx_bip_header
	.byte <_sfx_speakA_header
	.byte <_sfx_speakB_header
	.byte <_sfx_speakC_header
	.byte <_sfx_speakD_header
sfxHeaderTable_hi:
	.byte >_sfx_zap_header
	.byte >_sfx_jump_header
	.byte >_sfx_powerup_header
	.byte >_sfx_rumble_header
	.byte >_sfx_select_header
	.byte >_sfx_start_header
	.byte >_sfx_bip_header
	.byte >_sfx_speakA_header
	.byte >_sfx_speakB_header
	.byte >_sfx_speakC_header
	.byte >_sfx_speakD_header

;;;; Track index constants
	_default_Intro        = 0
	_default_Title        = 1
	_default_StartGame    = 2
	_default_Stage        = 3
	_default_Transmission = 4
	_default_Boss         = 5
	_default_Win          = 6
;;;; SFX index constants
	_sfx_zap     = 0
	_sfx_jump    = 1
	_sfx_powerup = 2
	_sfx_rumble  = 3
	_sfx_select  = 4
	_sfx_start   = 5
	_sfx_bip     = 6
	_sfx_speakA  = 7
	_sfx_speakB  = 8
	_sfx_speakC  = 9
	_sfx_speakD  = 10

env0:
	.byte 0,ENV_LOOP,0
env1:
	.byte 6,8,10,11,12,12,12,6,3,2,2,2,1,1,1,1,0,ENV_LOOP,16
env2:
	.byte 8,8,7,6,1,1,0,ENV_LOOP,6
env3:
	.byte 2,ENV_LOOP,0
env4:
	.byte 5,ENV_LOOP,0
env5:
	.byte 1,ENV_LOOP,0
env6:
	.byte 8,ENV_LOOP,0
env7:
	.byte 4,ENV_LOOP,0
env8:
	.byte 3,ENV_LOOP,0
env9:
	.byte 6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,3,ENV_LOOP,36
env10:
	.byte 6,4,2,ENV_LOOP,2
env11:
	.byte 2,3,4,5,7,3,3,3,3,3,3,3,3,3,3,3,2,3,3,3,3,2,2,2,2,2,1,1,1,1,1,0,ENV_LOOP,31
env12:
	.byte 3,3,2,1,0,ENV_LOOP,4
env13:
	.byte 5,3,2,1,0,ENV_LOOP,4
env14:
	.byte 5,4,3,2,1,0,ENV_LOOP,5
env15:
	.byte 6,ENV_LOOP,0
env16:
	.byte 6,6,5,5,4,4,3,3,2,2,1,ENV_LOOP,10
env17:
	.byte 8,6,6,5,4,3,3,2,2,1,ENV_LOOP,9
env18:
	.byte 1,1,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,5,ENV_LOOP,17
env19:
	.byte 4,4,4,3,3,3,3,2,2,2,2,1,ENV_LOOP,11
env20:
	.byte 11,6,2,0,ENV_LOOP,3
env21:
	.byte 13,13,11,8,6,5,4,2,1,1,0,ENV_LOOP,10
env22:
	.byte 6,6,5,ENV_LOOP,2
env23:
	.byte 6,6,5,4,3,2,2,1,1,1,0,ENV_LOOP,10
env24:
	.byte 8,6,4,3,2,1,ENV_LOOP,5
env25:
	.byte 4,3,2,2,1,ENV_LOOP,4
env26:
	.byte 2,2,1,ENV_LOOP,2
env27:
	.byte 1,1,1,0,ENV_LOOP,3
env28:
	.byte 4,4,3,3,1,0,ENV_LOOP,5
env29:
	.byte 0,0,0,0,1,1,ENV_LOOP,0
env30:
	.byte 0,0,0,0,0,0,0,0,0,255,255,ENV_LOOP,0
env31:
	.byte 255,255,0,ENV_LOOP,2
env32:
	.byte 0,0,12,12,3,3,15,15,7,7,19,19,ENV_LOOP,0
env33:
	.byte 0,0,12,12,4,4,16,16,7,7,19,19,ENV_LOOP,0
env34:
	.byte 254,254,0,ENV_LOOP,2
env35:
	.byte 255,1,2,4,0,4,4,4,5,5,5,5,6,6,6,6,7,ENV_LOOP,16
env36:
	.byte 0,255,255,254,ENV_LOOP,3
env37:
	.byte 0,1,2,2,3,ENV_LOOP,4
env38:
	.byte 0,0,3,3,7,7,ENV_LOOP,0
env39:
	.byte 3,3,7,7,12,12,ENV_LOOP,0
env40:
	.byte 2,1,0,ENV_LOOP,2
env41:
	.byte 0,2,3,4,4,5,3,4,ENV_LOOP,7
env42:
	.byte 24,249,249,249,ENV_LOOP,3
env43:
	.byte 232,7,7,7,ENV_LOOP,3
env44:
	.byte 2,0,ENV_LOOP,1
env45:
	.byte 12,ENV_LOOP,0
env46:
	.byte 254,0,0,0,4,0,0,0,252,ENV_LOOP,1
env47:
	.byte 62,0,0,250,ENV_LOOP,1
env48:
	.byte 22,ENV_LOOP,0
env49:
	.byte 251,0,5,0,5,0,251,0,251,ENV_LOOP,1
env50:
	.byte 32,ENV_LOOP,0
env51:
	.byte 64,ENV_LOOP,0
env52:
	.byte 64,32,0,64,ENV_LOOP,3

instrumentHeaderTable:
	.word inst_silent
	.word inst_X00_Silence
	.word inst_P1C_Speak_up
	.word inst_P1C_Speak_down
	.word inst_P28_Bip
	.word inst_N02_Rumble
	.word inst_T0X_Rumble_bass
	.word inst_P05_Bass
	.word inst_P01_Bass_end
	.word inst_P05_Bass_up
	.word inst_P08_Lead
	.word inst_P08_Lead_vibe
	.word inst_P04_Lead_fall
	.word inst_P04_Lead_half_vibe
	.word inst_P02_Lead_half_fall
	.word inst_P02_Lead_qt_vibe
	.word inst_P01_Lead_qt_fall
	.word inst_P01_Lead_8th_vibe
	.word inst_P08_Lead_climb
	.word inst_P06_Main_backing
	.word inst_P08_Main
	.word inst_P08_Main_vibe
	.word inst_P04_Main_fall
	.word inst_P04_Main_half
	.word inst_P08_Main_dip
	.word inst_P08_Main_climb_halfstep
	.word inst_P08_Main_climb_wholestep
	.word inst_N05_Crash
	.word inst_N03_Tick
	.word inst_N05_Kick
	.word inst_N05_Hat
	.word inst_P06_Main_backing_hit_off
	.word inst_T0X_Bass_vibe
	.word inst_P16_Arp037_hit
	.word inst_P16_Arp37C_in
	.word inst_P16_Arp37C_out
	.word inst_N08_Kick_drum_0
	.word inst_N0D_Snare_drum_8
	.word inst_T0X_Bass_down
	.word inst_DPCM
	.word inst_P02_Main_qt
	.word inst_P06_Main_six
	.word inst_P06_Main_backing_hit
	.word inst_P01_Main_8th
	.word inst_P06_Main_backing_hit_copy
	.word inst_N06_Snare_drum_8
	.word inst_P28_Win_out
	.word inst_P24_Win_out_half
	.word inst_P22_Win_out_qt
	.word inst_P21_Win_out_8th
	.word inst_P24_Bip_half

inst_silent:
	.word env0
	.word env0
	.word env0
	.word env0
inst_X00_Silence:
	.word env0
	.word env0
	.word env0
	.word env0
inst_P1C_Speak_up:
	.word env1
	.word env0
	.word env42
	.word env50
inst_P1C_Speak_down:
	.word env1
	.word env0
	.word env43
	.word env50
inst_P28_Bip:
	.word env2
	.word env0
	.word env44
	.word env51
inst_N02_Rumble:
	.word env3
	.word env29
	.word env0
	.word env0
inst_T0X_Rumble_bass:
	.word env3
	.word env30
	.word env0
	.word env0
inst_P05_Bass:
	.word env4
	.word env0
	.word env0
	.word env0
inst_P01_Bass_end:
	.word env5
	.word env0
	.word env0
	.word env0
inst_P05_Bass_up:
	.word env4
	.word env31
	.word env0
	.word env0
inst_P08_Lead:
	.word env6
	.word env0
	.word env0
	.word env0
inst_P08_Lead_vibe:
	.word env6
	.word env0
	.word env46
	.word env0
inst_P04_Lead_fall:
	.word env7
	.word env0
	.word env45
	.word env0
inst_P04_Lead_half_vibe:
	.word env7
	.word env0
	.word env46
	.word env0
inst_P02_Lead_half_fall:
	.word env3
	.word env0
	.word env45
	.word env0
inst_P02_Lead_qt_vibe:
	.word env3
	.word env0
	.word env46
	.word env0
inst_P01_Lead_qt_fall:
	.word env5
	.word env0
	.word env45
	.word env0
inst_P01_Lead_8th_vibe:
	.word env5
	.word env0
	.word env46
	.word env0
inst_P08_Lead_climb:
	.word env6
	.word env0
	.word env47
	.word env0
inst_P06_Main_backing:
	.word env15
	.word env0
	.word env0
	.word env0
inst_P08_Main:
	.word env6
	.word env0
	.word env0
	.word env0
inst_P08_Main_vibe:
	.word env6
	.word env0
	.word env46
	.word env0
inst_P04_Main_fall:
	.word env7
	.word env0
	.word env48
	.word env0
inst_P04_Main_half:
	.word env7
	.word env0
	.word env0
	.word env0
inst_P08_Main_dip:
	.word env10
	.word env0
	.word env0
	.word env0
inst_P08_Main_climb_halfstep:
	.word env6
	.word env31
	.word env0
	.word env0
inst_P08_Main_climb_wholestep:
	.word env6
	.word env34
	.word env0
	.word env0
inst_N05_Crash:
	.word env11
	.word env35
	.word env0
	.word env0
inst_N03_Tick:
	.word env12
	.word env0
	.word env0
	.word env0
inst_N05_Kick:
	.word env13
	.word env36
	.word env0
	.word env0
inst_N05_Hat:
	.word env14
	.word env37
	.word env0
	.word env0
inst_P06_Main_backing_hit_off:
	.word env16
	.word env0
	.word env44
	.word env0
inst_T0X_Bass_vibe:
	.word env3
	.word env0
	.word env49
	.word env0
inst_P16_Arp037_hit:
	.word env17
	.word env38
	.word env0
	.word env0
inst_P16_Arp37C_in:
	.word env18
	.word env39
	.word env0
	.word env0
inst_P16_Arp37C_out:
	.word env19
	.word env39
	.word env0
	.word env0
inst_N08_Kick_drum_0:
	.word env20
	.word env40
	.word env0
	.word env0
inst_N0D_Snare_drum_8:
	.word env21
	.word env41
	.word env0
	.word env0
inst_T0X_Bass_down:
	.word env3
	.word env0
	.word env0
	.word env0
inst_DPCM:
	.word env0
	.word env0
	.word env0
	.word env0
inst_P02_Main_qt:
	.word env3
	.word env0
	.word env0
	.word env0
inst_P06_Main_six:
	.word env22
	.word env0
	.word env0
	.word env0
inst_P06_Main_backing_hit:
	.word env16
	.word env0
	.word env0
	.word env0
inst_P01_Main_8th:
	.word env5
	.word env0
	.word env0
	.word env0
inst_P06_Main_backing_hit_copy:
	.word env16
	.word env0
	.word env0
	.word env0
inst_N06_Snare_drum_8:
	.word env23
	.word env41
	.word env0
	.word env0
inst_P28_Win_out:
	.word env24
	.word env0
	.word env0
	.word env52
inst_P24_Win_out_half:
	.word env25
	.word env0
	.word env0
	.word env52
inst_P22_Win_out_qt:
	.word env26
	.word env0
	.word env0
	.word env52
inst_P21_Win_out_8th:
	.word env27
	.word env0
	.word env0
	.word env52
inst_P24_Bip_half:
	.word env28
	.word env0
	.word env44
	.word env51

dpcm_sampleAddressTable:
	.byte <(dpcm_sample_F2 >> 6)
	.byte <(dpcm_sample_F1 >> 6)
	.byte <(dpcm_sample_Fs2 >> 6)
	.byte <(dpcm_sample_Ds2 >> 6)

dpcm_noteToSampleTable:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$03,$ff,$00,$02,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
dpcm_noteToSampleRateAndFlags:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$03,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$03,$ff,$03,$03,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
dpcm_noteToSampleLength:
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0b,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0b,$ff,$0b,$0a,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

_sfx_zap_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_zap_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_zap_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_jump_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_jump_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_jump_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_powerup_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_powerup_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_powerup_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_rumble_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_rumble_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_rumble_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_select_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_select_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_select_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_start_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_start_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_start_pulse2:
	.byte NL8,INST|CONT|1,C2,END_SFX

_sfx_bip_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_bip_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_bip_pulse2:
	.byte NL7,INST|CONT|4,A4,NL1,INST|1,END_SFX

_sfx_speakA_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_speakA_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_speakA_pulse2:
	.byte NL16,INST|CONT|2,D3,NL1,INST|1,END_SFX

_sfx_speakB_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_speakB_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_speakB_pulse2:
	.byte NL16,INST|CONT|3,FS3,NL1,INST|1,END_SFX

_sfx_speakC_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_speakC_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_speakC_pulse2:
	.byte NL16,INST|CONT|2,AS3,NL1,INST|1,END_SFX

_sfx_speakD_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_speakD_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_speakD_pulse2:
	.byte NL16,INST|CONT|3,DS3,NL1,INST|1,END_SFX

