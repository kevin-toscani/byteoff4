sabre_maxTracks:
	.byte 11
sabre_maxSFX:
	.byte 20

trackHeaderTable_lo:
	.byte <_default_Intro_header
	.byte <_default_Title_header
	.byte <_default_StartGame_header
	.byte <_default_Stage_header
	.byte <_default_Transmission_header
	.byte <_default_Boss_header
	.byte <_default_Win_header
	.byte <_default_End_header
	.byte <_default_Death_header
	.byte <_default_GameOver_header
	.byte <_default_BossDead_header
trackHeaderTable_hi:
	.byte >_default_Intro_header
	.byte >_default_Title_header
	.byte >_default_StartGame_header
	.byte >_default_Stage_header
	.byte >_default_Transmission_header
	.byte >_default_Boss_header
	.byte >_default_Win_header
	.byte >_default_End_header
	.byte >_default_Death_header
	.byte >_default_GameOver_header
	.byte >_default_BossDead_header
trackTable_PRGbank:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

sfxHeaderTable_lo:
	.byte <_sfx_zap_header
	.byte <_sfx_hit_header
	.byte <_sfx_powerup_header
	.byte <_sfx_bosspew_header
	.byte <_sfx_select_header
	.byte <_sfx_start_header
	.byte <_sfx_bip_header
	.byte <_sfx_speakA_header
	.byte <_sfx_speakB_header
	.byte <_sfx_speakC_header
	.byte <_sfx_speakD_header
	.byte <_sfx_shake_header
	.byte <_sfx_zapp_header
	.byte <_sfx_bossOpenHatch_header
	.byte <_sfx_bossLaunch_header
	.byte <_sfx_bossFire_header
	.byte <_sfx_flyingFire_header
	.byte <_sfx_meteorFall_header
	.byte <_sfx_explosion_header
	.byte <_sfx_explosionToo_header
sfxHeaderTable_hi:
	.byte >_sfx_zap_header
	.byte >_sfx_hit_header
	.byte >_sfx_powerup_header
	.byte >_sfx_bosspew_header
	.byte >_sfx_select_header
	.byte >_sfx_start_header
	.byte >_sfx_bip_header
	.byte >_sfx_speakA_header
	.byte >_sfx_speakB_header
	.byte >_sfx_speakC_header
	.byte >_sfx_speakD_header
	.byte >_sfx_shake_header
	.byte >_sfx_zapp_header
	.byte >_sfx_bossOpenHatch_header
	.byte >_sfx_bossLaunch_header
	.byte >_sfx_bossFire_header
	.byte >_sfx_flyingFire_header
	.byte >_sfx_meteorFall_header
	.byte >_sfx_explosion_header
	.byte >_sfx_explosionToo_header

;;;; Track index constants
	_default_Intro        = 0
	_default_Title        = 1
	_default_StartGame    = 2
	_default_Stage        = 3
	_default_Transmission = 4
	_default_Boss         = 5
	_default_Win          = 6
	_default_End          = 7
	_default_Death        = 8
	_default_GameOver     = 9
	_default_BossDead     = 10
;;;; SFX index constants
	_sfx_zap           = 0
	_sfx_hit           = 1
	_sfx_powerup       = 2
	_sfx_bosspew       = 3
	_sfx_select        = 4
	_sfx_start         = 5
	_sfx_bip           = 6
	_sfx_speakA        = 7
	_sfx_speakB        = 8
	_sfx_speakC        = 9
	_sfx_speakD        = 10
	_sfx_shake         = 11
	_sfx_zapp          = 12
	_sfx_bossOpenHatch = 13
	_sfx_bossLaunch    = 14
	_sfx_bossFire      = 15
	_sfx_flyingFire    = 16
	_sfx_meteorFall    = 17
	_sfx_explosion     = 18
	_sfx_explosionToo  = 19

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
	.byte 10,9,8,7,6,5,4,4,3,3,3,2,2,2,2,1,ENV_LOOP,15
env30:
	.byte 10,7,4,3,2,2,2,1,1,1,1,1,1,2,3,3,3,4,4,3,3,2,2,2,1,ENV_LOOP,24
env31:
	.byte 5,3,1,2,ENV_LOOP,3
env32:
	.byte 14,ENV_LOOP,0
env33:
	.byte 14,14,14,14,8,6,4,3,3,2,2,1,ENV_LOOP,11
