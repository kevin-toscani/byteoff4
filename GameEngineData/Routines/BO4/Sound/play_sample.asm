

;; Disable NMI
LDA #$00
STA $2000

;; Play sample
SwitchBank #$1D
    LDA $BFFE
    STA temp16
    LDA $BFFF
    STA temp16+1
    LDA #$00
    STA pointer5
    LDA #$80
    STA pointer5+1
    
    -loop:
        LDY #0              ; 002
        LDA (pointer5),y    ; 007
        STA $4011           ; 011
        LDA pointer5        ; 014
        CLC                 ; 016
        ADC #1              ; 018
        STA pointer5        ; 021
        LDA pointer5+1      ; 024
        ADC #0              ; 026
        STA pointer5+1      ; 029

        ;; 8bit: waste 171 cycles
        LDY #34             ; 031
        - DEY ; 5y-1   
        BNE -               ; 200

        LDA temp16          ; 202
        SEC                 ; 205
        SBC #1              ; 207
        STA temp16          ; 210
        LDA temp16+1        ; 213
        SBC #0              ; 215
        STA temp16+1        ; 218
        ORA temp16          ; 221
    BNE -loop               ; 224
ReturnBank

;; Enable NMI
LDA camScreen
AND #$01
ORA #$90
STA $2000

