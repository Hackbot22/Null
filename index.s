PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E = $80
RW = $40
RS = $20

.org $8000

charmaker:
    sta PORTB
    lda #RS
    sta PORTA
    lda #(RS | E)
    sta PORTA
    lda #RS
    sta PORTA


reset:
    lda #$ff
    sta DDRB
    lda #$E0
    sta DDRA
    lda #$38
    sta PORTB
    lda #0
    sta PORTA
    lda #E
    sta PORTA
    lda #0
    sta PORTA
    lda #$E
    sta PORTB
    lda #0
    sta PORTA
    lda #E
    sta PORTA
    lda #0
    sta PORTA
    lda #$6
    sta PORTB
    lda #0
    sta PORTA
    lda #E
    sta PORTA
    lda #0
    sta PORTA
    jmp output

output:
    lda #$50
    jmp charmaker
    lda #$4F
    jmp charmaker
    lda #$4C
    jmp charmaker
    lda #$49
    jmp charmaker
    lda #$43
    jmp charmaker
    lda #$45
    jmp charmaker
    lda #$43
    jmp charmaker
    lda #$48
    jmp charmaker
    lda #$49
    jmp charmaker
    lda #$4C
    jmp charmaker
    lda #$44
    jmp charmaker

loop:
    jmp loop
    .org $fffc
    .word reset
    .word $0000
