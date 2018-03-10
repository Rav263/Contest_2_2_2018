%include 'io.inc'

section .bss
  n resd 1


section .data
global CMAIN
CMAIN:
  GET_UDEC 4, [n]

  MOV ECX, DWORD[n]

  GET_DEC 4, EBX
  DEC ECX
  GET_DEC 4, EDX
  DEC ECX
  ;GET_DEC 4, ESI
  ;DEC_ECX


  top:
    GET_DEC 4, EAX

    CMP EBX, EAX
    jge a 
      MOV EDX, EBX
      MOV EBX, EAX
    jmp b
    a:
      cmp EDX, EAX
      jge b
        MOV EDX, EAX
    b:
  loop top

  PRINT_DEC 4, EBX
  NEWLINE

  PRINT_DEC 4, EDX
  NEWLINE

  MOV EAX, 0
  RET

