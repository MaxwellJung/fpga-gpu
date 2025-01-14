#include <stdint.h>
#include <string.h>

extern "C" {
#include "doomgeneric.h"
}

#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

#include "SysTick.h"
#include "spi.h"
#include "SD.h"                     // Arduino SD card & FAT filesystem library
#include "xbram.h"

int initHardware();

// Get device IDs from xparameters.h
#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR

XBram_Config *bram_cfg_ptr;

int initHardware() {
    if (initSysTick() == XST_SUCCESS) {
        xil_printf("Initialized Systick!\r\n");
    } else {
        xil_printf("Systick Failure!\r\n");
        return XST_FAILURE;
    }
    if (initSDCard() == XST_SUCCESS) {
        xil_printf("Initialized SD Card!\r\n");
    } else {
        xil_printf("SD Card Failure!\r\n");
        return XST_FAILURE;
    }

    // Initialize BRAM for GPU
    XBram bram_device;
    bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
    XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);

    for (uint32_t i = 0; i < 256; i++) {
        XBram_Out16(bram_cfg_ptr->BaseAddress+2*i, i);
    }

    for (uint32_t i = 0; i < DOOMGENERIC_RESX * DOOMGENERIC_RESY; i++) {
        XBram_Out8(bram_cfg_ptr->BaseAddress+512+i, i);
    }

    xil_printf("Initialized GPU!\r\n");

    return XST_SUCCESS;
}

void DG_Init() {
    if (initHardware() == XST_SUCCESS) {
        xil_printf("Initialized Hardware!\r\n");
    } else {
        xil_printf("Failed to initialize hardware!\r\n");
        while(1);
    }
}

void DG_DrawFrame() {
    memcpy((void*) (bram_cfg_ptr->BaseAddress + 512), DG_ScreenBuffer, DOOMGENERIC_RESX * DOOMGENERIC_RESY * sizeof(pixel_t));
}

void DG_SleepMs(uint32_t ms)
{
    delayMilli(ms);
}

uint32_t DG_GetTicksMs()
{
    return millis();
}

int DG_GetKey(int* pressed, unsigned char* doomKey)
{
    return 0;
}

void DG_SetWindowTitle(const char * title)
{
    return;
}

int main(int argc, char **argv)
{
    doomgeneric_Create(argc, argv);

    while (true) {
        doomgeneric_Tick();
    }
    
    return 0;
}
