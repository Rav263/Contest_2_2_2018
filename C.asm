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

  l1:
    l2:
      

  MOV EAX, 0
  RET
