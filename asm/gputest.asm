# gpu test assembly code
initPalette:
    li t0, 2048           # addr to palette base
    li t1, 0              # t1 = palette index
    li t4, 256            # palette length
writePalette:
    mv t2, t1             # t2 = color = palette index
    add t3, t0, t1        # t3 = palette addr = base + index
    sw t2, 0x00(t3)       # write color to palette index
    addi t1, t1, 1        # palette index++
    blt t1, t4, writePalette
done:
    j done                # infinite loop
