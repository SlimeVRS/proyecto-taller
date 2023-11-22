.data
arr:    .word 79, 79, 79, 88, 88, 88, 90, 90, 90

    .text
    .global main
main:
    ldr r0, =arr
    ldr r1, =9
    ldr r2, =0
    ldr r3, =0

calculate_median:
    ldr r4, [r0, r2, LSL #2]
    add r3, r3, r4
    add r2, r2, #1
    cmp r2, r1
    bne calculate_median

    b division

	bx lr
	
division:
	CMP r3, r1
	BLT done
	
	SUB r3, r3, r1
	ADD r5, r5, #1
	B division
	
done:
	@ la mediana esta en r3
	BX lr