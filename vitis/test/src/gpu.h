#ifndef __GPU_H_
#define __GPU_H_

#include "xparameters.h"

#ifdef __cplusplus
extern "C" {
#endif

#define GPU_BASEADDR XPAR_GPUTOP_0_BASEADDR
#define STATUS_REG_ADDR GPU_BASEADDR
#define CONTROL_REG_ADDR (STATUS_REG_ADDR+4)
#define COMMAND0_REG_ADDR (CONTROL_REG_ADDR+4)
#define COMMAND1_REG_ADDR (COMMAND0_REG_ADDR+12)
#define COMMAND2_REG_ADDR (COMMAND1_REG_ADDR+12)
#define COMMAND3_REG_ADDR (COMMAND2_REG_ADDR+12)

#define RESOLUTION_X 400
#define RESOLUTION_Y 300
#define COLOR_PALETTE_LENGTH 256

int initGPU();
void testGPU();

#ifdef __cplusplus
}
#endif

#endif
