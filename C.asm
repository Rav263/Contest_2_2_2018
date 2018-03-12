%include 'io.inc'

section .bss
  a resd 10000
  b resd 10000
  c resd 10000
  n resd 1
  m resd 1
  k resd 1

section .data
global CMAIN
CMAIN:
  GET_DEC 4, [n]
  GET_DEC 4, [m]
  GET_DEC 4, [k]

  MOV ECX, DWORD[n]
  IMUL ECX, DWORD[m]

  MOV EAX, 0

  l1:
    GET_DEC 4, [a + EAX]
    ADD EAX, 1
  loop l1

  MOV ECX, DWORD[m]
  IMUL ECX, DWORD[k]

  MOV EAX, 0

  l2:
    GET_DEC 4, [b + EAX]
    ADD EAX, 1
  loop l2




  MOV EAX, 0
  RET
