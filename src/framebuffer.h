#ifndef _FRAMEBUFFER_H
#define _FRAMEBUFFER_H

#include <stdint.h>

#define FRAMEBUFFER_BASE_ADDR  0xE0000000
#define FRAMEBUFFER_WIDTH  400
#define FRAMEBUFFER_HEIGHT  300
#define FRAMEBUFFER_LENGTH  (FRAMEBUFFER_WIDTH*FRAMEBUFFER_HEIGHT)

extern uint8_t* framebuffer;

// set ith pixel to ith color index
void initFrameBuffer();
// Convert (x,y) pixel coordinate to linear address
uint32_t getPixelIndex(uint16_t x, uint16_t y);
void writePixel(uint16_t x, uint16_t y, uint8_t color_index);

#endif // _FRAMEBUFFER_H
