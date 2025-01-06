#include <string.h>

extern "C" {
#include "doomgeneric.h"
}

#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

#include "xbram.h"
#include "SysTick.h"
#include "spi.h"
#include "SD.h"                     // Arduino SD card & FAT filesystem library

int initHardware();

// Get device IDs from xparameters.h
#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR

XBram_Config *bram_cfg_ptr;

int initHardware() {
    if (initSysTick() == XST_SUCCESS) {
        xil_printf("Initialized Systick!\r\n");
    }
    if (initSDCard() == XST_SUCCESS) {
        xil_printf("Initialized SD Card!\r\n");
    }

    // Initialize BRAM Device
    XBram bram_device;
    bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
    XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);

    return XST_SUCCESS;
}

void DG_Init() {
    if (initHardware() == XST_SUCCESS) {
        xil_printf("Initialized Hardware!\r\n");
    } else {
        xil_printf("Failed to initialize hardware!\r\n");
    }
}

uint8_t argb_to_rrrgggbb(uint32_t argb) {
    uint8_t red = (argb & 0x00FF0000) >> 16;
    uint8_t green = (argb & 0x0000FF00) >> 8;
    uint8_t blue = (argb & 0x000000FF) >> 0;

    uint8_t rrrgggbb = ((red >> 5) << 5) | \
                       ((green >> 5) << 2) | \
                       (blue >> 6);

    return rrrgggbb;
}

void DG_DrawFrame() {
    memcpy((void*) bram_cfg_ptr->BaseAddress, DG_ScreenBuffer, DOOMGENERIC_RESX * DOOMGENERIC_RESY * sizeof(pixel_t));
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
