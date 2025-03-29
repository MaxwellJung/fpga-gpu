#ifndef _GRAPHICS_H
#define _GRAPHICS_H

#include <stdint.h>

typedef struct {
    uint16_t x;
    uint16_t y;
} CursorPosition;

extern CursorPosition cp;
extern uint32_t fill;
extern uint32_t color_index;
extern uint32_t wmode;
extern uint32_t mask;
extern uint32_t pattern;

// CP = (x,y)
void move(uint16_t x, uint16_t y);
// CP += (dx,dy)
void moveR(uint16_t dx, uint16_t dy);
void line(uint16_t x, uint16_t y);
void lineR(uint16_t dx, uint16_t dy);
void point(uint16_t x, uint16_t y);
void pointR(uint16_t dx, uint16_t dy);
// Draw rectangle from CP to (x,y)
void rect(uint16_t x, uint16_t y);
void rectR(uint16_t dx, uint16_t dy);
// Set color index
void pixelValue(uint8_t i);

#endif // _GRAPHICS_H
