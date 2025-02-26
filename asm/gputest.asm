# gpu test assembly code
initPalette:
    li t0, 2048           # addr to palette base
    li t2, 1000000        # sleep length

    li t1, 0              # t1 = sleep index
sleep:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep

    li t3, 0xFFF
    sw t3, 0x00(t0)       # write white to palette index 0

    li t1, 0              # t1 = sleep index
sleep2:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep2

    li t3, 0x00F
    sw t3, 0x00(t0)       # write blue to palette index 0

    li t1, 0              # t1 = sleep index
sleep3:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep3

    li t3, 0x0F0
    sw t3, 0x00(t0)       # write green to palette index 0

    li t1, 0              # t1 = sleep index
sleep4:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep4

    li t3, 0xF00
    sw t3, 0x00(t0)       # write red to palette index 0
    
    j initPalette         # infinite loop
