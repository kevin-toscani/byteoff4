_default_Intro_header:
	.byte 6
	.byte 150
	.byte 2
	.word _default_Intro_pulse1
	.word _default_Intro_pulse2
	.word _default_Intro_triangle
	.word _default_Intro_noise
	.word NULL_DMC

_default_Intro_pulse1:
	.word _default_Intro_pulse1_pattern0
	.word _default_Intro_pulse1_pattern1
_default_Intro_pulse1_pattern0:
	.byte NLC,17,INST|CONT|1,C2,NL1,INST|CONT|4,G5,NL2,A5,NL3
	.byte B5,NLC,19,F5,NL3,D6,NL1,FS6,NL18,AS5
	.byte D00
_default_Intro_pulse1_pattern1:
	.byte NL64,INST|CONT|1,C3,BXX,$01

_default_Intro_pulse2:
	.word _default_Intro_pulse2_pattern0
	.word _default_Intro_pulse2_pattern1
_default_Intro_pulse2_pattern0:
	.byte NLC,17,INST|CONT|1,C2,NL1,INST|CONT|50,CS5,NL2,DS5,NL3
	.byte F5,NLC,19,B4,NL3,GS5,NL1,C6,NL18,E5
	.byte D00
_default_Intro_pulse2_pattern1:
	.byte NL64,INST|CONT|1,C3,BXX,$01

_default_Intro_triangle:
	.word _default_Intro_triangle_pattern0
	.word _default_Intro_triangle_pattern0
_default_Intro_triangle_pattern0:
	.byte NL64,INST|CONT|6,AS0,BXX,$01

_default_Intro_noise:
	.word _default_Intro_noise_pattern0
	.word _default_Intro_noise_pattern0
_default_Intro_noise_pattern0:
	.byte NL64,INST|CONT|5,$E,BXX,$01

_default_Title_header:
	.byte 3
	.byte 210
	.byte 4
	.word _default_Title_pulse1
	.word _default_Title_pulse2
	.word _default_Title_triangle
	.word _default_Title_noise
	.word NULL_DMC

_default_Title_pulse1:
	.word _default_Title_pulse1_pattern0
	.word _default_Title_pulse1_pattern1
	.word _default_Title_pulse1_pattern0
	.word _default_Title_pulse1_pattern2
_default_Title_pulse1_pattern0:
	.byte NL3,INST|CONT|20,F2,NL1,INST|23,NL4,INST|20,INST|23,INST|CONT|20,GS2
	.byte INST|23,NL2,INST|CONT|20,C3,INST|23,NL1,INST|CONT|20,DS3,NL2,F3
	.byte NLC,21,INST|21,NL8,INST|CONT|22,GS2,NL4,INST|CONT|20,DS3,F3
	.byte D00
_default_Title_pulse1_pattern1:
	.byte NL4,INST|CONT|25,G3,INST|CONT|20,F3,DS3,NL1,AS2,NL3,C3
	.byte NL32,INST|21,NL16,INST|CONT|22,G2,D00
_default_Title_pulse1_pattern2:
	.byte NL4,INST|CONT|25,G3,INST|CONT|20,F3,DS3,NL1,AS2,NL3,C3
	.byte NL16,INST|21,NL8,INST|13,NL4,INST|CONT|20,AS2,C3,AS2,GS2
	.byte NL1,F2,NL3,G2,NL4,INST|21,D00

_default_Title_pulse2:
	.word _default_Title_pulse2_pattern0
	.word _default_Title_pulse2_pattern1
	.word _default_Title_pulse2_pattern0
	.word _default_Title_pulse2_pattern2
_default_Title_pulse2_pattern0:
	.byte NL1,INST|CONT|23,F5,C5,GS4,F4,C5,GS4,F4,C4
	.byte GS4,F4,C4,GS3,F4,C4,GS3,F3,C4,GS3
	.byte F3,C3,GS3,F3,C3,GS2,F3,C3,GS2,F2
	.byte C3,GS2,F2,C2,GS2,INST|CONT|40,F2,C2,INST|CONT|43,GS1
	.byte NL4,INST|CONT|41,C4,DS4,F4,G4,F4,DS4,C4,D00
_default_Title_pulse2_pattern1:
	.byte NL1,INST|CONT|23,G5,DS5,C5,G4,DS5,C5,G4,DS4
	.byte C5,G4,DS4,C4,G4,DS4,C4,G3,DS4,C4
	.byte G3,DS3,C4,INST|CONT|40,G3,DS3,INST|CONT|43,C3,NL4,INST|CONT|41
	.byte G4,GS4,G4,INST|40,NL1,INST|CONT|41,CS4,NL3,DS4,NL4
	.byte INST|40,INST|CONT|41,C4,AS3,GS3,G3,D00
_default_Title_pulse2_pattern2:
	.byte NL1,INST|CONT|23,G5,DS5,C5,G4,DS5,C5,G4,DS4
	.byte C5,G4,DS4,C4,G4,DS4,C4,G3,DS4,INST|CONT|40
	.byte C4,G3,INST|CONT|43,DS3,NL4,INST|CONT|41,C4,DS4,F4,G4
	.byte INST|40,NL1,INST|41,NL3,GS4,NL4,INST|40,NL1,INST|CONT|41,F4
	.byte NL3,G4,NL4,F4,DS4,F4,D00

_default_Title_triangle:
	.word _default_Title_triangle_pattern0
	.word _default_Title_triangle_pattern1
	.word _default_Title_triangle_pattern0
	.word _default_Title_triangle_pattern2
_default_Title_triangle_pattern0:
	.byte NL12,INST|CONT|38,F2,NL4,F3,INST|1,INST|CONT|38,F2,NL1,CS3
	.byte NL7,INST|CONT|32,DS3,NL8,INST|CONT|38,F3,INST|1,NL4,INST|CONT|38,F2
	.byte DS3,F3,CS3,D00
_default_Title_triangle_pattern1:
	.byte NL12,INST|CONT|38,C2,NL4,C3,INST|1,INST|CONT|38,C2,NL1,GS2
	.byte NL7,INST|CONT|32,AS2,NL8,INST|CONT|38,C3,NL4,INST|1,INST|38,AS2
	.byte GS2,NL1,F2,NL7,INST|CONT|32,G2,D00
_default_Title_triangle_pattern2:
	.byte NL12,INST|CONT|38,C2,NL4,C3,INST|1,INST|CONT|38,C2,NL1,GS2
	.byte NL7,INST|CONT|32,AS2,NL16,INST|CONT|38,C3,INST|12,D00

_default_Title_noise:
	.word _default_Title_noise_pattern0
	.word _default_Title_noise_pattern1
	.word _default_Title_noise_pattern1
	.word _default_Title_noise_pattern2
_default_Title_noise_pattern0:
	.byte NL16,INST|CONT|27,$7,NL8,INST|CONT|37,$A,NL4,INST|CONT|29,$D,INST|30
	.byte NL8,INST|CONT|36,$0,$0,INST|CONT|37,$A,NL4,INST|CONT|29,$D,INST|30
	.byte D00
