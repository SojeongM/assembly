TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
CaseTable BYTE '1'
	DWORD process_1
EntrySize = ($-CaseTable)
	BYTE '2'
	DWORD process_2
	BYTE '3'
	DWORD process_3
	BYTE '4'
	DWORD process_4
	BYTE '5'
	DWORD process_5
NumberOfEntries = ($-CaseTable)/EntrySize
Prompt_1 BYTE "1. x AND y", 0
Prompt_2 BYTE "2. x OR y", 0
Prompt_3 BYTE "3. NOT x", 0
Prompt_4 BYTE "4. x XOR y", 0
Prompt_5 BYTE "5. Exit program", 0
prompt BYTE "Choose Calculation Mode : ", 0
mode BYTE "Do you want to change the mode(Y/N)? : ", 0
enter_x BYTE "Enter x: ", 0
enter_y BYTE "Enter y: ", 0
result_1 BYTE "Result of x AND y : ", 0
result_2 BYTE "Result of x OR y : ", 0
result_3 BYTE "Result of NOT x : ", 0
result_4 BYTE "Result of x XOR y : ", 0
xx BYTE 10 DUP(0)
yy BYTE 10 DUP(0)
xxsize DWORD ?
yysize DWORD ?
x_v DWORD ?
y_v DWORD ?
save DWORD ?
save_2 DWORD ?
bye BYTE "Bye!", 0

.code
main proc
	L1:	
		mov eax, 0
		call choose
		kk:
			mov edx, OFFSET prompt
			call Writestring
			call ReadChar
			call WriteChar
			call crlf
			mov save, eax
			mov ebx, OFFSET CaseTable
			mov ecx, NumberofEntries
			mov save_2, ebx
			ppp:
				cmp al, [ebx]
				jne L2
				call NEAR PTR [ebx+1]
				jmp L6
				L2:
					add ebx, Entrysize
					cmp al, [ebx]
					jne L3
					call NEAR PTR [ebx+1]
				
					jmp L6
					L3:
						add ebx, Entrysize
						cmp al, [ebx]
						jne L4
						call NEAR PTR [ebx+1]
					
						jmp L6
						L4:
							add ebx, Entrysize
							cmp al, [ebx]
							jne L5
							call NEAR PTR [ebx+1]
							
							jmp L6
							L5:			
								add ebx, Entrysize
								cmp al, [ebx]
								jne L7
								call NEAR PTR [ebx+1]
								
								jmp L9
								L7: 
									jmp kk
		loop ppp
		
			L6:
				
				mov edx, offset mode
				call writestring
				call Readchar
				call WriteChar
				call crlf
				call crlf
				.if al=='N'
					mov eax, save
					mov ebx, save_2
					jmp ppp
				.else
					jmp L1
				.endif
	L9:

	exit
main endp

choose proc
	mov edx, OFFSET Prompt_1
	call Writestring
	call crlf
	mov edx, OFFSET Prompt_2
	call Writestring
	call crlf
	mov edx, OFFSET Prompt_3
	call Writestring
	call crlf
	mov edx, OFFSET Prompt_4
	call Writestring
	call crlf
	mov edx, OFFSET Prompt_5
	call Writestring
	call crlf
	call crlf
	
	ret
choose endp

process_1 proc
	

	call crlf
	mov edx, offset enter_x
	call WriteString
	mov xxsize, eax
	call Readhex
	mov x_v, eax
	mov edx, offset enter_y
	call WriteString
	call Readhex
	mov y_v, eax
	mov eax, x_v
	mov ebx, y_v
	and eax, ebx
	mov edx, offset result_1
	call WriteString
	call Writehex
	call crlf
	call crlf
	ret
process_1 endp

process_2 proc
	mov edi, ebx
	call crlf
	mov edx, offset enter_x
	call WriteString
	mov edx, offset xx
	mov ecx, sizeof xx-1
	call readhex
	mov x_v, eax
	mov edx, offset enter_y
	call WriteString
	call readhex
	mov eax, y_v
	mov eax, x_v
	mov ebx, y_v
	or eax, ebx
	mov edx, offset result_2
	call WriteString
	call Writehex
	call crlf
	call crlf
	ret
process_2 endp

process_3 proc
	mov edi, ebx
	call crlf
	mov eax, 0
	mov edx, offset enter_x
	call WriteString
	call readhex
	mov eax, x_v
	not eax
	mov edx, offset result_3
	call WriteString
	call Writehex
	call crlf
	call crlf
	ret
process_3 endp
	
process_4 proc
	mov edi, ebx
	call crlf
	mov edx, offset enter_x
	call WriteString
	call Readhex
	mov x_v, eax
	mov edx, offset enter_y
	call WriteString
	call Readhex
	mov y_v, eax
	mov eax, x_v
	mov ebx, y_v
	xor eax, ebx
	mov edx, offset result_4
	call WriteString
	call Writehex
	call crlf
	call crlf
	ret
process_4 endp

process_5 proc
	call crlf
	mov edx, offset bye
	call writestring
	ret
process_5 endp



end main