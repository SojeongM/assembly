TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
INCLUDE hw1_2.inc

.code
main PROC
	mov eax, 0
	mov al, val1
	mov ebx, 30h
	sub eax, ebx

	mov ebx, eax
	add eax, eax	
	add eax, eax
	add eax, eax	;8
	sub eax, ebx	;7
	mov ebx, eax	;ebx=7
	add eax, eax	;14
	add eax, eax	;28
	add eax, eax	;56
	add eax, eax	;112
	mov ecx, eax	;acx=112
	add eax, eax	;224
	add eax, ebx
	add eax, ecx
	mov edx, eax

	mov eax, 0
	mov al, val1+1
	mov ebx, 30h
	sub eax, ebx
	mov ebx, eax
	add eax, eax	;2
	add eax, eax	;4
	add eax, eax	
	sub eax, ebx	;7
	mov ebx, eax
	add eax, eax	;14
	add eax, eax	;28
	add eax, ebx	;35
	add eax, ebx	;42
	add eax, ebx	;49
	add edx, eax

	mov eax, 0
	mov al, val1+2
	mov ebx, 30h
	sub eax, ebx

	mov ebx, eax
	add eax, eax	;2
	add eax, eax	;4
	add eax, eax	
	sub eax, ebx	;7
	add edx, eax

	mov eax, 0
	mov al, val1+3
	mov ebx, 30h
	sub eax, ebx
	add edx, eax
	mov eax, edx

	call DumpRegs

exit
main ENDP
END main

