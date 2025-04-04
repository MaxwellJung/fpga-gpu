#include "framebuffer.h"

uint8_t* framebuffer = (uint8_t*)(FRAMEBUFFER_BASE_ADDR);

void initFrameBuffer() {
    for (int y = FRAMEBUFFER_HEIGHT-1; y >= 0; --y) {
        for (int x = 0; x < FRAMEBUFFER_WIDTH; ++x) {
            int pixel_index = getPixelIndex(x, y);
            framebuffer[pixel_index] = pixel_index;
        }
    }
}

uint32_t getPixelIndex(uint16_t x, uint16_t y) {
    return FRAMEBUFFER_WIDTH*y + x;
}

void writePixel(uint16_t x, uint16_t y, uint8_t color_index) {
    int pixel_index = getPixelIndex(x, y);
    framebuffer[pixel_index] = color_index;
}
