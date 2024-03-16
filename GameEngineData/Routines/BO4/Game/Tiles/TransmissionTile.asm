TRANSMISSION_INTRO_TICK = $0A
TRANSMISSION_SPEAK_TICK = $01

    ;; Nullify current tile
    ChangeTileAtCollision #$4E, #$00

    ;; Preset intro and speak timers for transmission
    LDA #TRANSMISSION_INTRO_TICK
    STA introTimer
    
    LDA #TRANSMISSION_SPEAK_TICK
    STA speakTimer

    ;; Don't draw any sprites (apart from sprite zero)
    HideSprites
    
    ;; Play a fun glitchy sound
    PlaySound #_sfx_shake
    JSR doHandleUpdateMusic_safe

    ;; Do a fun glitchy effect
    TXA
    PHA
    TYA
    PHA

    LDX #$18
    -glitchyLoop:
        TXA
        PHA
    
        ;; Put sprite-zero in place
        LDA #$20
        STA $0200
        LDA #$7D
        STA $0201
        LDA #$02
        STA $0202
        LDA #$80
        SEC
        SBC camX
        STA $0203
        
        ;; Clear other sprites
        LDY #$04
        -
            LDA #$FE
            STA $0200,y
            INY
        BNE -
        
        ;; Do palette shenanigans
        TXA
        AND #$02
        BEQ +
            JSR doGetRandomNumberToo
            AND #$01
            CLC
            ADC #$05
            STA temp
            LoadBackgroundPalettes temp
        +

        ;; Wait until the end of the frame
        JSR doWaitFrame
        
        ;; Now wait for sprite 0 reset
        LDA #$40
        - BIT $2002
        BNE -
    
        ;; Now wait for sprite 0 hit
        LDA #$40
        - BIT $2002
        BEQ -
        
        ;; Now, every (x) frames, preferably when in HBlank,
        ;; move the screen across the x-axis somewhere between
        ;; -2 and 2 pixels.

        ;; Let's get this thing into HBlank first
        ;; ...or not, as the random script thing is gonna take
        ;; quite a few ppu cycles either way.
        
        ; LDY #$03
        ; - DEY
        ; BNE -
        ; NOP
        
        ;; We're gonna move the scroll multiple times, so we
        ;; need to set up a loop
        LDX #102
        -lineShakeLoop:
        
            ;; Let's update the scroll
            JSR doGetRandomNumberToo
            AND #$03
            SEC
            SBC #$02
            ASL
            CLC
            ADC camX
            STA $2005
            LDA #$00
            STA $2005
            
            ; 141 read 303 done = 162 PPU cycles
            ; so we need to burn (682-162=) 520 more
            ; 520 ppu = (520/3) = 173,3333 cpu cycles
            
            ; also, we're at scanline 33 now, and the last
            ; line shift is at 237, so we want this script
            ; to loop 237-33/2 = 102 times.
            
            ; opcode         ; cycles
            LDY #33          ; 0y + 2
            - DEY            ; 2y + 2
            BNE -            ; 5y + 1
            NOP              ; 5y + 2
            NOP              ; 5y + 3
            DEX              ; 5y + 5
        BNE -lineShakeLoop   ; 5y + 8 = 173; 5y = 165, y = 33
        
        ; the 0,3333333 is unfortunate, but luckily not
        ; too noticeable on screen. I might redo this with
        ; thicker glitchlines to get the timing down to a
        ; round number, but that's on the wishlist for now.
        
        PLA
        TAX
        DEX
    BNE -glitchyLoop

    PLA
    TAY
    PLA
    TAX
    ;; End of fun glitchy effect



    ;; Play transmission music
    PlaySong #_default_Transmission
    JSR doWaitFrame
    JSR doHandleUpdateMusic_safe

    
    ;; Draw incoming transmission tiles
    LoadBackgroundPalettes #$06
    JSR doWaitFrame

    TXA
    PHA

    LDX #$00
    -transmissionLoop:
        ;; Check if it's time to do something
        LDA introTimer
        BEQ +
            JSR doWaitFrame
            DEC introTimer
            JMP -transmissionLoop
        +
        
        ;; Check if it's time to "speak"
        ;; Replaced with beep for every character
;        LDA speakTimer
;        BNE +
;            PlaySound #_sfx_bip
;            JSR doHandleUpdateMusic_safe
;            LDA #TRANSMISSION_SPEAK_TICK
;            STA speakTimer
;        +

        
        ;; Get next transmission character
        LDA tblTransmissionText00,x
        
        ;; Acc = $00: end of transmission
        BNE +
            JMP +restoreGameplay
        +
        
        ;; Acc >= $80: draw character
        BPL +
            STA scrollUpdateRam+2
            LDA introPPU
            STA scrollUpdateRam
            LDA introPPU+1
            STA scrollUpdateRam+1
            LDA #$03
            STA maxScrollOffsetCounter
            INC introPPU+1
            LDA updateScreenData
            ORA #%00000100
            STA updateScreenData
            LDA #TRANSMISSION_INTRO_TICK
            STA introTimer

            ;DEC speakTimer
            PlaySound #_sfx_bip
            JSR doHandleUpdateMusic_safe

            INX
            JMP -transmissionLoop
        +
        
        ;; Acc = $01: set PPU pointer 
        CMP #$01
        BNE +
            INX
            LDA tblTransmissionText00,x
            STA introPPU
            INX
            LDA tblTransmissionText00,x
            STA introPPU+1
            INX
            JMP -transmissionLoop
        +
        
        ;; Acc = $02: pause frames
        CMP #$02
        BNE +
            INX
            LDA tblTransmissionText00,x
            STA introTimer
            INX
            JMP -transmissionLoop            
        +
        
        ;; Acc = $03: warp to screen
        CMP #$03
        BNE +
            INX
            LDA tblTransmissionText00,x
            STA temp
            WarpToScreen #$00, temp, #$01
            PLA
            TAX
            JMP +done
        +
        
        ;; Acc between $04 and $7F
        ;; Invalid operation; try the next one
        INX
    JMP -transmissionLoop            

    ;; Transmission over - restore gameplay
    +restoreGameplay:
    PLA
    TAX

    ;; Restore sprites and palette
    ShowSprites
    LoadBackgroundPalettes #$05
    JMP +done


tblTransmissionText00:
    .db $02, $20                   ; pause 20 frames
    .db $01, $24, $CA              ; ppu addr $24CA
    .db $ED, $EB, $DA, $E7, $EC    ; TRANS
    .db $E6, $E2, $EC, $EC, $E2    ; MISSI
    .db $E8, $E7                   ; ON
    .db $02, $60                   ; pause 60 frames
    .db $01, $25, $29              ; ppu addr $2529
    .db $DB, $E8, $EC, $EC, $FF    ; BOSS
    .db $E2, $E7, $DC, $E8, $E6    ; INCOM
    .db $E2, $E7, $E0, $F8         ; ING!
    .db $02, $60                   ; pause 60 frame
;   .db $00                        ; end of transmission
;   .db $03, $E4                   ; warp to screen $E4
    .db $03, $00                   ; warp to screen $00
    
+done: