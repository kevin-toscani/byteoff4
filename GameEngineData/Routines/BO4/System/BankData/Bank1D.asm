pcmTestStart:
.incbin "Routines/BO4/Sound/pcm_test.bin"
pcmTestEnd:

.org $BFFE
.dw  pcmTestEnd-pcmTestStart
