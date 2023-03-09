TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
	source1 BYTE "Enter a plain text: ", 0
	source2 BYTE "Enter a key: ", 0
	source3 BYTE "Original Text: ", 0
	source4 BYTE "Encrypted Text: ", 0
	source5 BYTE "Decrypted Text: ", 0
	bye BYTE "Bye!", 0
	plain BYTE 40 DUP(0)
	key BYTE 10 DUP(0)
	inputsize DWORD ?
	keysize DWORD ?

.code
main PROC
	L1:
		pushad
		mov edx, OFFSET source1
		call WriteString
		mov edx, OFFSET plain
		mov ecx, SIZEOF plain-1
		call ReadString
		mov esi, 0
		.if plain[esi]==00
			jmp eee
		.endif
		mov inputsize, eax
		popad
		mov edx, OFFSET source2
		call WriteString
		mov edx, OFFSET key
		mov ecx, SIZEOF key-1
		call ReadString
		mov keysize, eax
		mov esi, 0
		.if key[esi]==00
			jmp eee
		.endif
		mov ecx, inputsize
		mov edi, 0
		mov esi, 0
		mov ebx, keysize
		call crlf
		mov edx, OFFSET source3
		call WriteString
		mov edx, OFFSET plain
		call WriteString
		call encry
		mov edx, OFFSET source4
		call WriteString
		mov edx, OFFSET plain
		call WriteString
		call decry
		mov edx, OFFSET source5
		call WriteString
		mov edx, OFFSET plain
		call WriteString
		call crlf
		call crlf
		jmp L1
		
		eee:
			mov edx, OFFSET bye
			call WriteString

	exit

main endp

encry proc
		pushad
	mov ecx, inputsize
	mov esi, 0
	mov edi, 0
	L1:
		mov ecx, 0
		.if key[edi]=='-'
			inc edi
			mov cl, key[edi]
			sub cl, '0'
			mov al, plain[esi]
			rol plain[esi], cl
		.else
			mov cl, key[edi]
			mov al, plain[esi]
			rol plain[esi], cl	
		.endif		
		inc edi
		inc edi
		inc esi	
		cmp inputsize, esi
		jb endddd
		cmp keysize, edi
		jb kkk
		jmp L1
	kkk:
		mov edi, 0
		jmp L1
	endddd:
	call crlf
	popad
	ret
encry endp

decry proc
	pushad
	mov ecx, inputsize
	mov esi, 0
	mov edi, 0
	L1:
		mov ecx, 0
		.if key[edi]=='-'
			inc edi
			mov cl, key[edi]
			sub cl, '0'
			mov al, 8
			sub al, cl
			mov cl, al
			mov al, plain[esi]
			rol plain[esi], cl
		.else
			mov cl, key[edi]
			sub cl, '0'
			mov al, 8
			sub al, cl
			mov cl, al
			mov al, plain[esi]
			rol plain[esi], cl	
		.endif		
		inc edi
		inc edi
		inc esi
		cmp inputsize, esi
		jb endddd
		cmp keysize, edi
		jb kkk
		jmp L1

	kkk:
		mov edi, 0
		jmp L1
	endddd:
	call crlf
	popad
	ret
decry endp

end main