env34:
	.byte 1,3,5,7,9,11,14,14,14,14,14,14,14,14,14,14,14,14,14,13,13,13,12,11,10,9,8,7,6,5,4,3,2,1,ENV_LOOP,33
env35:
	.byte 4,7,11,14,14,14,14,14,14,13,12,10,8,6,4,2,1,ENV_LOOP,16
env36:
	.byte 10,ENV_LOOP,0
env37:
	.byte 8,7,6,5,4,4,3,3,2,ENV_LOOP,8
env38:
	.byte 0,0,0,0,1,1,ENV_LOOP,0
env39:
	.byte 0,0,0,0,0,0,0,0,0,255,255,ENV_LOOP,0
env40:
	.byte 255,255,0,ENV_LOOP,2
env41:
	.byte 0,0,12,12,3,3,15,15,7,7,19,19,ENV_LOOP,0
env42:
	.byte 0,0,12,12,4,4,16,16,7,7,19,19,ENV_LOOP,0
env43:
	.byte 254,254,0,ENV_LOOP,2
env44:
	.byte 255,1,2,4,0,4,4,4,5,5,5,5,6,6,6,6,7,ENV_LOOP,16
env45:
	.byte 0,255,255,254,ENV_LOOP,3
env46:
	.byte 0,1,2,2,3,ENV_LOOP,4
env47:
	.byte 0,0,3,3,7,7,ENV_LOOP,0
env48:
	.byte 3,3,7,7,12,12,ENV_LOOP,0
env49:
	.byte 2,1,0,ENV_LOOP,2
env50:
	.byte 0,2,3,4,4,5,3,4,ENV_LOOP,7
env51:
	.byte 24,249,249,249,ENV_LOOP,3
env52:
	.byte 232,7,7,7,ENV_LOOP,3
env53:
	.byte 2,0,ENV_LOOP,1
env54:
	.byte 12,ENV_LOOP,0
env55:
	.byte 254,0,0,0,4,0,0,0,252,ENV_LOOP,1
env56:
	.byte 62,0,0,250,ENV_LOOP,1
env57:
	.byte 22,ENV_LOOP,0
env58:
	.byte 251,0,5,0,5,0,251,0,251,ENV_LOOP,1
env59:
	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,254,ENV_LOOP,12
env60:
	.byte 10,20,30,40,ENV_LOOP,0
env61:
	.byte 0,0,0,0,0,0,0,0,0,0,1,0,0,0,ENV_LOOP,10
env62:
	.byte 0,0,0,0,0,1,0,ENV_LOOP,5
env63:
	.byte 32,ENV_LOOP,0
env64:
	.byte 64,ENV_LOOP,0
env65:
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
	.word inst_P2A_bell
	.word inst_P26_bell_dip
	.word inst_P23_bell_dip_half
	.word inst_P2E_SFX
	.word inst_X1E_Laser
	.word inst_P1E_SFX
	.word inst_P24_Bip_half_well_off
	.word inst_PPP_Falling
	.word inst_PPP_Falling_fast
	.word inst_N0A_SFX
	.word inst_N08_Gun_tail

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
	.word env51
	.word env63
inst_P1C_Speak_down:
	.word env1
	.word env0
	.word env52
	.word env63
inst_P28_Bip:
	.word env2
	.word env0
	.word env53
	.word env64
inst_N02_Rumble:
	.word env3
	.word env38
	.word env0
	.word env0
inst_T0X_Rumble_bass:
	.word env3
	.word env39
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
	.word env40
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
	.word env55
	.word env0
inst_P04_Lead_fall:
	.word env7
	.word env0
	.word env54
	.word env0
inst_P04_Lead_half_vibe:
	.word env7
	.word env0
	.word env55
	.word env0
inst_P02_Lead_half_fall:
	.word env3
	.word env0
	.word env54
	.word env0
inst_P02_Lead_qt_vibe:
	.word env3
	.word env0
	.word env55
	.word env0
inst_P01_Lead_qt_fall:
	.word env5
	.word env0
	.word env54
	.word env0
inst_P01_Lead_8th_vibe:
	.word env5
	.word env0
	.word env55
	.word env0
inst_P08_Lead_climb:
	.word env6
	.word env0
	.word env56
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
	.word env55
	.word env0
inst_P04_Main_fall:
	.word env7
	.word env0
	.word env57
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
	.word env40
	.word env0
	.word env0
inst_P08_Main_climb_wholestep:
	.word env6
	.word env43
	.word env0
	.word env0
