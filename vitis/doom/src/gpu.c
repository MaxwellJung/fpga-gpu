#include "gpu.h"

#include <string.h>
#include <xil_types.h>

#include "xparameters.h"
#include "xstatus.h"
#include "xbram.h"

// #include "doomgeneric.h"

// Get device IDs from xparameters.h
#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR
#define RESOLUTION_X 400
#define RESOLUTION_Y 300
#define COLOR_PALETTE_LENGTH 256
#define FRAMEBUFFER_OFFSET 512

XBram_Config *bram_cfg_ptr;
XBram bram_device;

int initGPU() {
    // Initialize BRAM for GPU
    bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
    XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);

    for (uint32_t i = 0; i < COLOR_PALETTE_LENGTH; i++) {
        uint16_t r = (i & 0b11110000) >> 4;
        uint16_t g = (i & 0b00111100) >> 2;
        uint16_t b = (i & 0b00001111);
        uint16_t rgb = (r << 8) | (g << 4) | b;
        XBram_Out16(bram_cfg_ptr->BaseAddress+2*i, rgb);
    }

    for (uint32_t i = 0; i < RESOLUTION_X * RESOLUTION_Y; i++) {
        XBram_Out8(bram_cfg_ptr->BaseAddress+512+i, i);
    }

    return XST_SUCCESS;
}

void writeFramebuffer(pixel_t* newFrame) {
    memcpy(
        (void*) (bram_cfg_ptr->BaseAddress + FRAMEBUFFER_OFFSET), 
        newFrame, 
        RESOLUTION_X * RESOLUTION_Y * sizeof(pixel_t));
}

void writeColorPallete(int palette_index, u16 color) {
    XBram_Out16(
        bram_cfg_ptr->BaseAddress + 2*palette_index, 
        color);
}