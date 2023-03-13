section .data
    message db 'Hello, world!', 10 ; Define the message string with a newline character
    message_len equ $-message     ; Calculate the length of the message string

section .text
    global _start

_start:
    ; Write the message to stdout
    mov eax, 4      ; System call number for write()
    mov ebx, 1      ; File descriptor for stdout
    mov ecx, message    ; Pointer to the message string
    mov edx, message_len ; Length of the message string
    int 0x80        ; Call the kernel to write the message to stdout

    ; Exit the program
    mov eax, 1      ; System call number for exit()
    xor ebx, ebx    ; Return code 0
    int 0x80        ; Call the kernel to exit the program