inst_N05_Crash:
	.word env11
	.word env44
	.word env0
	.word env0
inst_N03_Tick:
	.word env12
	.word env0
	.word env0
	.word env0
inst_N05_Kick:
	.word env13
	.word env45
	.word env0
	.word env0
inst_N05_Hat:
	.word env14
	.word env46
	.word env0
	.word env0
inst_P06_Main_backing_hit_off:
	.word env16
	.word env0
	.word env53
	.word env0
inst_T0X_Bass_vibe:
	.word env3
	.word env0
	.word env58
	.word env0
inst_P16_Arp037_hit:
	.word env17
	.word env47
	.word env0
	.word env63
inst_P16_Arp37C_in:
	.word env18
	.word env48
	.word env0
	.word env63
inst_P16_Arp37C_out:
	.word env19
	.word env48
	.word env0
	.word env63
inst_N08_Kick_drum_0:
	.word env20
	.word env49
	.word env0
	.word env0
inst_N0D_Snare_drum_8:
	.word env21
	.word env50
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
	.word env50
	.word env0
	.word env0
inst_P28_Win_out:
	.word env24
	.word env0
	.word env0
	.word env65
inst_P24_Win_out_half:
	.word env25
	.word env0
	.word env0
	.word env65
inst_P22_Win_out_qt:
	.word env26
	.word env0
	.word env0
	.word env65
inst_P21_Win_out_8th:
	.word env27
	.word env0
	.word env0
	.word env65
inst_P24_Bip_half:
	.word env28
	.word env0
	.word env53
	.word env64
inst_P2A_bell:
	.word env29
	.word env0
	.word env59
	.word env64
inst_P26_bell_dip:
	.word env30
	.word env0
	.word env0
	.word env64
inst_P23_bell_dip_half:
	.word env31
	.word env0
	.word env0
	.word env64
inst_P2E_SFX:
	.word env32
	.word env0
	.word env0
	.word env64
inst_X1E_Laser:
	.word env33
	.word env0
	.word env60
	.word env63
inst_P1E_SFX:
	.word env32
	.word env0
	.word env0
	.word env63
inst_P24_Bip_half_well_off:
	.word env28
	.word env0
	.word env8
	.word env64
inst_PPP_Falling:
	.word env34
	.word env0
	.word env61
	.word env0
inst_PPP_Falling_fast:
	.word env35
	.word env0
	.word env62
	.word env0
inst_N0A_SFX:
	.word env36
	.word env0
	.word env0
	.word env0
inst_N08_Gun_tail:
	.word env37
	.word env0
	.word env0
	.word env0

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
	.word NULL_pulse2
	.word _sfx_zap_triangle
	.word NULL_noise
_sfx_zap_triangle:
	.byte NL11,INST|CONT|55,F6,NL1,INST|CONT|1,CS2,END_SFX

_sfx_hit_header:
	.byte 1
	.byte 151
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_hit_noise
_sfx_hit_noise:
	.byte NL2,INST|CONT|56,$5,INST|33,NL1,INST|CONT|10,$E,NL2,INST|CONT|56,$5
	.byte INST|33,INST|CONT|10,$E,NL1,$F,INST|1,END_SFX

_sfx_powerup_header:
	.byte 2
	.byte 150
	.word NULL_pulse1
	.word _sfx_powerup_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_powerup_pulse2:
	.byte NL1,INST|CONT|56,E4,INST|CONT|8,E3,INST|CONT|56,A4,INST|CONT|8,A3,INST|CONT|56
	.byte D5,INST|CONT|8,C4,INST|CONT|56,FS5,INST|CONT|8,F4,INST|CONT|33,A4,INST|CONT|8
	.byte A3,INST|CONT|33,D5,INST|CONT|8,C4,INST|CONT|33,FS5,INST|CONT|8,F4,INST|CONT|48
	.byte A4,INST|CONT|8,A3,INST|CONT|48,D5,INST|CONT|8,C4,INST|CONT|48,FS5,INST|CONT|8
	.byte F4,INST|1,END_SFX

_sfx_bosspew_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_bosspew_pulse2
	.word _sfx_bosspew_triangle
	.word _sfx_bosspew_noise
_sfx_bosspew_pulse2:
	.byte NL48,INST|CONT|1,C2,END_SFX
_sfx_bosspew_triangle:
	.byte NL1,INST|CONT|56,AS4,G2,D3,A3,FS4,D5,INST|1,END_SFX
