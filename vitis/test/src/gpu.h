#ifndef __GPU_H_
#define __GPU_H_

#include "xparameters.h"

#ifdef __cplusplus
extern "C" {
#endif

#define GPU_BASEADDR XPAR_GPUTOP_0_BASEADDR
#define CURRENT_POS_X_OFFSET 0
#define CURRENT_POS_Y_OFFSET 4
#define INDEX_OFFSET 8

#define RESOLUTION_X 400
#define RESOLUTION_Y 300
#define COLOR_PALETTE_LENGTH 256

int initGPU();
void clearDisplay();
void drawIndexImage();
void drawHStripes();
void drawVStripes();

#ifdef __cplusplus
}
#endif

#endif
