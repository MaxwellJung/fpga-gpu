# gpu test assembly code
main:

reset_framebuffer:
    li x1, 0              # x1 = (y,x) = (0,0)
    li x2, 0x00010002     # x1 = (y,x) = (1,2)
    li x3, 0xff           # x3 = pixel color = 0xff
write_pixel:
    .word  0b11111110001100001000111110101011 # fbsw x3 x1
    .word  0b10000000001000001000000010110011 # addxy x1, x1, x2
    j write_pixel


done:
    j done                # restart program