_default_Title_noise_pattern1:
	.byte NL8,INST|CONT|36,$0,INST|CONT|30,$D,INST|CONT|37,$A,NL4,INST|CONT|28,$D
	.byte INST|CONT|30,$B,INST|CONT|36,$0,INST|CONT|30,$A,NL8,INST|CONT|36,$0,INST|CONT|37
	.byte $A,NL4,INST|CONT|28,$D,INST|CONT|30,$B,D00
_default_Title_noise_pattern2:
	.byte NL8,INST|CONT|36,$0,INST|CONT|30,$D,INST|CONT|37,$A,NL4,INST|CONT|28,$D
	.byte INST|CONT|30,$B,INST|CONT|36,$0,INST|CONT|30,$A,NL8,INST|CONT|36,$0,INST|CONT|37
	.byte $A,NL4,$B,$C,D00

_default_StartGame_header:
	.byte 2
	.byte 150
	.byte 1
	.word _default_StartGame_pulse1
	.word _default_StartGame_pulse2
	.word _default_StartGame_triangle
	.word _default_StartGame_noise
	.word NULL_DMC

_default_StartGame_pulse1:
	.word _default_StartGame_pulse1_pattern0
_default_StartGame_pulse1_pattern0:
	.byte NL2,INST|CONT|10,F2,F3,GS3,C4,F4,INST|CONT|41,GS3,C4
	.byte F4,INST|CONT|23,GS3,C4,F4,INST|CONT|40,GS3,C4,F4,INST|43
	.byte NL18,INST|1,C00

_default_StartGame_pulse2:
	.word _default_StartGame_pulse2_pattern0
_default_StartGame_pulse2_pattern0:
	.byte NL3,NUL,NL2,INST|CONT|23,F2,F3,GS3,C4,F4,INST|CONT|40
	.byte GS3,C4,F4,INST|CONT|43,GS3,C4,F4,NLC,23,INST|CONT|1
	.byte GS3,C00

_default_StartGame_triangle:
	.word _default_StartGame_triangle_pattern0
_default_StartGame_triangle_pattern0:
	.byte NL2,INST|CONT|32,DS2,NL26,F2,NL20,INST|1,C00

_default_StartGame_noise:
	.word _default_StartGame_noise_pattern0
_default_StartGame_noise_pattern0:
	.byte NL12,INST|CONT|27,$5,INST|CONT|5,$C,NL4,$D,$E,NL16,INST|CONT|1
	.byte $F,C00

_default_Stage_header:
	.byte 3
	.byte 180
	.byte 38
	.word _default_Stage_pulse1
	.word _default_Stage_pulse2
	.word _default_Stage_triangle
	.word _default_Stage_noise
	.word NULL_DMC

_default_Stage_pulse1:
	.word _default_Stage_pulse1_pattern0
	.word _default_Stage_pulse1_pattern1
	.word _default_Stage_pulse1_pattern2
	.word _default_Stage_pulse1_pattern3
	.word _default_Stage_pulse1_pattern2
	.word _default_Stage_pulse1_pattern4
	.word _default_Stage_pulse1_pattern5
	.word _default_Stage_pulse1_pattern4
	.word _default_Stage_pulse1_pattern5
	.word _default_Stage_pulse1_pattern6
	.word _default_Stage_pulse1_pattern7
	.word _default_Stage_pulse1_pattern8
	.word _default_Stage_pulse1_pattern9
	.word _default_Stage_pulse1_pattern10
	.word _default_Stage_pulse1_pattern11
	.word _default_Stage_pulse1_pattern12
	.word _default_Stage_pulse1_pattern13
	.word _default_Stage_pulse1_pattern14
	.word _default_Stage_pulse1_pattern2
	.word _default_Stage_pulse1_pattern3
	.word _default_Stage_pulse1_pattern2
	.word _default_Stage_pulse1_pattern4
	.word _default_Stage_pulse1_pattern5
	.word _default_Stage_pulse1_pattern4
	.word _default_Stage_pulse1_pattern5
	.word _default_Stage_pulse1_pattern19
	.word _default_Stage_pulse1_pattern18
	.word _default_Stage_pulse1_pattern7
	.word _default_Stage_pulse1_pattern8
	.word _default_Stage_pulse1_pattern9
	.word _default_Stage_pulse1_pattern17
	.word _default_Stage_pulse1_pattern11
	.word _default_Stage_pulse1_pattern12
	.word _default_Stage_pulse1_pattern13
	.word _default_Stage_pulse1_pattern14
	.word _default_Stage_pulse1_pattern13
	.word _default_Stage_pulse1_pattern15
	.word _default_Stage_pulse1_pattern16
_default_Stage_pulse1_pattern0:
	.byte NL1,INST|CONT|26,A3,NL7,INST|11,NL4,INST|CONT|12,C3,NL8,INST|CONT|13
	.byte A3,NL4,INST|CONT|14,C3,NL8,INST|CONT|15,A3,NL4,INST|CONT|14,C3
	.byte NL8,INST|CONT|17,A3,NL4,INST|CONT|14,C3,NL8,INST|CONT|17,A3,NL5
	.byte INST|CONT|10,A2,NL1,B2,C3,E3,D00
_default_Stage_pulse1_pattern1:
	.byte NL4,INST|CONT|10,A3,G3,E3,D3,E3,D3,C3,NL1
	.byte G2,NL11,INST|CONT|11,A2,NL13,G2,NL11,INST|CONT|18,A2,D00
_default_Stage_pulse1_pattern2:
	.byte NL4,INST|CONT|20,A2,INST|23,INST|20,INST|21,INST|CONT|22,E2,INST|CONT|20,C3
	.byte NL3,D3,NL1,INST|24,NL4,INST|CONT|26,E3,INST|23,INST|CONT|20,D3
	.byte INST|23,INST|CONT|20,C3,INST|23,INST|CONT|20,A2,B2,C3,D00
_default_Stage_pulse1_pattern3:
	.byte NL4,INST|CONT|20,D3,INST|23,INST|20,C3,INST|23,INST|CONT|20,B2,INST|23
	.byte INST|CONT|25,C3,INST|23,INST|CONT|20,B2,INST|23,INST|CONT|20,A2,NL8,INST|21
	.byte INST|CONT|22,E2,D00
_default_Stage_pulse1_pattern4:
	.byte NL4,INST|CONT|20,D3,INST|23,INST|20,C3,INST|23,INST|CONT|20,B2,INST|23
	.byte INST|CONT|25,C3,INST|23,INST|CONT|20,D3,INST|23,INST|CONT|25,E3,NL8,INST|21
	.byte INST|CONT|22,A2,D00
_default_Stage_pulse1_pattern5:
	.byte NL4,INST|CONT|20,F3,INST|23,INST|20,G3,INST|23,INST|CONT|20,A3,INST|23
	.byte INST|CONT|26,E3,INST|23,INST|CONT|20,D3,INST|23,NL8,INST|CONT|21,C3,NL4
	.byte INST|CONT|20,A2,B2,C3,D00
_default_Stage_pulse1_pattern6:
	.byte NL4,INST|CONT|20,D3,INST|23,INST|20,INST|23,INST|CONT|20,E3,F3,INST|23
	.byte NL8,INST|CONT|26,E3,NL12,INST|21,NL8,INST|CONT|22,GS2,NL2,INST|CONT|20
	.byte A2,B2,C3,D3,D00
