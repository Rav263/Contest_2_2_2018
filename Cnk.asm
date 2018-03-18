%include 'io.inc'

section .bss
  n resd 1
  k resd 1
  res resd 1
  b resb 1


section .text
global CMAIN:
CMAIN:
  GET_UDEC 4, [n]
  GET_UDEC 4, [k]
  MOV EAX, DWORD[n]

  cmp EAX, DWORD[k]
  jle endall
  ;cmp EAX, 0
  ;jl endall
  ;cmp DWORD[k], 0
  ;jl endall



  MOV DWORD[res], 0
  MOV EDI, 32

  top1:
    DEC EDI
    cmp EDI, -1
    jz endall
    BT DWORD[n], EDI 
  jnc top1
  end1:

  INC EDI
  ;PRINT_DEC 4, EDI
  ;PRINT_STRING " "
  ;PRINT_DEC 4, [k]
  ;NEWLINE


  MOV EAX, EDI
  MOV EBX, DWORD[k]
  INC EBX
  
  MOV EDX, 0
  MOV ECX, 0
  MOV ESI, EAX

  topc:
    INC ECX
    DIV ECX
    cmp ECX, EBX
    jz endc1
    MOV EDX, 0
    DEC ESI
    MUL ESI
    cmp ECX, EBX
  jnz topc
  endc1:

  MOV DWORD[res], EAX
  DEC EDI
  
  ;PRINT_DEC 4, EAX
  ;NEWLINE


  top2:
    BT DWORD[n], EDI
    jnc cont
      cmp EDI, -1
      jz endall
      DEC EDI
      jmp top2
    cont:

    MOV EAX, EDI
    ;DEC EAX
    MOV EBX, DWORD[k]
    ;PRINT_DEC 4, EAX
    ;PRINT_STRING " "
    ;PRINT_DEC 4, EBX
    ;NEWLINE
    jmp cnk
    endcnk:
    SUB DWORD[res], EAX
    cmp DWORD[k], 0
    jz endall
    DEC DWORD[k]
    DEC EDI
    cmp EDI, -1
    jnz top2
    jz endall
  cnk:
  cmp EAX, 0
  jge stq
  MOV EAX, 0
  jmp endcnk

  stq:
  
  CMP EBX, 0
  jnz start
  MOV EAX, 1
  jmp endcnk

  start:

  MOV EDX, 0
  MOV ECX, 0
  MOV ESI, EAX

  top:
    INC ECX
    DIV ECX
    cmp ECX, EBX
    jz endc
    MOV EDX, 0
    DEC ESI
    MUL ESI
    cmp ECX, EBX
  jnz top
  endc:
  jmp endcnk

  endall:
  PRINT_UDEC 4, [res]
  NEWLINE
  MOV EAX, 0
ret
