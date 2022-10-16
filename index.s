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
    lda #"P"
    jmp charmaker
    lda #"O"
    jmp charmaker
    lda #"L"
    jmp charmaker
    lda #"I"
    jmp charmaker
    lda #"C"
    jmp charmaker
    lda #"E"
    jmp charmaker
    lda #"C"
    jmp charmaker
    lda #"H"
    jmp charmaker
    lda #"I"
    jmp charmaker
    lda #"L"
    jmp charmaker
    lda #"D"
    jmp charmaker

loop:
    jmp loop
    .org $fffc
    .word reset
    .word $0000