_default_Stage_pulse1_pattern7:
	.byte NL4,INST|CONT|20,E3,INST|23,INST|CONT|20,A2,INST|23,INST|CONT|20,C3,E3
	.byte INST|23,INST|CONT|26,D3,NL16,INST|21,NL4,INST|CONT|22,G2,INST|CONT|20,C3
	.byte B2,C3,D00
_default_Stage_pulse1_pattern8:
	.byte NL3,INST|CONT|20,D3,NL1,INST|24,NL4,INST|20,INST|23,INST|CONT|20,E3
	.byte INST|23,INST|CONT|20,D3,INST|23,INST|CONT|25,C3,INST|23,INST|CONT|20,B2,INST|23
	.byte INST|CONT|20,A2,INST|21,INST|CONT|22,E2,INST|CONT|20,A2,B2,D00
_default_Stage_pulse1_pattern9:
	.byte NL4,INST|CONT|20,C3,INST|23,INST|CONT|20,F2,INST|23,INST|CONT|20,A2,C3
	.byte INST|23,INST|CONT|26,B2,NL12,INST|21,NL2,INST|CONT|20,C3,B2,NL4
	.byte A2,INST|23,INST|CONT|20,G2,INST|23,D00
_default_Stage_pulse1_pattern10:
	.byte NL8,INST|CONT|20,A2,NL4,INST|CONT|22,E2,NL8,INST|CONT|20,B2,NL4
	.byte INST|CONT|22,E2,NL8,INST|CONT|20,C3,NL4,INST|CONT|22,E2,NL8,INST|CONT|20
	.byte D3,NL4,INST|CONT|22,E2,NL2,INST|CONT|26,E3,NL10,INST|21,NL4
	.byte INST|CONT|22,A2,D00
_default_Stage_pulse1_pattern11:
	.byte NL4,INST|CONT|20,E3,INST|23,INST|CONT|20,A2,INST|23,INST|CONT|20,C3,E3
	.byte INST|23,INST|CONT|26,D3,NL16,INST|21,NL4,INST|CONT|22,G2,INST|CONT|20,D3
	.byte E3,F3,D00
_default_Stage_pulse1_pattern12:
	.byte NL3,INST|CONT|20,G3,NL1,INST|24,NL4,INST|20,INST|23,INST|20,INST|23
	.byte INST|CONT|20,E3,INST|23,INST|CONT|26,A3,INST|23,INST|CONT|20,G3,INST|23,INST|CONT|26
	.byte E3,INST|21,NL1,INST|CONT|20,D3,E3,NL2,D3,NL4,C3
	.byte A2,D00
_default_Stage_pulse1_pattern13:
	.byte NL4,INST|CONT|20,C3,INST|23,INST|20,D3,INST|23,INST|CONT|20,E3,INST|23
	.byte INST|CONT|26,D3,NL8,INST|21,NL4,INST|CONT|23,G2,INST|CONT|20,G3,NL8
	.byte INST|21,NL4,INST|CONT|23,G2,NL2,INST|CONT|20,G3,GS3,D00
_default_Stage_pulse1_pattern14:
	.byte NL2,INST|CONT|25,A3,NLC,46,INST|21,NL16,INST|CONT|22,A2,D00
_default_Stage_pulse1_pattern15:
	.byte NL1,INST|CONT|26,A3,NL7,INST|11,NL4,INST|CONT|12,C3,NL8,INST|CONT|13
	.byte A3,NL4,INST|CONT|14,C3,NL8,INST|CONT|15,A3,NL4,INST|CONT|14,C3
	.byte NL8,INST|CONT|17,A3,NL4,INST|CONT|14,C3,NL8,INST|CONT|17,A3,INST|1
	.byte D00
_default_Stage_pulse1_pattern16:
	.byte NL2,INST|CONT|7,A2,INST|8,INST|CONT|7,A1,INST|8,INST|CONT|7,A2,INST|8
	.byte INST|CONT|7,A1,INST|8,INST|7,INST|CONT|8,A2,NL1,INST|7,INST|8,INST|7
	.byte INST|8,NL4,INST|CONT|7,C3,NL3,D3,NL1,INST|8,INST|7,NL3
	.byte E3,NL4,G3,NL1,D3,NL7,E3,NL1,D3,NL3
	.byte DS3,NL4,D3,NL5,INST|CONT|10,A2,NL1,B2,C3,E3
	.byte D00
_default_Stage_pulse1_pattern17:
	.byte NL4,INST|CONT|20,A2,E2,A2,B2,E2,B2,C3,A2
	.byte NL2,C3,NL3,D3,A2,NL2,D3,NL3,E3,A2
	.byte NL2,INST|CONT|26,E3,NL10,INST|21,NL4,INST|CONT|22,A2,D00
_default_Stage_pulse1_pattern18:
	.byte NL8,INST|CONT|25,F3,NL12,INST|21,NL4,INST|CONT|20,G3,F3,NL20
	.byte INST|CONT|26,E3,NL8,INST|CONT|22,GS2,NL2,INST|CONT|20,A2,B2,C3
	.byte D3,D00
_default_Stage_pulse1_pattern19:
	.byte NL8,INST|CONT|20,D3,NL36,INST|21,NL4,INST|23,NL6,INST|CONT|20,E3
	.byte NL2,INST|23,NL6,INST|CONT|20,F3,NL2,INST|23,D00

_default_Stage_pulse2:
	.word _default_Stage_pulse2_pattern0
	.word _default_Stage_pulse2_pattern1
	.word _default_Stage_pulse2_pattern2
	.word _default_Stage_pulse2_pattern3
	.word _default_Stage_pulse2_pattern4
	.word _default_Stage_pulse2_pattern5
	.word _default_Stage_pulse2_pattern17
	.word _default_Stage_pulse2_pattern18
	.word _default_Stage_pulse2_pattern19
	.word _default_Stage_pulse2_pattern6
	.word _default_Stage_pulse2_pattern7
	.word _default_Stage_pulse2_pattern8
	.word _default_Stage_pulse2_pattern9
	.word _default_Stage_pulse2_pattern10
	.word _default_Stage_pulse2_pattern7
	.word _default_Stage_pulse2_pattern12
	.word _default_Stage_pulse2_pattern13
	.word _default_Stage_pulse2_pattern11
	.word _default_Stage_pulse2_pattern2
	.word _default_Stage_pulse2_pattern3
	.word _default_Stage_pulse2_pattern4
	.word _default_Stage_pulse2_pattern5
	.word _default_Stage_pulse2_pattern17
	.word _default_Stage_pulse2_pattern18
	.word _default_Stage_pulse2_pattern19
	.word _default_Stage_pulse2_pattern22
	.word _default_Stage_pulse2_pattern21
	.word _default_Stage_pulse2_pattern7
	.word _default_Stage_pulse2_pattern8
	.word _default_Stage_pulse2_pattern9
	.word _default_Stage_pulse2_pattern20
	.word _default_Stage_pulse2_pattern7
	.word _default_Stage_pulse2_pattern12
	.word _default_Stage_pulse2_pattern13
	.word _default_Stage_pulse2_pattern11
	.word _default_Stage_pulse2_pattern14
	.word _default_Stage_pulse2_pattern15
	.word _default_Stage_pulse2_pattern16
