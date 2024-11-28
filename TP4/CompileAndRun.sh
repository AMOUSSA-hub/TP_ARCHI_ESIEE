#!/bin/sh

if [ $# -eq 1 ]
then
nasm -f elf32 $1.asm
ld -o $1 -melf_i386 -e main $1.o asm_io.o
chmod +x $1
./$1

else
echo "Erreur: pas de fichier en argument"
fi
