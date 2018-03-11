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
  GET_DEC 4, EAX
  DEC ECX

  CMP EBX, EAX
  jge s
    MOV EDX, EBX
    MOV EBX, EAX
    jmp g
  s:
    MOV EDX, EAX
  g:

  GET_DEC 4, EAX
  DEC ECX
  
  CMP EBX, EAX
  jge d
    MOV ESI, EDX
    MOV EDX, EBX
    MOV EBX, EAX
    jmp e
  d:
    CMP EDX, EAX
    jge f
      MOV ESI, EDX
      MOV EDX, EAX
    jmp e
  f:
    MOV ESI, EAX
  e:

  cmp ECX, 0
  jz en

  top:
    GET_DEC 4, EAX

    CMP EBX, EAX
    jge a 
      MOV ESI, EDX
      MOV EDX, EBX
      MOV EBX, EAX
    jmp c
    a:
      cmp EDX, EAX
      jge b
        MOV ESI, EDX
        MOV EDX, EAX
      jmp c
    b:
      cmp ESI, EAX
      jge c
        MOV ESI, EAX
    c:
  loop top
  en:

  PRINT_DEC 4, EBX
  NEWLINE

  PRINT_DEC 4, EDX
  NEWLINE
  
  PRINT_DEC 4, ESI
  NEWLINE


  MOV EAX, 0
  RET

