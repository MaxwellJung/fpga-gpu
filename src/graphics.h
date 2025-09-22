#ifndef _GRAPHICS_H
#define _GRAPHICS_H

#include <stdint.h>

typedef struct {
    uint16_t x;
    uint16_t y;
} Point2D;

// Display Commands
// CP = (x,y)
void move(uint16_t x, uint16_t y);
// CP += (dx,dy)
void moveR(int16_t dx, int16_t dy);
void line(uint16_t x, uint16_t y);
void lineR(int16_t dx, int16_t dy);
void point(uint16_t x, uint16_t y);
void pointR(int16_t dx, int16_t dy);
// Draw rectangle bounded by CP and (x,y)
// starting from bottom left to top right
void rect(uint16_t x, uint16_t y);
void rectR(int16_t dx, int16_t dy);
// Set color index
void pixelValue(uint8_t i);

// Helper functions
// Draw horizontal line from CP to X
void hline(uint16_t x);
// Draw horizontal line from CP to CP + dx
void hlineR(int16_t dx);
void testGraphics();

void drawBlock(int x, int y, int width, int height, uint8_t *src);

#endif // _GRAPHICS_H
