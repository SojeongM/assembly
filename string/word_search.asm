TITLE TEST code : My Fisrt Assembly Code

INCLUDE irvine32.inc

.data
	string1 BYTE "Type_A_String: ", 0
	search BYTE "A_Word_for_Search: ", 0
	inputstr BYTE 100 DUP(0)
	output BYTE 100 DUP(0)
	com BYTE 100 DUP(0)
	found BYTE "Found", 0
	notfound BYTE "Not found", 0
	count DWORD ?
	count2 DWORD ?
	inputsize DWORD ?
	outputsize DWORD ?

.code
main PROC
	mov edx, OFFSET string1
	call WriteString

	call input


	mov edx, 0

	mov edx, OFFSET search
	call WriteString

	mov edx, OFFSET output
	mov ecx, SIZEOF output-1
	call ReadString
	mov outputsize, eax
	
	mov edi, OFFSET inputstr
	mov eax, OFFSET output
	repne scasb
	
	jz f

	mov edx, OFFSET notfound
	call WriteString

exit
main ENDP

input proc	
	mov edx, OFFSET inputstr
	mov ecx, SIZEOF inputstr-1
	call ReadString
	mov inputsize, eax
	ret
input endp

search_str proc
	sub edi, outputsize
	
	ret

search_str endp

f proc
	mov edx, OFFSET found
	call WriteString
	exit
f endp

END main