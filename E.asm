%include 'io.inc'

section .bss
  n resd 1
  k resd 1
  cnk resd 1024


section .text
global CMAIN



CMAIN:
  GET_DEC 4, [n]
  GET_DEC 4, [k]

  MOV ECX, 32
  a:
    MOV DWORD[cnk + ECX * 4], 1
    
    MOV EAX, ECX
    IMUL EAX, 32
  
    MOV DWORD[cnk + 4 * EAX], 1
  loop a

  MOV EAX, 1
  top1:
    MOV EBX, 1
    top2:
      MOV ECX, EAX
      DEC ECX
      IMUL ECX, 32
      IMUL ECX, 4

      MOV EDX, DWORD[cnk + ECX + EBX*4]

      MOV ECX, EAX
      IMUL ECX, 32
      IMUL ECX, 4
     
      DEC EBX
      ADD EDX, DWORD[cnk + ECX + EBX*4]
      INC EBX

      MOV DWORD[cnk +ECX +EBX*4], EDX
      
      INC EBX
      cmp EBX, 32
    jnz top2
    INC EAX
    cmp EAX, 32
  jnz top1


  


  MOV EAX, 0
  RET