_default_Stage_pulse2_pattern0:
	.byte NL2,INST|CONT|7,A1,INST|8,INST|7,INST|8,INST|CONT|7,A2,INST|8,INST|CONT|7
	.byte A1,INST|8,INST|CONT|7,A2,INST|8,INST|CONT|7,A1,INST|8,NL4,INST|CONT|7
	.byte G2,A2,NL1,A1,NL3,INST|8,NL1,INST|CONT|7,A2,INST|8
	.byte INST|7,INST|8,NL2,INST|CONT|7,G2,INST|8,INST|CONT|7,A2,INST|8,NL4
	.byte INST|CONT|9,C3,INST|CONT|7,A2,G2,NL3,E2,NL1,INST|8,D00
_default_Stage_pulse2_pattern1:
	.byte NL1,INST|CONT|23,A2,C3,E3,C3,A3,E3,C3,E3
	.byte A2,C3,E3,C3,B2,D3,E3,D3,B3,E3
	.byte D3,E3,B2,D3,E3,D3,A2,C3,E3,C3
	.byte A3,E3,C3,E3,A2,C3,E3,C3,A3,E3
	.byte C3,E3,A2,C3,F3,C3,G3,F3,C3,F3
	.byte A2,C3,F3,C3,G3,F3,C3,F3,A2,GS2
	.byte G2,FS2,F2,E2,DS2,D2,D00
_default_Stage_pulse2_pattern2:
	.byte NL6,INST|CONT|1,D2,NL4,INST|CONT|23,A2,INST|15,NL8,INST|23,NL4
	.byte INST|CONT|16,E2,INST|CONT|23,C3,D3,E3,INST|15,INST|CONT|23,D3,INST|15
	.byte INST|CONT|23,C3,INST|15,INST|CONT|23,A2,NL2,B2,D00
_default_Stage_pulse2_pattern3:
	.byte NL2,INST|CONT|23,B2,NL4,B2,C3,D3,INST|15,INST|CONT|23,C3
	.byte INST|15,INST|CONT|23,B2,INST|15,INST|CONT|23,C3,INST|15,INST|CONT|23,B2,INST|15
	.byte NL12,INST|CONT|23,A2,NL2,INST|15,D00
_default_Stage_pulse2_pattern4:
	.byte NL4,INST|CONT|15,A2,INST|CONT|41,A3,B3,C4,INST|40,INST|CONT|41,D4
	.byte INST|40,NL1,INST|41,NL3,E4,NL4,INST|40,INST|CONT|41,G4,INST|40
	.byte NL1,INST|41,NL7,A4,NL1,G4,A4,NL2,G4,NL4
	.byte E4,C4,D00
_default_Stage_pulse2_pattern5:
	.byte NL4,INST|CONT|41,D4,INST|CONT|23,C4,INST|CONT|41,D4,E4,INST|40,INST|CONT|41
	.byte G4,INST|40,NL1,INST|41,NL5,A4,NL2,INST|CONT|42,G4,A4
	.byte G4,E4,D4,C4,A3,D4,C4,D4,E4,NL1
	.byte B3,C4,NL2,A3,G3,A3,D00
_default_Stage_pulse2_pattern6:
	.byte NL4,INST|CONT|41,A4,INST|40,INST|41,INST|40,INST|41,B4,A4,NL1
	.byte G4,NLC,19,GS4,NL8,INST|1,NL2,INST|CONT|19,E2,F2
	.byte G2,A2,D00
_default_Stage_pulse2_pattern7:
	.byte NL4,INST|CONT|19,C3,INST|23,INST|CONT|19,F2,INST|23,INST|CONT|19,A2,C3
	.byte INST|23,NL20,INST|CONT|19,B2,NL4,INST|23,INST|CONT|19,A2,G2,A2
	.byte D00
_default_Stage_pulse2_pattern8:
	.byte NL8,INST|CONT|19,B2,NL4,INST|23,INST|CONT|19,C3,INST|23,INST|CONT|19,B2
	.byte INST|23,INST|CONT|19,A2,INST|23,INST|CONT|19,G2,INST|23,NL8,INST|CONT|19,E2
	.byte NL4,INST|23,INST|19,G2,D00
_default_Stage_pulse2_pattern9:
	.byte NL4,INST|CONT|19,F2,INST|23,INST|CONT|19,C2,INST|23,INST|CONT|19,F2,A2
	.byte INST|23,NL16,INST|CONT|19,G2,NL2,A2,G2,NL4,E2,INST|23
	.byte INST|CONT|19,D2,INST|23,D00
_default_Stage_pulse2_pattern10:
	.byte NL8,INST|CONT|19,E2,NL4,INST|23,NL8,INST|CONT|19,G2,NL4,INST|23
	.byte NL8,INST|CONT|19,A2,NL4,INST|23,NL8,INST|CONT|19,B2,NL4,INST|23
	.byte NL1,INST|19,NL7,C3,NL8,INST|23,D00
_default_Stage_pulse2_pattern11:
	.byte NL4,INST|CONT|19,D3,INST|23,NL8,INST|19,NL4,INST|23,INST|19,INST|23
	.byte NL20,INST|CONT|19,CS3,NL8,INST|23,NL2,INST|CONT|7,D1,E1,F1
	.byte G1,D00
_default_Stage_pulse2_pattern12:
	.byte NL8,INST|CONT|19,B2,NL4,INST|23,INST|19,INST|23,INST|CONT|19,G2,INST|23
	.byte NL1,INST|CONT|19,B2,NL3,C3,NL4,INST|23,INST|CONT|19,B2,INST|23
	.byte NL1,INST|CONT|19,G2,NL11,A2,NL4,INST|31,NL2,C3,E3
	.byte D00
_default_Stage_pulse2_pattern13:
	.byte NL2,INST|CONT|31,F3,C3,A2,F2,C3,A2,F2,C2
	.byte A2,F2,C2,A1,C2,F2,A2,C3,G3,D3
	.byte B2,G2,D3,B2,G2,D2,B2,G2,D2,B1
	.byte D2,G2,B2,D3,D00
_default_Stage_pulse2_pattern14:
	.byte NL2,INST|CONT|7,F1,INST|8,INST|7,INST|8,INST|CONT|7,F2,INST|8,INST|CONT|7
	.byte F1,INST|8,INST|CONT|7,F2,INST|8,INST|CONT|7,F1,INST|8,NL4,INST|CONT|7
	.byte F2,NL6,G2,NL2,INST|8,INST|CONT|7,G1,INST|8,INST|CONT|7,G2
	.byte INST|8,INST|CONT|7,G1,INST|8,INST|CONT|7,G2,INST|8,INST|CONT|7,G1,INST|8
	.byte NL4,INST|CONT|7,G2,GS2,D00
