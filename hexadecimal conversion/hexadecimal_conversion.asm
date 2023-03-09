TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
	num DWORD 0
	input BYTE 32 DUP(0)
	key BYTE 32 DUP(0)

	INCLUDE hw3.inc

	CODE_A	BYTE	'1'
	CODE_B	BYTE	'01'
	CODE_C	BYTE	'000'
	CODE_D	BYTE	'0011'
	CODE_E	BYTE	'0010'



.code
main PROC
	mov eax, CODE01
	call writebin
	mov num, eax
	call hex_bin
	call check
	
	mov eax, CODE02
	mov num, eax
	call hex_bin
	call check

	mov eax, CODE03
	mov num, eax
	call hex_bin
	call check

	mov eax, CODE04
	mov num, eax
	call hex_bin
	call check
	
	mov eax, CODE05
	mov num, eax
	call hex_bin
	call check

exit
main ENDP

hex_bin proc
	mov esi, 8
	mov ecx, lengthof input
	mov edi, 32
	L1:
		dec edi
		shr num, 1
		jc kkk
		jmp BBB
	kkk:
		mov input[edi], '1'
		jmp EEE
	BBB:
		mov input[edi], '0'
	EEE:

		loop L1
	ret
hex_bin endp

check proc
	mov esi, 0
	mov edi, 0
	mov edx, 0
	mov key, '$'
	L2:
		.if input[esi]=='1'
			mov key[edi], 'A'
			inc edi
		.else
			inc esi
			.if input[esi]=='1'
				mov key[edi], 'B'
				inc edi
			.else
				inc esi
				.if input[esi]=='0'
					mov key[edi], 'C'
					inc edi
				.else
					inc esi
					.if input[esi]=='1'	
						mov key[edi], 'D'
						inc edi
					.else
						mov key[edi], 'E'
						inc edi
					.endif
				.endif
			.endif
		.endif


		inc esi
		.if esi>31
			jmp ENE
		.endif
	loop L2
	ENE:
		
	L3:
	;	inc edi
		mov key[edi], 0
		inc edi
		.if edi>31
			jmp Fend
		.endif
	loop L3
	Fend:
	mov edx, offset key
	mov ecx, lengthof key
	call writestring
	call crlf
	ret
check endp

END main