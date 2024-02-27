    LDA screenType
    BNE +screen01
        JMP +done


+screen01:    
    CMP #$01
    BEQ +
        JMP +screen02
    +
    
    ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0A
    STA bckPal+15
    JSR doUpdateBackgroundPalette


    ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0A
    STA bckPal+14
    LDA #$1A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait 8 frames, then load the final colors
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0A
    STA bckPal+13
    LDA #$1A
    STA bckPal+14
    LDA #$2A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    ;; Wait $88 frames, then fade out
    LDX #$88
    JSR doWaitXFrames

    LDA #$0F
    STA bckPal+13
    LDA #$0A
    STA bckPal+14
    LDA #$1A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

   ;; Wait 8 frames, then load the new colors
    LDX #$08
    JSR doWaitXFrames

    LDA #$0F
    STA bckPal+14
    LDA #$0A
    STA bckPal+15
    JSR doUpdateBackgroundPalette

   ;; Wait 8 frames, then warp to the next screen
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0F
    STA bckPal+15
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames
    
    WarpToScreen #$00, #$E1, #$01
    JMP +done

    
    
+screen02:
    CMP #$02
    BEQ +
        JMP +screen03
    +
    
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$00
    STA bckPal+3
    STA bckPal+7
    JSR doUpdateBackgroundPalette
    
    LDX #$08
    JSR doWaitXFrames

    LDA #$10
    STA bckPal+3
    STA bckPal+7
    LDA #$00
    STA bckPal+2
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames

    LDA #$20
    STA bckPal+3
    STA bckPal+7
    LDA #$10
    STA bckPal+2
    LDA #$00
    STA bckPal+1
    STA bckPal+5
    JSR doUpdateBackgroundPalette
    
    LDX #$88
    JSR doWaitXFrames

    LDA #$10
    STA bckPal+3
    STA bckPal+7
    LDA #$00
    STA bckPal+2
    LDA #$0F
    STA bckPal+1
    STA bckPal+5
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames

    LDA #$00
    STA bckPal+3
    STA bckPal+7
    LDA #$0F
    STA bckPal+2
    JSR doUpdateBackgroundPalette
    
    LDX #$08
    JSR doWaitXFrames
    
    LDA #$0F
    STA bckPal+3
    STA bckPal+7
    JSR doUpdateBackgroundPalette

    LDX #$08
    JSR doWaitXFrames
    
    WarpToScreen #$00, #$E2, #$01
    JMP +done


+screen03:
    .include "Routines/BO4/Game/IntroHandler.asm"


+done: