# gpu test assembly code
main:

reset_palette:
    li x0, 2048           # addr to palette base
    li x1, 0              # x1 = palette index
    li x4, 256            # x4 = # of colors
write_palette_loop:
    add x2, x0, x1        # x2 = palette addr
    mv x3, x1             # x3 = palette value = index
    sw x3, 0x00(x2)       # write to palette
    addi x1, x1, 1        # palette index++
    blt x1, x4, write_palette_loop

reset_framebuffer:
    li x0, 131072         # addr to framebuffer base
    li x1, 0              # x1 = pixel index
    li x4, 120000         # x4 = # of pixels
write_framebuffer_loop:
    add x2, x0, x1        # x2 = pixel addr
    mv x3, x1             # x3 = pixel value = index
    sw x3, 0x00(x2)       # write to framebuffer
    addi x1, x1, 1        # pixel index++
    blt x1, x4, write_framebuffer_loop

done:
    j main                # restart program
