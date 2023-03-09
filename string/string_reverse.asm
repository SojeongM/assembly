TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
	source BYTE "Type_A_String_To_Reverse: ", 0
	reverse BYTE "Reversed_String: "
	target BYTE 100 DUP(0)
	count DWORD ?
	string BYTE 10, 0
	bye BYTE "Bye!", 0

.code
main PROC


L3:
	mov edx, OFFSET source
	call WriteString

	mov edx, OFFSET target
	mov ecx, SIZEOF target-1
	call ReadString

	

	mov count, eax
	mov ecx, count
	mov esi, 0

	.if target[esi]==00
	jmp eee
	.endif

	
	L1:	
		call loop1
		push eax
		inc esi
	loop L1
	
	.if esi>40
		jmp kkk
	.endif

	mov ecx, count
	mov esi, 0
	
	L2:
		pop eax
		mov target[esi], al
		inc esi

	loop L2
	mov edx, OFFSET reverse
	call WriteString	
	
	mov edx, OFFSET string
	call WriteString

	kkk:
	
loop L3
	
	eee:
	mov edx, OFFSET bye
	call WriteString
	

exit
main ENDP

len proc

loop4:
;	mov eax, 0
;	mov esi, 0
;	mov al, target[esi]
;	cmp al, 0x00
;	je e
;	inc eax
	inc esi
;	jmp loop4
;
;	 e:
len endp

loop1 proc
	.if target[esi]>=97 && target[esi]<=122
		sub target[esi], 32
		movzx eax, target[esi]
		jmp next

		.elseif target[esi]>=65 && target[esi]<=90
		add target[esi], 32
		movzx eax, target[esi]
		jmp next
		
		.else
		movzx eax, target[esi]
		jmp next

		.endif

		next:

		ret
loop1 endp

END main
