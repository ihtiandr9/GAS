.text

.global main

main:
	sub	$8, %rsp          # Allocate 8 bytes for local variable (fact result)
	push	%rbp            # Save rbp (not used as frame pointer)
	push	%rdi            # Save rdi (main argument, unused here)
        mov	$message, %rdi   # Address of "Hello, world\n" string -> first arg of print_str
        call    print_str        # Print greeting
        mov	$4, %rdi         # Argument for fact: compute 4!
        call	fact             # Call factorial, result in rax
        mov	%rax, 16(%rsp)   # Save fact result at rsp+16 (past 2 pushes * 8 bytes)
        mov	$fmt_fact, %rdi  # Format string "factorial is %d\n" -> first arg of printf
        mov	16(%rsp), %rsi   # Saved result -> second arg of printf
        xor	%rax, %rax       # printf is variadic, rax=0 (no float args)
        call	printf           # Print factorial result
	# return 0;
        xor	%rax, %rax       # main returns 0
	pop	%rdi             # Restore rdi
	pop	%rbp             # Restore rbp
	add	$8, %rsp         # Free allocated 8 bytes
	ret                     # Return to libc

print_str:                  # Custom print function using write(1, str, 13)
        # write(1, message, 13)
        sub	 $8, %rsp         # Allocate 8 bytes
        push	%rbp
        push	%rdi             # Save string address
        mov	%rdi, 16(%rsp)   # Duplicate address to allocated space
        mov	16(%rsp),%rax    # Load string address into rax
        mov     $1, %rdi        # file handle 1 is stdout
        mov     %rax, %rsi      # String address -> second arg of write
        mov     $13, %rdx       # String length (13 bytes)
        xor	%rax,	%rax      # Clear rax (for function call)
        call    write           # invoke operating system to do the write
	#return 0;
        xor	%rax,	%rax      # Return 0
	pop	%rdi
	pop	%rbp
	add	$8, %rsp
        ret

fact:                       # Factorial computation: n! = n * (n-1) * ... * 1
        # write(1, message, 13)
        sub	$8, %rsp         # Allocate 8 bytes for n
	push	%rbp
        mov	%rdi, 8(%rsp)    # Save argument n (from rdi) at rsp+8
        mov	8(%rsp), %rax    # n -> rax (working register for result)
        cmp	$0, %rax         # If n == 0
        jz	ret1              # Jump to return 1 (0! = 1)
        jb	err_arg           # If n < 0 (invalid argument)
        mov	%rax,%rcx       # Copy n to rcx (loop counter)
cycle1:
        dec	%rcx             # Decrement counter (next multiplier)
        jz	end_counter      # If rcx == 0, loop done
        mull	%ecx            # rax = rax * ecx (32-bit multiply: eax * ecx)
        jmp	cycle1           # Continue loop
end_counter:
        jmp	endif
ret1:
	mov $1, %rax         # 0! = 1
	jmp endif
err_arg:
	mov $0, %rax         # Error: invalid argument
endif:
        pop %rbp
	add $8, %rsp
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
