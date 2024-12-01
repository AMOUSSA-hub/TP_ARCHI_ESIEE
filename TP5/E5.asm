
; Auteurs : ---
; Date de creation : ---
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
string: db "ba ", 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; Section de reservation ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global main
main:
    mov eax, string  ; Charger la chaine de caractères
    push eax
    

    call longueur
    call print_int
   call print_nl
    add esp, 8           ; Nettoyer la pile (2 * 4 octets)
    

   
    ; Fin de l'exécution
    mov ebx, 0
    mov eax, 1
    int 0x80

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
    inc ecx               ; Incrémenter le compteur de longueur
    jmp compter           ; Répéter la vérification

fin:
    mov eax, ecx          ; Copier la longueur dans eax pour le retour

    pop ebp               ; Restauration du cadre de la pile
    ret                   ; Retour de la fonction