_default_Stage_pulse2_pattern15:
	.byte NL2,INST|CONT|7,A1,INST|8,INST|7,INST|8,INST|CONT|7,A2,INST|8,INST|CONT|7
	.byte A1,INST|8,INST|CONT|7,A2,INST|8,INST|CONT|7,A1,INST|8,NL4,INST|CONT|7
	.byte G2,A2,NL1,A1,NL3,INST|8,NL1,INST|CONT|7,A2,INST|8
	.byte INST|7,INST|8,NL2,INST|CONT|7,C3,INST|8,INST|CONT|7,D3,INST|8,NL1
	.byte INST|7,NL3,DS3,NL4,D3,C3,A2,D00
_default_Stage_pulse2_pattern16:
	.byte NLC,56,INST|CONT|1,A2,NL4,INST|CONT|7,C3,G2,D00
_default_Stage_pulse2_pattern17:
	.byte NL6,INST|CONT|1,A3,NL4,INST|CONT|23,F3,INST|15,INST|23,G3,INST|15
	.byte INST|CONT|23,A3,INST|15,INST|CONT|23,E3,INST|15,INST|CONT|23,D3,INST|15,NL8
	.byte INST|CONT|23,C3,NL4,A2,NL2,B2,D00
_default_Stage_pulse2_pattern18:
	.byte NL2,INST|CONT|23,B2,NL4,C3,D3,INST|15,INST|23,C3,INST|15
	.byte INST|CONT|23,B2,INST|15,INST|CONT|23,C3,INST|15,INST|CONT|23,D3,INST|15,INST|CONT|23
	.byte E3,NL8,E3,NL2,INST|CONT|15,A2,D00
_default_Stage_pulse2_pattern19:
	.byte NL4,INST|CONT|1,A2,INST|CONT|41,F3,A3,B3,C4,B3,A3
	.byte NL1,B3,NL3,C4,NL4,INST|40,INST|CONT|41,D4,INST|40,NL1
	.byte INST|41,NL6,E4,NL1,INST|40,NL4,INST|41,F4,G4,D00
_default_Stage_pulse2_pattern20:
	.byte NL4,INST|CONT|19,E2,A1,E2,G2,A1,G2,A2,C2
	.byte NL2,A2,NL3,B2,C2,NL2,B2,NL3,C3,C2
	.byte NL1,B2,NL7,C3,NL8,INST|23,D00
_default_Stage_pulse2_pattern21:
	.byte NL1,INST|CONT|41,GS4,NLC,19,A4,NL4,B4,A4,NL1
	.byte FS4,NLC,19,GS4,NL8,INST|1,NL2,INST|CONT|19,E2,F2
	.byte G2,A2,D00
_default_Stage_pulse2_pattern22:
	.byte NL2,INST|CONT|44,A4,F4,D4,A3,F4,D4,A3,F3
	.byte D4,A3,F3,D3,A3,F3,D3,A2,F2,A2
	.byte D3,F3,A2,D3,F3,A3,D3,F3,A3,D4
	.byte A3,D4,F4,A4,D00

_default_Stage_triangle:
	.word _default_Stage_triangle_pattern0
	.word _default_Stage_triangle_pattern1
	.word _default_Stage_triangle_pattern2
	.word _default_Stage_triangle_pattern3
	.word _default_Stage_triangle_pattern2
	.word _default_Stage_triangle_pattern3
	.word _default_Stage_triangle_pattern4
	.word _default_Stage_triangle_pattern5
	.word _default_Stage_triangle_pattern4
	.word _default_Stage_triangle_pattern6
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern8
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern10
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern8
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern9
	.word _default_Stage_triangle_pattern2
	.word _default_Stage_triangle_pattern3
	.word _default_Stage_triangle_pattern2
	.word _default_Stage_triangle_pattern3
	.word _default_Stage_triangle_pattern4
	.word _default_Stage_triangle_pattern5
	.word _default_Stage_triangle_pattern4
	.word _default_Stage_triangle_pattern12
	.word _default_Stage_triangle_pattern11
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern8
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern10
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern8
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern9
	.word _default_Stage_triangle_pattern7
	.word _default_Stage_triangle_pattern0
	.word _default_Stage_triangle_pattern0
_default_Stage_triangle_pattern0:
	.byte NL4,INST|CONT|7,A2,INST|1,INST|7,INST|1,INST|7,INST|1,INST|CONT|7,G2
	.byte A2,INST|1,INST|7,INST|1,INST|CONT|7,G2,A2,INST|1,INST|7,E2
	.byte D00
_default_Stage_triangle_pattern1:
	.byte NL8,INST|CONT|7,A2,NL4,E2,NL8,B2,NL4,E2,NL8
	.byte C3,E2,NL16,F3,NL2,E3,D3,C3,B2,D00
_default_Stage_triangle_pattern2:
	.byte NL4,INST|CONT|7,A1,INST|1,INST|CONT|7,A2,INST|1,INST|CONT|7,G2,A2
	.byte G2,NL7,A2,NL1,INST|1,NL4,INST|7,G2,A2,NL1
	.byte B2,NL3,C3,NL4,A2,G2,E2,D00
_default_Stage_triangle_pattern3:
	.byte NL4,INST|CONT|7,F2,INST|1,NL7,INST|7,NL1,INST|1,NL3,INST|CONT|7
	.byte E2,NL1,INST|1,NL4,INST|7,INST|1,NL8,INST|CONT|7,A1,NL1
	.byte G2,NL3,A2,NL4,G2,A2,NL1,B2,NL3,C3
	.byte NL4,A2,G2,E2,D00
_default_Stage_triangle_pattern4:
	.byte NL8,INST|CONT|7,F1,NL4,F2,INST|1,INST|7,A2,NL3,B2
	.byte NL1,INST|1,INST|7,NL11,INST|CONT|32,C3,NL4,INST|CONT|7,C2,INST|1
	.byte INST|7,B1,NL8,C2,D00
_default_Stage_triangle_pattern5:
	.byte NL6,INST|CONT|7,B2,NL2,INST|1,NL4,INST|7,NL6,GS2,NL2
	.byte INST|1,NL6,INST|CONT|7,E2,NL2,INST|1,NL1,INST|CONT|7,G2,NL11
	.byte INST|CONT|32,A2,NL4,INST|CONT|7,A1,A1,INST|8,G1,A1,INST|1
	.byte D00
_default_Stage_triangle_pattern6:
	.byte NL4,INST|CONT|7,D2,INST|CONT|1,F2,INST|7,INST|1,INST|7,F2,INST|1
	.byte NL20,INST|CONT|7,B2,NL4,B1,C2,D2,E2,D00
_default_Stage_triangle_pattern7:
	.byte NL5,INST|CONT|7,F2,NL3,INST|1,NL8,INST|7,NL4,F1,NL8
	.byte F2,G2,NL4,G1,NL8,G2,NL3,G1,NL1,INST|1
	.byte NL4,INST|7,NL8,G2,D00
_default_Stage_triangle_pattern8:
	.byte NL5,INST|CONT|7,E2,NL3,INST|CONT|1,F2,NL8,INST|CONT|7,E2,NL4
	.byte E1,NL8,E2,A2,NL4,A1,NL8,A2,NL3,A1
	.byte NL1,INST|1,NL2,INST|7,INST|1,NL8,INST|CONT|7,A2,D00
