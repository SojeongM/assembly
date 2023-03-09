TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
INCLUDE hw1_1.inc

.code
main PROC
	mov eax, val1
	add eax, eax
	add eax, eax
	mov ebx, eax
	add eax, eax
	add eax, ebx
	mov eval1, eax

	mov eax, val2
	add eax, eax
	add eax, eax	;4
	add eax, eax	;8
	add eax, eax	;16
	mov ebx, eax
	add eax, eax	;32
	add eax, ebx
	mov ebx, val2
	add eax, ebx
	add eax, ebx
	add eax, ebx	
	add eval1, eax
	
	mov eax, val4
	mov ebx, val3
	sub eax, ebx
	mov ebx, eax
	add eax, eax
	add eax, eax
	add eax, ebx
	sub eval1, eax
	mov eax, eval1
	call DumpRegs

	mov eax, val1
	add eax, eax	;2
	mov ebx, eax
	add eax, eax	;4
	add ebx, eax	;6
	add eax, eax	;8
	add eax, ebx	;14

	mov eval2, eax
	mov eax, val2
	add eax, eax	;2
	add eax, eax	;4
	mov ebx, eax
	add eax, eax	;8
	add eax, ebx	;12
	mov ebx, val2
	add eax, ebx
	
	add eval2, eax

	mov eax, val3
	mov ebx, val4
	sub eax, ebx
	mov ebx, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	sub eax, ebx
	
	sub eval2, eax
	mov eax, eval2
	call DumpRegs

	mov eax, val1
	mov ebx, val2
	add eax, ebx
	mov ebx, val3
	add eax, ebx
	mov ebx, eax
	add eax, eax
	add eax, ebx
	
	mov eval3, eax

	mov eax, val1
	add eax, eax
	add eax, eax
	mov ebx, eax
	add eax, eax
	add eax, eax
	add eax, ebx

	sub eval3, eax

	mov eax, val4
	mov ebx, eax
	add eax, eax
	add eax, ebx

	mov ebx, val2
	add eax, ebx

	sub eval3, eax
	mov eax, eval3
	
	call DumpRegs
exit
main ENDP
END main