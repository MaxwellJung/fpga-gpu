# gpu test assembly code
main:

reset_palette:
    li t0, 2048           # addr to palette base
    li t1, 0              # t1 = palette index
    li t4, 256            # t4 = # of colors
write_palette_loop:
    add t2, t0, t1        # t2 = palette addr
    mv t3, t1             # t3 = palette value = index
    sw t3, 0x00(t2)       # write to palette
    addi t1, t1, 1        # palette index++
    blt t1, t4, write_palette_loop

reset_framebuffer:
    li t0, 131072         # addr to framebuffer base
    li t1, 0              # t1 = pixel index
    li t4, 120000         # t4 = # of pixels
write_framebuffer_loop:
    add t2, t0, t1        # t2 = pixel addr
    li t3, 0              # t3 = pixel value = 0
    sw t3, 0x00(t2)       # write to framebuffer
    addi t1, t1, 1        # pixel index++
    blt t1, t4, write_framebuffer_loop

change_palette:
    li t0, 2048           # addr to palette base
sleep1:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep_loop1:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep_loop1
paint_white:
    li t3, 0xFFF
    sw t3, 0x00(t0)       # write to palette

sleep2:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep_loop2:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep_loop2
paint_blue:
    li t3, 0x00F
    sw t3, 0x00(t0)       # write to palette

sleep3:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep_loop3:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep_loop3
paint_green:
    li t3, 0x0F0
    sw t3, 0x00(t0)       # write to palette

sleep4:
    li t1, 0              # t1 = sleep index
    li t2, 1000000
sleep_loop4:
    addi t1, t1, 1        # sleep index++
    blt t1, t2, sleep_loop4
paint_red:
    li t3, 0xF00
    sw t3, 0x00(t0)       # write to palette

done:
    j change_palette      # restart program
