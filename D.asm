%include 'io.inc'

section .data
global CMAIN
CMAIN:
  GET_DEC 4, ESI
  GET_DEC 4, EDI

  top:
    cmp ESI, EDI
    jle a
      MOV EDX, 0
      MOV EAX, ESI
      MOV EBX, EDI
      DIV EBX
      MOV ESI, EDX
      jmp b
    a:
      MOV EDX, 0
      MOV EAX, EDI
      MOV EBX, ESI
      DIV EBX
      MOV EDI, EDX
    b:

    cmp ESI, 0
  jz en
    cmp EDI, 0
  jz en
  jmp top
  en:

  ADD ESI, EDI

  PRINT_DEC 4, ESI
  NEWLINE

  MOV EAX, 0
  RET
