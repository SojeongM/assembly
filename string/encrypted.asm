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

;	L3:
p:
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
	call encryp
	mov edx, OFFSET source4
	call WriteString
	mov edx, OFFSET plain
	call WriteString
	call encryp
	mov edx, OFFSET source5
	call WriteString
	mov edx, OFFSET plain
	call WriteString
	call crlf
	call crlf
	jmp p

;loop L3:

	eee:
		mov edx, OFFSET bye
		call WriteString
	


exit
main ENDP

encryp proc
	pushad
	mov ecx, inputsize
	mov esi, 0
	mov eax, 0
	L1:
		mov al, key[eax]
		xor plain[esi], al
		inc esi
		inc eax
		cmp keysize, eax
		jb kkk

	loop L1

	kkk:
		mov eax, 0
		loop L1

	call crlf
	popad
	ret

encryp endp

END main