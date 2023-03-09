TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
	mul1 BYTE "Enter a Multiplier : ", 0
	mul2 BYTE "Enter a Multiplicand : ", 0
	pro BYTE "Product : ", 0
	bye BYTE "Bye!", 0
	x DWORD ?
	y DWORD ?
.code
main proc
	R1:
		mov edx, offset mul1
		call writestring
		call readhex
		jc eee
		mov x, eax
		mov edx, offset mul2
		call Writestring
		call readhex
		jc eee
		mov y, eax
		mov eax, y
		mov ebx, x
		call BitwiseMultiply
		mov edx, offset pro
		call Writestring
		call Writehex
		call crlf
		call crlf
		jmp R1
	eee:
		mov edx, offset bye
		call Writestring
	exit
main endp
	
BitwiseMultiply proc
	mov esi, 32
	mov ecx, 0
	L2:
		L1:		
			.if esi==0
				jmp endd
			.endif
			dec esi
			shr eax, 1
			jc ppp
			shl ebx, 1
			jmp L1
		ppp:	
			
			add ecx, ebx
			shl ebx, 1
			jmp L2
	endd:
	mov eax, ecx
	ret
BitwiseMultiply endp

end main


