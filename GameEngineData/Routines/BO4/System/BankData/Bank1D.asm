pcmTestStart:
    .incbin "Routines/BO4/Sound/sample.bin"
pcmTestEnd:

.org $BFFE
.dw  pcmTestEnd-pcmTestStart
