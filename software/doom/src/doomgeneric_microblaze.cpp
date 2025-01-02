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

void DG_DrawFrame() {
    int pixel_index = 0;
    for (int row = 0; row < DOOMGENERIC_RESY; row++) {
        for (int col = 0; col < DOOMGENERIC_RESX; col++) {
        pixel_index = DOOMGENERIC_RESX * row + col;
        XBram_Out8(bram_cfg_ptr->BaseAddress + pixel_index, (u8) DG_ScreenBuffer[pixel_index]);
        }
    }
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