_default_Stage_triangle_pattern9:
	.byte NL5,INST|CONT|7,A2,NL3,INST|1,NL8,INST|7,NL4,A1,NL5
	.byte A2,NL3,INST|1,NL4,INST|7,NL24,INST|32,NL8,INST|12,D00
_default_Stage_triangle_pattern10:
	.byte NL12,INST|CONT|7,A2,B2,C3,B2,NL8,A2,G2,D00
_default_Stage_triangle_pattern11:
	.byte NL32,INST|CONT|32,B2,NL12,E3,NL20,INST|CONT|41,E2,D00
_default_Stage_triangle_pattern12:
	.byte NL4,INST|CONT|44,D2,INST|1,INST|CONT|44,D3,INST|1,INST|44,C3,D3
	.byte D2,INST|1,INST|44,D3,E3,F3,E3,D3,F3,D00

_default_Stage_noise:
	.word _default_Stage_noise_pattern0
	.word _default_Stage_noise_pattern1
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern3
	.word _default_Stage_noise_pattern7
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern8
	.word _default_Stage_noise_pattern9
	.word _default_Stage_noise_pattern4
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern5
	.word _default_Stage_noise_pattern4
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern4
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern3
	.word _default_Stage_noise_pattern7
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern8
	.word _default_Stage_noise_pattern8
	.word _default_Stage_noise_pattern11
	.word _default_Stage_noise_pattern4
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern5
	.word _default_Stage_noise_pattern4
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern2
	.word _default_Stage_noise_pattern6
	.word _default_Stage_noise_pattern0
	.word _default_Stage_noise_pattern10
_default_Stage_noise_pattern0:
	.byte NL8,INST|CONT|27,$6,NL4,INST|CONT|28,$D,$D,$D,$D,$D
	.byte $D,$D,$D,$D,$D,$D,$D,$D,NL2,$D
	.byte $C,D00
_default_Stage_noise_pattern1:
	.byte NL12,INST|CONT|27,$6,$6,NL16,$6,NL24,$6,D00
_default_Stage_noise_pattern2:
	.byte NL4,INST|CONT|29,$2,INST|CONT|28,$E,INST|CONT|30,$9,INST|CONT|28,$E,INST|CONT|29
	.byte $2,$2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28,$F,INST|CONT|29,$2
	.byte INST|CONT|30,$9,INST|CONT|28,$E,INST|CONT|29,$2,$2,INST|CONT|30,$9,INST|CONT|28
	.byte $E,D00
_default_Stage_noise_pattern3:
	.byte NL4,INST|CONT|29,$2,INST|CONT|28,$E,INST|CONT|30,$9,INST|CONT|28,$E,INST|CONT|29
	.byte $2,$2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28,$F,INST|CONT|29,$2
	.byte INST|CONT|30,$9,INST|CONT|28,$E,INST|CONT|29,$2,$2,INST|CONT|30,$9,$9
	.byte D00
_default_Stage_noise_pattern4:
	.byte NL8,INST|CONT|27,$8,NL4,INST|CONT|30,$9,INST|CONT|28,$E,INST|CONT|29,$2
	.byte $2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28,$F,INST|CONT|29,$2,INST|CONT|30
	.byte $9,INST|CONT|28,$E,INST|CONT|29,$2,$2,INST|CONT|30,$9,INST|CONT|28,$E
	.byte D00
_default_Stage_noise_pattern5:
	.byte NL12,INST|CONT|27,$8,$8,$8,$8,NL8,$8,NL4,INST|CONT|28
	.byte $D,NL2,INST|CONT|30,$C,$C,D00
_default_Stage_noise_pattern6:
	.byte NL8,INST|CONT|27,$6,NL4,INST|CONT|28,$D,$D,$D,$D,$D
	.byte NL12,INST|CONT|27,$6,NL4,INST|CONT|28,$D,$D,$D,$D,$D
	.byte NL2,$D,$C,D00
_default_Stage_noise_pattern7:
	.byte NL8,INST|CONT|27,$6,NL4,INST|CONT|30,$9,NL2,INST|CONT|28,$E,INST|CONT|30
	.byte $C,NL4,INST|CONT|29,$2,$2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28
	.byte $E,INST|CONT|29,$2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28,$E,INST|CONT|29
	.byte $2,INST|CONT|30,$9,INST|CONT|28,$E,D00
_default_Stage_noise_pattern8:
	.byte NL4,INST|CONT|29,$2,INST|CONT|28,$E,INST|CONT|30,$9,NL2,INST|CONT|28,$E
	.byte INST|CONT|30,$C,NL4,INST|CONT|29,$2,$2,INST|CONT|30,$9,INST|CONT|29,$2
	.byte INST|CONT|28,$E,INST|CONT|29,$2,INST|CONT|30,$9,INST|CONT|29,$2,INST|CONT|28,$E
	.byte INST|CONT|29,$2,INST|CONT|30,$9,INST|CONT|28,$E,D00
_default_Stage_noise_pattern9:
	.byte NL4,INST|CONT|45,$8,INST|CONT|28,$E,INST|CONT|45,$8,INST|CONT|28,$E,INST|CONT|45
	.byte $8,$8,INST|CONT|28,$E,NL24,INST|CONT|27,$6,NL2,INST|CONT|30,$D
	.byte $C,NL4,$B,$B,D00
_default_Stage_noise_pattern10:
	.byte NL4,INST|CONT|28,$D,$D,$D,$D,$D,$D,$D,$D
	.byte $D,$D,$D,$D,$D,$D,$D,NL2,$D,$C
	.byte D00
_default_Stage_noise_pattern11:
	.byte NL4,INST|CONT|29,$2,INST|CONT|28,$E,INST|CONT|30,$9,NL2,INST|CONT|28,$E
	.byte INST|CONT|30,$C,NL4,INST|CONT|29,$2,$2,INST|CONT|30,$9,NL12,INST|CONT|27
	.byte $7,INST|CONT|30,$A,NL4,$A,NL2,INST|CONT|45,$9,$9,$9
	.byte $9,D00

_default_Transmission_header:
	.byte 6
	.byte 150
	.byte 2
	.word _default_Transmission_pulse1
	.word _default_Transmission_pulse2
	.word _default_Transmission_triangle
	.word _default_Transmission_noise
	.word NULL_DMC

_default_Transmission_pulse1:
	.word _default_Transmission_pulse1_pattern0
	.word _default_Transmission_pulse1_pattern0
_default_Transmission_pulse1_pattern0:
	.byte NL64,INST|CONT|1,C2,BXX,$01

_default_Transmission_pulse2:
	.word _default_Transmission_pulse2_pattern0
	.word _default_Transmission_pulse2_pattern0
_default_Transmission_pulse2_pattern0:
	.byte NL64,INST|CONT|1,C2,BXX,$01

_default_Transmission_triangle:
	.word _default_Transmission_triangle_pattern0
	.word _default_Transmission_triangle_pattern1
_default_Transmission_triangle_pattern0:
	.byte NL4,INST|CONT|1,AS0,NLC,60,INST|6,D00
_default_Transmission_triangle_pattern1:
	.byte NL64,INST|CONT|6,AS0,BXX,$01

