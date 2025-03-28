#ifndef _GRAPHICS_H
#define _GRAPHICS_H

#include <stdint.h>

// CP = (x,y)
void move(uint32_t x, uint32_t y);
// CP += (dx,dy)
void moveR(uint32_t dx, uint32_t dy);
void line(uint32_t x, uint32_t y);
void lineR(uint32_t dx, uint32_t dy);
void point(uint32_t x, uint32_t y);
void pointR(uint32_t dx, uint32_t dy);
// Draw rectangle from CP to (x,y)
void rect(uint32_t x, uint32_t y);
void rectR(uint32_t dx, uint32_t dy);
// Set color index
void pixelValue(uint32_t i);

#endif // _GRAPHICS_H
