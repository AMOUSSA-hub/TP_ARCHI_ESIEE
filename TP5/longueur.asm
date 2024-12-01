global longueur
longueur:
    push ebp              ; Sauvegarder le cadre de la pile
    mov ebp, esp          ; Mettre esp dans ebp (préparation pour accéder aux arguments)
    
    xor ecx, ecx          ; Initialiser ecx à 0 (compteur de la longueur)

    mov eax, [ebp+8]      ; Récupérer l'adresse de la chaîne (1er argument de la fonction)
    
    cmp byte [eax], 0     ; Vérifier si la chaîne commence par un caractère nul
    je fin                ; Si c'est le cas, la longueur est 0, on saute à la fin

compter:
    cmp byte [eax], 0     ; Vérifier si le caractère actuel est nul (fin de la chaîne)
    je fin                ; Si c'est nul, on termine la boucle
    inc eax               ; Avancer au caractère suivant
    inc ecx               
    jmp compter           

fin:
    mov eax, ecx          ; Copier la longueur dans eax pour le retour
    pop ebp               
    ret                  

