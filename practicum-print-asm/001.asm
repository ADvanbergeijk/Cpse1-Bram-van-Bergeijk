	.global print_asciz
	.global application
	.align 2
string:
	.asciz	"@A`aHello World![]\nhi"
	

print_asciz:
	push	{ r5, lr}
	mov		r5, r0
loop:
	ldrb 	r0, [r5]
	add 	r0, r0, #0
	beq 	done
	bl		toggle
	bl 		uart_put_char
	add 	r5, r5, #1
	b 		loop
done:
	pop		{r5, pc}
	
application:
	push	{lr}
	ldr r0 ,=string
	bl	print_asciz
	pop 	{pc}

toggle:
	push	{lr}
	cmp		r0 , #'A'
	blt		final
	cmp 	r0 , #'z'
	bgt 	final
	cmp		r0 , #'Z'
	ble 	upper
	cmp		r0, #'a'
	bge		lower
	b		final
upper:
	add 	r0, r0, #' '
	pop		{pc}
lower: 
	sub		r0, r0, #' '
	pop		{pc}
final:
	pop 	{pc}
	