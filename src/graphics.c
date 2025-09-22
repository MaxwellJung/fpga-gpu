#include <stdlib.h>
#include "graphics.h"
#include "heap.h"
#include "framebuffer.h"

Point2D cp;
uint32_t fill;
uint8_t color_index;
uint32_t wmode;
uint32_t mask;
uint32_t pattern;

void move(uint16_t x, uint16_t y) {
    cp.x = x;
    cp.y = y;
}

void moveR(int16_t dx, int16_t dy){
    cp.x = cp.x + dx;
    cp.y = cp.y + dy;
}

void line(uint16_t x, uint16_t y) {

}

void lineR(int16_t dx, int16_t dy) {

}

void point(uint16_t x, uint16_t y) {
    move(x, y);
    writePixel(cp.x, cp.y, color_index);
}

void pointR(int16_t dx, int16_t dy) {
    moveR(dx, dy);
    writePixel(cp.x, cp.y, color_index);
}

void rect(uint16_t x, uint16_t y) {
    Point2D cp_backup = cp;

    // Set bottom left and top right corners
    uint16_t min_x = (cp.x < x) ? cp.x : x;
    uint16_t max_x = (cp.x < x) ? x : cp.x;
    uint16_t min_y = (cp.y < y) ? cp.y : y;
    uint16_t max_y = (cp.y < y) ? y : cp.y;
    // bottom left
    move(min_x, min_y);
    // top right
    x = max_x;
    y = max_y;

    int16_t width = x-cp.x+1;
    int16_t height = y-cp.y+1;

    for (int i = 0; i < height; ++i) {
        hlineR(width);
        moveR(0, 1);
    }

    move(cp_backup.x, cp_backup.y);
}

void rectR(int16_t dx, int16_t dy) {
    rect((dx > 0) ? cp.x+dx-1 : cp.x+dx+1, (dy > 0) ? cp.y+dy-1 : cp.y+dy+1);
}

void pixelValue(uint8_t i) {
    color_index = i;
}

void hline(uint16_t x) {
    int16_t width = x-cp.x;
    // increase magnitude by 1 regardless of sign
    width = (width > 0) ? width + 1 : width - 1;
    hlineR(width);
}

void hlineR(int16_t dx) {
    uint32_t starting_pixel_index = getPixelIndex(cp.x, cp.y);
    uint32_t ending_pixel_index = starting_pixel_index + dx;

    // Swap starting and ending index if needed
    uint32_t temp;
    if (ending_pixel_index < starting_pixel_index) {
        temp = starting_pixel_index;
        starting_pixel_index = ending_pixel_index;
        ending_pixel_index = temp;
    }
    
    uint32_t ending_pixel4_index = ending_pixel_index & ~0b11;
    uint32_t color_index_4x = 0;

    for (int i = 0; i < 4; ++i) {
        color_index_4x = (color_index_4x << 8) | color_index;
    }
    
    int i;
    // Write bytes until starting word boundary
    for (i = starting_pixel_index; (i & 0b11) != 0; ++i) {
        framebuffer[i] = color_index;
    }
    // Write words until ending word boundary
    for (; i < ending_pixel4_index; i+=4) {
        *((uint32_t*)&framebuffer[i]) = color_index_4x;
    }
    // Write bytes until ending pixel
    for (; i < ending_pixel_index; ++i) {
        framebuffer[i] = color_index;
    }
}

void testGraphics() {
    move(0, 0);
    for (int i = 0; i < 256; ++i) {
        pixelValue(i);
        hline(FRAMEBUFFER_WIDTH-1);
        moveR(0, 1);
    }

    move(0, 0);
    for (int i = 0; i < 256; ++i) {
        move(i, i);
        pixelValue(i);
        rect(FRAMEBUFFER_WIDTH-i-1, FRAMEBUFFER_HEIGHT-i-1);
    }
}

void drawBlock(int x, int y, int width, int height, uint8_t *src) {
    for (int dy = 0; dy < height; ++dy) {
        for (int dx = 0; dx < width; ++dx) {
            int pixel_index = getPixelIndex(x+dx, y+dy);
            framebuffer[pixel_index] = src[width*dy + dx];
        }
    }
}
