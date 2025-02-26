#include "gpu.h"

#include <stdint.h>
#include <string.h>
#include <xil_types.h>

#include "xstatus.h"
#include "xil_io.h"

int initGPU() {
    Xil_Out32(GPU_BASEADDR+CURRENT_POS_X_OFFSET, 0);
    Xil_Out32(GPU_BASEADDR+CURRENT_POS_Y_OFFSET, 0);
    Xil_Out32(GPU_BASEADDR+INDEX_OFFSET, 0);

    return XST_SUCCESS;
}

void clearDisplay() {
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_X_OFFSET, x);
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_Y_OFFSET, y);
            Xil_Out32(GPU_BASEADDR+INDEX_OFFSET, 0b11100000);
        }
    }
}

void drawIndexImage() {
    uint32_t pixel_index = 0;
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            pixel_index = RESOLUTION_X*y + x;
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_X_OFFSET, x);
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_Y_OFFSET, y);
            Xil_Out32(GPU_BASEADDR+INDEX_OFFSET, pixel_index);
        }
    }
}

void drawHStripes() {
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_X_OFFSET, x);
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_Y_OFFSET, y);
            Xil_Out32(GPU_BASEADDR+INDEX_OFFSET, y);
        }
    }
}

void drawVStripes() {
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_X_OFFSET, x);
            Xil_Out32(GPU_BASEADDR+CURRENT_POS_Y_OFFSET, y);
            Xil_Out32(GPU_BASEADDR+INDEX_OFFSET, x);
        }
    }
}