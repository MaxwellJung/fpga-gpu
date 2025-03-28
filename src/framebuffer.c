#include "framebuffer.h"

void initFrameBuffer() {
    for (int y = FRAMEBUFFER_HEIGHT-1; y >= 0; --y) {
        for (int x = 0; x < FRAMEBUFFER_WIDTH; ++x) {
            int pixel_index = FRAMEBUFFER_WIDTH*y + x;
            *((uint32_t*)(FRAMEBUFFER_BASE_ADDR+pixel_index)) = pixel_index;
        }
    }
}

void writePixel(uint32_t x, uint32_t y, uint32_t color_index) {
    int pixel_index = FRAMEBUFFER_WIDTH*y + x;
    *((uint32_t*)(FRAMEBUFFER_BASE_ADDR+pixel_index)) = color_index;
}
