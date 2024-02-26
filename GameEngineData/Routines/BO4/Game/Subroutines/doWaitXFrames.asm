doWaitXFrames:
    JSR doWaitFrame
    DEX
    BNE doWaitXFrames
    RTS