_default_Transmission_noise:
	.word _default_Transmission_noise_pattern0
	.word _default_Transmission_noise_pattern1
_default_Transmission_noise_pattern0:
	.byte NL4,INST|CONT|1,$E,NLC,60,INST|5,D00
_default_Transmission_noise_pattern1:
	.byte NL64,INST|CONT|5,$E,BXX,$01

_default_Boss_header:
	.byte 3
	.byte 180
	.byte 4
	.word _default_Boss_pulse1
	.word _default_Boss_pulse2
	.word _default_Boss_triangle
	.word _default_Boss_noise
	.word _default_Boss_DMC

_default_Boss_pulse1:
	.word _default_Boss_pulse1_pattern0
	.word _default_Boss_pulse1_pattern0
	.word _default_Boss_pulse1_pattern0
	.word _default_Boss_pulse1_pattern1
_default_Boss_pulse1_pattern0:
	.byte NL8,INST|CONT|31,F1,NL6,INST|CONT|33,F2,F2,NL4,F2,NL16
	.byte INST|34,NL24,INST|35,D00
_default_Boss_pulse1_pattern1:
	.byte NL8,INST|CONT|31,F1,NL6,INST|CONT|33,F2,F2,NL4,F2,NL9
	.byte INST|34,NL3,INST|1,NL4,INST|CONT|32,F1,F2,INST|1,INST|CONT|32,FS2
	.byte INST|1,INST|CONT|32,DS2,F2,D00

_default_Boss_pulse2:
	.word _default_Boss_pulse2_pattern0
	.word _default_Boss_pulse2_pattern0
	.word _default_Boss_pulse2_pattern0
	.word _default_Boss_pulse2_pattern1
_default_Boss_pulse2_pattern0:
	.byte NL12,INST|CONT|6,F1,F1,NL16,F1,NL12,F1,F1,D00
_default_Boss_pulse2_pattern1:
	.byte NL12,INST|CONT|6,F1,F1,F1,NL4,INST|23,F2,INST|1,INST|CONT|23
	.byte FS2,INST|1,INST|CONT|23,DS2,F2,D00

_default_Boss_triangle:
	.word _default_Boss_triangle_pattern0
	.word _default_Boss_triangle_pattern0
	.word _default_Boss_triangle_pattern0
	.word _default_Boss_triangle_pattern1
_default_Boss_triangle_pattern0:
	.byte NL8,INST|CONT|32,F1,NL4,F2,NL8,F1,NL4,F2,NL40
	.byte F1,D00
_default_Boss_triangle_pattern1:
	.byte NL8,INST|CONT|32,F1,NL4,F2,NL8,F1,NL4,F2,NL8
	.byte INST|12,NL16,INST|CONT|32,F1,NL8,FS1,NL4,DS1,F1,D00

_default_Boss_noise:
	.word _default_Boss_noise_pattern2
	.word _default_Boss_noise_pattern0
	.word _default_Boss_noise_pattern0
	.word _default_Boss_noise_pattern1
_default_Boss_noise_pattern0:
	.byte NL4,INST|CONT|36,$0,INST|CONT|30,$D,INST|CONT|37,$8,INST|CONT|28,$B,$C
	.byte INST|CONT|36,$0,INST|CONT|37,$8,INST|CONT|28,$C,INST|CONT|36,$0,INST|CONT|30,$D
	.byte INST|CONT|37,$8,NL2,INST|CONT|28,$A,INST|CONT|30,$8,NL4,INST|CONT|28,$F
	.byte INST|CONT|36,$0,INST|CONT|37,$8,INST|CONT|30,$D,D00
_default_Boss_noise_pattern1:
	.byte NL4,INST|CONT|36,$0,INST|CONT|30,$D,INST|CONT|37,$8,NL2,INST|CONT|28,$B
	.byte INST|CONT|30,$D,INST|CONT|28,$C,INST|CONT|30,$D,NL4,INST|CONT|37,$8,NL2
	.byte INST|CONT|28,$B,INST|CONT|30,$D,INST|CONT|28,$C,INST|CONT|30,$D,NL1,INST|CONT|37
	.byte $0,NLC,31,INST|CONT|27,$5,D00
_default_Boss_noise_pattern2:
	.byte NL1,INST|CONT|37,$0,NL7,INST|CONT|27,$5,NL4,INST|CONT|37,$8,INST|CONT|28
	.byte $B,$C,INST|CONT|36,$0,INST|CONT|37,$8,INST|CONT|28,$C,INST|CONT|36,$0
	.byte INST|CONT|30,$D,INST|CONT|37,$8,NL2,INST|CONT|28,$A,INST|CONT|30,$8,NL4
	.byte INST|CONT|28,$F,INST|CONT|36,$0,INST|CONT|37,$8,INST|CONT|30,$D,D00

_default_Boss_DMC:
	.word _default_Boss_DMC_pattern0
	.word _default_Boss_DMC_pattern0
	.word _default_Boss_DMC_pattern0
	.word _default_Boss_DMC_pattern1
_default_Boss_DMC_pattern0:
	.byte NL64,NUL,D00
_default_Boss_DMC_pattern1:
	.byte NL36,NUL,NL4,F1,NL8,F2,FS2,NL4,DS2,F2
	.byte D00

_default_Win_header:
	.byte 2
	.byte 180
	.byte 1
	.word _default_Win_pulse1
	.word _default_Win_pulse2
	.word _default_Win_triangle
	.word _default_Win_noise
	.word NULL_DMC

_default_Win_pulse1:
	.word _default_Win_pulse1_pattern0
_default_Win_pulse1_pattern0:
	.byte NL3,INST|CONT|10,F2,NL1,INST|40,NL3,INST|10,NL5,INST|40,NL3
	.byte INST|CONT|10,GS2,NL5,INST|40,NL3,INST|CONT|10,C3,NL1,INST|40,NL15
	.byte INST|CONT|10,F3,NL9,INST|40,NL4,INST|CONT|10,G3,F3,G3,A3
	.byte NL32,INST|11,NL2,INST|CONT|46,F3,G3,A3,C4,F4,INST|CONT|47
	.byte F3,G3,A3,C4,F4,INST|CONT|48,F3,G3,A3,C4
	.byte F4,NL8,INST|CONT|1,F3,C00

_default_Win_pulse2:
	.word _default_Win_pulse2_pattern0
_default_Win_pulse2_pattern0:
	.byte NL3,INST|CONT|41,GS2,NL1,INST|43,NL3,INST|41,NL5,INST|43,NL3
	.byte INST|CONT|41,C3,NL5,INST|43,NL3,INST|CONT|41,F3,NL1,INST|43,NL15
	.byte INST|CONT|41,GS3,NL9,INST|43,NL4,INST|CONT|41,AS3,A3,AS3,NL36
	.byte C4,NL3,INST|1,NL2,INST|CONT|48,F3,G3,A3,C4,F4
	.byte INST|CONT|49,F3,G3,A3,C4,F4,NL15,INST|CONT|1,E3,C00

_default_Win_triangle:
	.word _default_Win_triangle_pattern0
