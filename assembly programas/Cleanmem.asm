    processor 6502 ;this first line of code tells the assembler what is 
                  ;the processor will be the target of this assembly code

    seg code            ;segment of code
    org $F000           ;Define the code origem at $F000
Start:
    sei                 ; Disable interrupts
    cld                 ; Disable the BCD decimal math mode
    ldx #$FF            ; Loads the X register With #$FF
    txs                 ; Transfer the X register to the (S)tack pointer 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to @FF)
; Meaning the entire RAM and also the entire TIA registers  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0              ; A = 0
    ldx #$FF            ; X = $FF
MemLoop:
    sta $0,X            ; STore the value of A inside memory address $0 + X
    dex                 ; X--
    bne MemLoop         ; Loop until X is equal to zero (z-flag is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the rom size to exactly 4KB 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC
    .word Start         ; Reset vector at $FFFC (where the program starts)
    .word Start         ; Interrupt vector at $FFFE (unused in the VCS)