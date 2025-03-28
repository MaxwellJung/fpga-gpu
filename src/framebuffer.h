#ifndef _FRAMEBUFFER_H
#define _FRAMEBUFFER_H

#include <stdint.h>

#define FRAMEBUFFER_BASE_ADDR  0xC0020000
#define FRAMEBUFFER_WIDTH  400
#define FRAMEBUFFER_HEIGHT  300
#define FRAMEBUFFER_LENGTH  (FRAMEBUFFER_WIDTH*FRAMEBUFFER_HEIGHT)

void initFrameBuffer();
void writePixel(uint32_t x, uint32_t y, uint32_t color_index);

#endif // _FRAMEBUFFER_H
