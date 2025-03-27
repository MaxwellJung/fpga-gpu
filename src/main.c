#include <stdbool.h>
#include <stdint.h>
#include "io_reg.h"
#include "palette.h"
#include "framebuffer.h"

void initColorPalette();
void initFrameBuffer();
bool isStartBitHigh();
void setBusyStatus();
void clearStartBit();

void main() {
    initColorPalette();
    initFrameBuffer();

    while (true) {
        while (!isStartBitHigh());
        
        setBusyStatus();
        clearStartBit();

        for (int i = 0; i < 1000000; ++i);
    }
    
    return;
}

void initColorPalette() {
    uint32_t r, g, b;
    uint32_t rgb444;

    for (int i = 0; i < PALETTE_LENGTH; ++i) {
        r = (i & 0b11100000) >> 5;
        g = (i & 0b00011100) >> 2;
        b = (i & 0b00000011) >> 0;
        rgb444 = (r << 9) | (g << 5) | (b << 2);
        
        *((uint32_t*)(PALETTE_BASE_ADDR+2*i)) = rgb444;
    }
}

void initFrameBuffer() {
    for (int y = FRAMEBUFFER_HEIGHT-1; y >= 0; --y) {
        for (int x = 0; x < FRAMEBUFFER_WIDTH; ++x) {
            int pixel_index = FRAMEBUFFER_WIDTH*y + x;
            *((uint32_t*)(FRAMEBUFFER_BASE_ADDR+pixel_index)) = pixel_index;
        }
    }
}

bool isStartBitHigh() {
    uint32_t* control_reg_ptr = (uint32_t*)(IO_CONTROL_REG_ADDR);
    uint32_t start_bit = *control_reg_ptr & 0x00000001;

    return (start_bit == 1);
}

void setBusyStatus() {
    uint32_t* status_reg_ptr = (uint32_t*)(IO_STATUS_REG_ADDR);
    *status_reg_ptr |= 0x00000001;
}

void clearStartBit() {
    uint32_t* control_reg_ptr = (uint32_t*)(IO_CONTROL_REG_ADDR);
    *control_reg_ptr &= ~0x00000001;
}
