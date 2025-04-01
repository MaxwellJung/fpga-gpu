#include "graphics.h"
#include "framebuffer.h"

CursorPosition cp;
uint32_t fill;
uint32_t color_index;
uint32_t wmode;
uint32_t mask;
uint32_t pattern;

void move(uint16_t x, uint16_t y) {
    cp.x = x;
    cp.y = y;
}

void moveR(uint16_t dx, uint16_t dy){
    cp.x = cp.x + dx;
    cp.y = cp.y + dy;
}

void line(uint16_t x, uint16_t y) {

}

void lineR(uint16_t dx, uint16_t dy) {

}

void point(uint16_t x, uint16_t y) {
    move(x, y);
    writePixel(cp.x, cp.y, color_index);
}

void pointR(uint16_t dx, uint16_t dy) {
    moveR(dx, dy);
    writePixel(cp.x, cp.y, color_index);
}

void rect(uint16_t x, uint16_t y) {
    for (uint16_t rect_y = cp.y; rect_y <= y; ++rect_y) {
        for (uint16_t rect_x = cp.x; rect_x <= x; ++rect_x) {
            writePixel(rect_x, rect_y, color_index);
        }
    }
}

void rectR(uint16_t dx, uint16_t dy) {
    for (uint16_t rect_y = cp.y; rect_y < cp.y+dy; ++rect_y) {
        for (uint16_t rect_x = cp.x; rect_x < cp.x+dx; ++rect_x) {
            writePixel(rect_x, rect_y, color_index);
        }
    }
}

void pixelValue(uint8_t i) {
    color_index = i;
}
