# gpu test assembly code
main:

init_palette:
    li t0, 2048           # addr to palette base
    li t1, 0              # t1 = palette index
    li t4, 256            # t4 = # of colors
write_palette_loop:
    add t2, t0, t1        # t2 = palette addr
    mv t3, t1             # t3 = palette value = index
    sw t3, 0x00(t2)       # write to palette
    addi t1, t1, 1        # palette index++
    blt t1, t4, write_palette_loop

init_framebuffer:
    li t0, 131072         # addr to framebuffer base
    li t1, 0              # t1 = pixel index
    li t4, 120000         # t4 = # of pixels
write_framebuffer_loop:
    add t2, t0, t1        # t2 = pixel addr
    mv t3, t1             # t3 = pixel value = index
    sw t3, 0x00(t2)       # write to framebuffer
    addi t1, t1, 1        # pixel index++
    blt t1, t4, write_framebuffer_loop

sleep:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep_loop:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep_loop

clear_palette:
    li t0, 2048           # addr to palette base
    li t1, 0              # t1 = palette index
    li t4, 256            # t4 = # of colors
clear_palette_loop:
    add t2, t0, t1        # t2 = palette addr
    li t3, 0xFFF          # t3 = palette value = WHITE
    sw t3, 0x00(t2)       # write to palette
    addi t1, t1, 1        # palette index++
    blt t1, t4, clear_palette_loop

sleep2:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep2_loop:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep2_loop

done:
    j main                # restart program
