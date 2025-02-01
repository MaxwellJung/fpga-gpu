#ifndef __GPU_H_
#define __GPU_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "xbram.h"

#include "doomgeneric.h"

extern XBram bram_device;

int initGPU();
void writeFramebuffer(pixel_t* newFrame);
void writeColorPallete(int palette_index, u16 color);
void clearDisplay();
void drawIndexImage();
void drawHStripes();
void drawVStripes();

#ifdef __cplusplus
}
#endif

#endif
