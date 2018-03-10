%include 'io.inc'

section .bss
  n resd 1


section .data
global CMAIN
CMAIN:
  GET_UDEC 4, [n]

  MOV ECX, DWORD[n]

  top:
    GET_DEC 4, EAX


  loop top

  MOV EAX, 0
  RET

