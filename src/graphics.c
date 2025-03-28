#include "graphics.h"
#include "framebuffer.h"

uint32_t cp_x;
uint32_t cp_y;
uint32_t fill;
uint32_t color_index;
uint32_t wmode;
uint32_t mask;
uint32_t pattern;

void move(uint32_t x, uint32_t y) {
    cp_x = x;
    cp_y = y;
}

void moveR(uint32_t dx, uint32_t dy){
    cp_x = cp_x + dx;
    cp_y = cp_y + dy;
}

void line(uint32_t x, uint32_t y) {

}

void lineR(uint32_t dx, uint32_t dy) {

}

void point(uint32_t x, uint32_t y) {
    move(x, y);
    writePixel(cp_x, cp_y, color_index);
}

void pointR(uint32_t dx, uint32_t dy) {
    moveR(dx, dy);
    writePixel(cp_x, cp_y, color_index);
}

void rect(uint32_t x, uint32_t y) {
    for (int rect_y = cp_y; rect_y < y; ++rect_y) {
        for (int rect_x = cp_x; rect_x < x; ++rect_x) {
            writePixel(rect_x, rect_y, color_index);
        }
    }
}

void rectR(uint32_t dx, uint32_t dy) {
    for (int rect_y = cp_y; rect_y < cp_y+dy; ++rect_y) {
        for (int rect_x = cp_x; rect_x < cp_x+dx; ++rect_x) {
            writePixel(rect_x, rect_y, color_index);
        }
    }
}

void pixelValue(uint32_t i) {
    color_index = i;
}
