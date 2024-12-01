global difference
difference:
    push ebp
    mov ebp, esp

   

    mov eax, [ebp+8]      ; Récupérer le premier argument
    mov ebx, [ebp+12]     ; Récupérer le second argument

    sub eax, ebx          ; Faire la différence

    pop ebp
    ret