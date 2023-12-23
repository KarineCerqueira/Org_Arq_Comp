; Programa Simples em Linguagem Assembly

; ------- TABELA DE CORES -------
; Cada número representa uma cor que pode ser usada na exibição do texto.
; Adicione o número da cor ao caracter para escolher a cor correspondente.

; 0 branco
; 1 marrom
; 2 verde
; 3 oliva
; 4 azul marinho
; 5 roxo
; 6 teal
; 7 prata
; 8 cinza
; 9 vermelho
; 10 lima
; 11 amarelo
; 12 azul

; Pulo para a função principal
jmp main

; Variável para armazenar as cores disponíveis
cores: var #13

; Inicialização da tabela de cores
static cores + #0, #0
static cores + #1, #256
static cores + #2, #512
static cores + #3, #768
static cores + #4, #1024
static cores + #5, #1280
static cores + #6, #1536
static cores + #7, #1792
static cores + #8, #2048
static cores + #9, #2304
static cores + #10, #2560
static cores + #11, #2816
static cores + #12, #3072

; Mensagem a ser exibida
mensagem: string "Xupa Federal!"

;---- Início do Programa Principal -----

main:
    ; Inicialização de registradores
    loadn r0, #0        ; Posição na tela onde a mensagem será escrita
    loadn r1, #mensagem ; Endereço da mensagem
    loadn r2, #cores    ; Escolha da cor da mensagem

    ; Chama a sub-rotina para imprimir a mensagem
    call ImprimeStr

    ; Encerra o programa
    halt

;---- Fim do Programa Principal -----

;---- Início das Sub-rotinas -----

; Sub-rotina para imprimir mensagens
ImprimeStr:
    ; Protege registradores na pilha
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5

    ; Critério de parada
    loadn r3, #'\0'

ImprimeStrLoop:
    ; Carrega caracteres e cores
    loadi r4, r1
    loadi r5, r2

    ; Compara com o critério de parada
    cmp r4, r3
    jeq ImprimeStrSai

    ; Combinação de cor e caracter, e exibe na tela
    add r4, r5, r4
    outchar r4, r0

    ; Atualiza os registradores
    inc r0
    inc r1
    inc r2

    ; Repete o loop
    jmp ImprimeStrLoop

ImprimeStrSai:
    ; Resgata valores da pilha
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0

    ; Retorna da sub-rotina
    rts

;---- Fim das Sub-rotinas -----
