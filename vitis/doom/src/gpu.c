#include "gpu.h"

#include <string.h>
#include <xil_types.h>

#include "xparameters.h"
#include "xstatus.h"
#include "xbram.h"

#include "doomgeneric.h"

// Get device IDs from xparameters.h
#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR
#define RESOLUTION_X 400
#define RESOLUTION_Y 300
#define COLOR_PALETTE_LENGTH 256
#define FRAMEBUFFER_BASE_ADDRESS 512

XBram_Config *bram_cfg_ptr;
XBram bram_device;

int initGPU() {
    // Initialize BRAM for GPU
    bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
    XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);

    // RRRGGGBB color palette
    uint16_t rrr, ggg, bb, rrrgggbb;
    for (uint32_t i = 0; i < 256; i++) {
        rrr = (i&0b11100000)>>5;
        ggg = (i&0b11100)>>2;
        bb = i&0b11;
        rrrgggbb = (rrr<<9) | (ggg<<5) | (bb<<2) | 0b000100010011;
        writeColorPallete(i, rrrgggbb);
    }
    
    drawIndexImage();

    return XST_SUCCESS;
}

void writeFramebuffer(pixel_t* newFrame) {
    memcpy(
        (void*) (bram_cfg_ptr->BaseAddress + FRAMEBUFFER_BASE_ADDRESS), 
        newFrame, 
        RESOLUTION_X * RESOLUTION_Y * sizeof(pixel_t));
}

void writeColorPallete(int palette_index, u16 color) {
    XBram_Out16(
        bram_cfg_ptr->BaseAddress + 2*palette_index, 
        color);
}

void clearDisplay() {
    uint32_t pixel_index = 0;
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            pixel_index = RESOLUTION_X * y + x;
            XBram_Out8(bram_cfg_ptr->BaseAddress+FRAMEBUFFER_BASE_ADDRESS+pixel_index, 0);
        }
    }
}

void drawIndexImage() {
    uint32_t pixel_index = 0;
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            pixel_index = RESOLUTION_X * y + x;
            XBram_Out8(bram_cfg_ptr->BaseAddress+FRAMEBUFFER_BASE_ADDRESS+pixel_index, pixel_index);
        }
    }
}

void drawHStripes() {
    uint32_t pixel_index = 0;
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            pixel_index = RESOLUTION_X * y + x;
            XBram_Out8(bram_cfg_ptr->BaseAddress+FRAMEBUFFER_BASE_ADDRESS+pixel_index, y);
        }
    }
}

void drawVStripes() {
    uint32_t pixel_index = 0;
    for (uint32_t y = 0; y < RESOLUTION_Y; y++) {
        for (uint32_t x = 0; x < RESOLUTION_X; x++) {
            pixel_index = RESOLUTION_X * y + x;
            XBram_Out8(bram_cfg_ptr->BaseAddress+FRAMEBUFFER_BASE_ADDRESS+pixel_index, x);
        }
    }
}