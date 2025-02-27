# gpu test assembly code
main:

reset_framebuffer:
    li x1, 0              # x1 = (y,x) = (0,0)
    li x3, 0              # x3 = pixel color
    .word  0b11111110001100001000111110101011 # fbsw
    li x1, 1              # x1 = (y,x) = (0,1)
    li x3, 1              # x3 = pixel color
    .word  0b11111110001100001000111110101011 # fbsw
    li x1, 0x00010000     # x1 = (y,x) = (1,0)
    li x3, 2              # x3 = pixel color
    .word  0b11111110001100001000111110101011 # fbsw
    li x1, 0x00010000     # x1 = (y,x) = (1,1)
    li x3, 3              # x3 = pixel color
    .word  0b11111110001100001000111110101011 # fbsw

done:
    j done                # restart program
