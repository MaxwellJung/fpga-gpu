#include <stdint.h>

#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

#include "platform.h"
#include "gpu.h"
#include "SysTick.h"

extern "C" {
#include "doomgeneric.h"
}

void DG_Init() {
    if (init_platform() == XST_SUCCESS) {
        xil_printf("Initialized Hardware!\r\n");
    } else {
        xil_printf("Failed to initialize hardware!\r\n");
        while(1);
    }

    // char command[64];
    // printf("Please enter a command:");
    // scanf("%s", command);
}

void DG_DrawFrame() {
    writeFramebuffer(DG_ScreenBuffer);
}

void DG_SleepMs(uint32_t ms) {
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