_sfx_bosspew_noise:
	.byte NL1,INST|CONT|56,$2,$1,NL3,INST|CONT|8,$F,NLC,43,INST|1
	.byte END_SFX

_sfx_select_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_select_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_select_pulse2:
	.byte NL4,INST|CONT|54,B4,INST|50,END_SFX

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

_sfx_shake_header:
	.byte 3
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word _sfx_shake_triangle
	.word _sfx_shake_noise
_sfx_shake_triangle:
	.byte NLC,25,INST|CONT|6,AS0,END_SFX
_sfx_shake_noise:
	.byte NL3,INST|CONT|3,$9,NL5,INST|CONT|20,$5,NL1,$E,NL3,INST|CONT|3
	.byte $9,NL2,$9,NL1,INST|CONT|20,$4,NL3,$B,NL2,INST|23
	.byte NL3,INST|40,NL1,INST|CONT|1,$F,INST|SLNT,END_SFX

_sfx_zapp_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_zapp_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_zapp_pulse2:
	.byte NL15,INST|CONT|55,B5,NL1,INST|CONT|1,D5,END_SFX

_sfx_bossOpenHatch_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_bossOpenHatch_noise
_sfx_bossOpenHatch_noise:
	.byte NL1,INST|CONT|54,$4,$C,NL2,INST|CONT|56,$7,NL1,INST|CONT|54,$C
	.byte NL2,INST|CONT|56,$7,NL1,INST|CONT|54,$D,NL2,INST|CONT|56,$7,NL1
	.byte INST|CONT|54,$D,NL2,INST|CONT|56,$7,NL1,INST|CONT|54,$D,NL2,INST|CONT|56
	.byte $7,NL1,INST|CONT|54,$F,INST|CONT|56,$7,INST|CONT|51,$F,INST|CONT|56,$7
	.byte INST|CONT|49,$F,INST|CONT|56,$7,INST|CONT|1,$F,END_SFX

_sfx_bossLaunch_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_bossLaunch_noise
_sfx_bossLaunch_noise:
	.byte NL2,INST|CONT|56,$0,NL1,$1,NL2,INST|CONT|54,$5,NL1,$C
	.byte NL2,$D,$E,NL4,$F,NL7,INST|44,NL1,INST|1,END_SFX

_sfx_bossFire_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_bossFire_noise
_sfx_bossFire_noise:
	.byte NL1,INST|CONT|54,$0,$4,INST|CONT|42,$C,NL2,INST|CONT|54,$2,$0
	.byte NL1,$1,NL2,$0,$1,$0,NL1,$1,INST|42,$0
	.byte $1,$1,$0,$0,NL3,$1,NL2,$0,INST|40,NL1
	.byte INST|1,END_SFX

_sfx_flyingFire_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_flyingFire_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_flyingFire_pulse2:
	.byte NLC,17,INST|CONT|59,C5,NL1,INST|CONT|1,AS4,END_SFX

_sfx_meteorFall_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_meteorFall_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_meteorFall_pulse2:
	.byte NLC,34,INST|CONT|58,C6,NL1,INST|CONT|1,G5,END_SFX

_sfx_explosion_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word _sfx_explosion_pulse2
	.word NULL_triangle
	.word _sfx_explosion_noise
_sfx_explosion_pulse2:
	.byte NL1,INST|CONT|56,E3,C3,GS2,E2,NL2,C2,GS1,E1
	.byte NL1,C1,NLC,53,INST|1,END_SFX
_sfx_explosion_noise:
	.byte NL2,INST|CONT|60,$2,$3,$6,NL6,$C,NL13,INST|61,NL4
	.byte INST|CONT|43,$A,$C,NL5,$E,NL1,INST|CONT|1,$B,END_SFX

_sfx_explosionToo_header:
	.byte 1
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_explosionToo_noise
_sfx_explosionToo_noise:
	.byte NL2,INST|CONT|54,$2,NL1,$0,NL2,$2,NL1,$0,NL2
	.byte $1,NL1,$0,NL2,$1,NL1,$0,NL2,$1,NL1
	.byte $0,NL2,$1,NL1,$0,NL2,$1,NL1,$0,NL2
	.byte INST|CONT|10,$1,NL1,$0,NL2,$1,NL1,$0,NL2,$1
	.byte NL1,$0,INST|23,INST|CONT|1,$1,END_SFX

