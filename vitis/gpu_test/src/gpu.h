#ifndef __GPU_H_
#define __GPU_H_

#include "xparameters.h"

#include "xaxidma.h"

#ifdef __cplusplus
extern "C" {
#endif

#define GPU_BASEADDR XPAR_AXI_GPU_AXI_BRAM_CTRL_0_BASEADDR
#define STATUS_REG_ADDR GPU_BASEADDR
#define CONTROL_REG_ADDR (GPU_BASEADDR+4)
#define HEAP_WR_START_ADDR (GPU_BASEADDR+8)

#define COMMAND0_REG_ADDR (GPU_BASEADDR+16*4)
#define COMMAND1_REG_ADDR (COMMAND0_REG_ADDR+4*4)
#define COMMAND2_REG_ADDR (COMMAND1_REG_ADDR+4*4)
#define COMMAND3_REG_ADDR (COMMAND2_REG_ADDR+4*4)

#define RESOLUTION_X 400
#define RESOLUTION_Y 300
#define COLOR_PALETTE_LENGTH 256

#define DMA_DEVICE_ID XPAR_AXI_DMA_0_BASEADDR

extern XAxiDma dma_device;

int initGPU();
void testGPU();

#ifdef __cplusplus
}
#endif

#endif
