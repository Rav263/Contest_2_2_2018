%include 'io.inc'

section .bss
  n resd 1
  k resd 1

section .text
global CMAIN:
CMAIN:
  GET_DEC 4, [n]
  GET_DEC 4, [k]

  MOV EAX, DWORD[n]
  MOV EBX, DWORD[k]
  MOV EDX, 0
  MOV ECX, 0
  MOV ESI, DWORD[n]

  top:
    INC ECX
    DIV ECX
    cmp ECX, EBX
    jz end
    MOV EDX, 0
    DEC ESI
    MUL ESI
    cmp ECX, EBX
  jnz top

  end:

  PRINT_DEC 4, EAX
  NEWLINE
  MOV EAX, 0
ret
