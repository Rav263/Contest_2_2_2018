%include 'io.inc'

section .bss
  num resb 11


section .data
global CMAIN
CMAIN:
  GET_UDEC 4, EAX

  MOV EBX, 0
  MOV ESI, 10


  top:
    MOV EDX, 0
    
    MOV ECX, EAX
    AND ECX, 1
    ADD EDX, ECX

    MOV ECX, EAX
    AND ECX, 2
    ADD EDX, ECX

    MOV ECX, EAX
    AND ECX, 4
    ADD EDX, ECX
   
    MOV BYTE[num + ESI], DL
    DEC ESI 

    SHR EAX, 3
    cmp EAX, 0
  jnz top

  ADD ESI, 1

  sec_top:
    PRINT_UDEC 1, [num + ESI]
    ADD ESI, 1

    cmp ESI, 11
  jnz sec_top

  NEWLINE

  MOV EAX, 0
  RET