_default_Win_triangle_pattern0:
	.byte NL8,INST|CONT|32,F2,NL4,F1,NL8,F2,NL4,INST|1,NL16
	.byte INST|32,NL8,INST|1,INST|CONT|32,A2,C3,NL16,F2,INST|22,INST|CONT|32
	.byte F1,NL22,INST|1,C00

_default_Win_noise:
	.word _default_Win_noise_pattern0
_default_Win_noise_pattern0:
	.byte NL12,INST|CONT|27,$5,$5,$5,NL28,INST|CONT|5,$E,NL16,INST|CONT|27
	.byte $5,NL32,INST|CONT|5,$E,NL22,INST|CONT|1,$F,C00

_default_End_header:
	.byte 6
	.byte 120
	.byte 2
	.word _default_End_pulse1
	.word _default_End_pulse2
	.word _default_End_triangle
	.word NULL_noise
	.word NULL_DMC

_default_End_pulse1:
	.word _default_End_pulse1_pattern0
	.word _default_End_pulse1_pattern1
_default_End_pulse1_pattern0:
	.byte NL4,INST|CONT|51,E5,A4,C5,E5,NL10,D5,NL2,D5
	.byte E5,F5,NL4,G5,NL2,G5,NL6,G5,NL4,E5
	.byte A5,G5,NL2,E5,FXX,$07,D5,C5,A4,NL4,C5
	.byte C5,NL2,D5,NL4,FXX,$08,E5,NL10,D5,NL8,FXX,$09
	.byte G5,D00
_default_End_pulse1_pattern1:
	.byte NLC,44,FXX,$03,INST|CONT|51,A5,NL1,INST|CONT|52,A3,INST|49,INST|52
	.byte INST|49,NL2,INST|52,NL14,INST|1,C00

_default_End_pulse2:
	.word _default_End_pulse2_pattern0
	.word _default_End_pulse2_pattern1
_default_End_pulse2_pattern0:
	.byte NL4,INST|CONT|52,A2,C3,E3,C3,G2,B2,D3,B2
	.byte F2,A2,G2,B2,A2,C3,E3,C3,F2,A2
	.byte C3,A2,G2,B2,D3,G3,D00
_default_End_pulse2_pattern1:
	.byte NL1,INST|CONT|52,A4,INST|CONT|53,A3,INST|CONT|52,E4,INST|CONT|53,A4,INST|CONT|52
	.byte CS4,INST|CONT|53,E4,INST|CONT|52,B3,INST|CONT|53,CS4,INST|CONT|52,E4,INST|CONT|53
	.byte B3,INST|CONT|52,CS4,INST|CONT|53,E4,INST|CONT|52,B3,INST|CONT|53,CS4,INST|CONT|52
	.byte A3,INST|CONT|53,B3,INST|CONT|52,CS4,INST|CONT|53,A3,INST|CONT|52,B3,INST|CONT|53
	.byte CS4,INST|CONT|52,A3,INST|CONT|53,B3,INST|CONT|52,E3,INST|CONT|53,A3,INST|52
	.byte INST|CONT|53,E3,INST|52,INST|CONT|53,A3,INST|CONT|52,CS3,INST|CONT|53,E3,INST|CONT|52
	.byte B2,INST|CONT|53,CS3,NL12,INST|CONT|52,A2,NL1,A2,INST|49,INST|52
	.byte INST|49,NL2,INST|52,NL14,INST|CONT|1,A1,C00

_default_End_triangle:
	.word _default_End_triangle_pattern0
	.word _default_End_triangle_pattern1
_default_End_triangle_pattern0:
	.byte NL16,INST|CONT|21,A2,G2,NL8,F2,G2,NL16,A2,F2
	.byte NL8,G2,B2,D00
_default_End_triangle_pattern1:
	.byte NLC,44,INST|CONT|21,CS4,NL1,A2,INST|1,INST|21,INST|1,NL2
	.byte INST|21,NL14,INST|1,C00

_default_Death_header:
	.byte 2
	.byte 120
	.byte 1
	.word _default_Death_pulse1
	.word _default_Death_pulse2
	.word _default_Death_triangle
	.word _default_Death_noise
	.word NULL_DMC

_default_Death_pulse1:
	.word _default_Death_pulse1_pattern0
_default_Death_pulse1_pattern0:
	.byte NL1,INST|CONT|57,CS6,A5,DS5,AS4,F4,FS3,FS3,CS6
	.byte A5,DS5,AS4,F4,FS3,INST|50,INST|CONT|57,CS6,A5,DS5
	.byte AS4,F4,FS3,F3,NL11,INST|CONT|1,C3,D00

_default_Death_pulse2:
	.word _default_Death_pulse2_pattern0
_default_Death_pulse2_pattern0:
	.byte NL1,INST|CONT|54,CS5,A4,DS4,AS3,F3,FS2,INST|4,CS5
	.byte A4,DS4,AS3,F3,FS2,INST|50,CS5,A4,DS4,AS3
	.byte F3,FS2,F2,NL10,INST|CONT|1,C2,C00

_default_Death_triangle:
	.word _default_Death_triangle_pattern0
_default_Death_triangle_pattern0:
	.byte NL32,INST|CONT|1,C3,D00

_default_Death_noise:
	.word _default_Death_noise_pattern0
_default_Death_noise_pattern0:
	.byte NL32,INST|CONT|27,$6,D00

_default_GameOver_header:
	.byte 4
	.byte 150
	.byte 1
	.word _default_GameOver_pulse1
	.word _default_GameOver_pulse2
	.word _default_GameOver_triangle
	.word _default_GameOver_noise
	.word NULL_DMC

_default_GameOver_pulse1:
	.word _default_GameOver_pulse1_pattern0
_default_GameOver_pulse1_pattern0:
	.byte NL1,INST|CONT|20,A4,INST|42,INST|CONT|20,G4,INST|42,INST|CONT|20,E4,INST|42
	.byte INST|CONT|20,D4,INST|42,INST|CONT|20,E4,INST|42,INST|CONT|20,D4,INST|42,INST|CONT|20
	.byte C4,INST|42,INST|CONT|20,A3,INST|42,INST|CONT|20,D4,INST|42,INST|CONT|20,C4
	.byte INST|42,INST|CONT|20,G3,INST|42,NL4,INST|CONT|20,A3,NL1,INST|22,NL5
	.byte A3,NL16,INST|1,C00

_default_GameOver_pulse2:
	.word _default_GameOver_pulse2_pattern0
_default_GameOver_pulse2_pattern0:
	.byte NL2,INST|CONT|31,E3,D3,C3,B2,C3,B2,A2,E2
	.byte A2,G2,D2,NL4,E2,NL6,A1,NL16,INST|1,D00

_default_GameOver_triangle:
	.word _default_GameOver_triangle_pattern0
_default_GameOver_triangle_pattern0:
	.byte NL6,INST|CONT|32,A2,NL2,A1,NL6,B2,NL2,B1,NL4
	.byte C3,NL2,G2,NL3,A2,NL1,INST|1,NL3,INST|CONT|32,A1
	.byte NLC,19,INST|1,D00

_default_GameOver_noise:
	.word _default_GameOver_noise_pattern0
_default_GameOver_noise_pattern0:
	.byte NL6,INST|CONT|27,$6,NL28,INST|CONT|5,$E,NL14,INST|1,D00

