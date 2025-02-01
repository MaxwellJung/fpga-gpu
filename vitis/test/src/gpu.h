#ifndef __GPU_H_
#define __GPU_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "xbram.h"

extern XBram bram_device;

int initGPU();
void clearDisplay();
void drawIndexImage();
void drawHStripes();
void drawVStripes();

#ifdef __cplusplus
}
#endif

#endif
