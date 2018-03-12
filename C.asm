%include 'io.inc'

section .bss
  a resd 10000
  b resd 10000
  c resd 10000
  n resd 1
  m resd 1
  k resd 1
  now resd 1


section .data
global CMAIN
CMAIN:
  GET_DEC 4, [m]
  GET_DEC 4, [n]
  GET_DEC 4, [k]

  MOV ECX, DWORD[n]
  IMUL ECX, DWORD[m]

  MOV EAX, 0

  l1:
    MOV EBX, EAX
    IMUL EBX, 4
    GET_DEC 4, [a + EBX]
    ADD EAX, 1
  loop l1

  MOV ECX, DWORD[n]
  IMUL ECX, DWORD[k]

  MOV EAX, 0

  l2:
    MOV EBX, EAX
    IMUL EBX, 4
    GET_DEC 4, [b + EBX]
    ADD EAX, 1
  loop l2

  MOV EAX, 0

  top1:
    MOV EBX, 0
    top2:
      MOV ESI, 0
      MOV ECX, 0
      top3:
        MOV EDI, EAX
        IMUL EDI, DWORD[n]
        ADD EDI, ECX
        IMUL EDI, 4
        MOV EDX, DWORD[a + EDI]

        MOV EDI, ECX
        IMUL EDI, DWORD[k]
        ADD EDI, EBX
        IMUL EDI, 4
        IMUL EDX, DWORD[b + EDI]

        ADD ESI, EDX

        ADD ECX, 1
        cmp ECX, DWORD[n]
      jnz top3
      MOV EDI, EAX
      IMUL EDI, DWORD[k]
      ADD EDI, EBX
      IMUL EDI, 4
      MOV DWORD[c + EDI], ESI
      
      PRINT_DEC 4, ESI
      PRINT_STRING " "
      ADD EBX, 1
      cmp EBX, DWORD[k]
    jnz top2
    NEWLINE
    ADD EAX, 1
    cmp EAX, DWORD[m]
  jnz top1

  MOV EAX, 0
  RET
