a.out: function.s main.s
	gcc function.s main.s

function.s: function.c
	gcc -S -masm=intel function.c

main.s: main.c
	gcc -S -masm=intel main.c
