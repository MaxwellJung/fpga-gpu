#include <stdint.h>

#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

#include "platform.h"
#include "gpu.h"
#include "SysTick.h"
#include "gpio.h"

extern "C" {
#include "doomkeys.h"
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
    // Poll GPIO pins
    int switches_data = readSwitches();
    int buttons_data = readButtons();
    char key = 0;

    switch (switches_data) {
        case 0x1:
            key = KEY_FIRE; // fire
            break;
        case 0x2:
            key = KEY_USE; // use
            break;
        case 0x4:
            key = KEY_RALT; // strafe
            break;
        case 0x8:
            key = KEY_RSHIFT; // run
            break;
	}

	switch (buttons_data) {
        case 0x1:
            key = KEY_ENTER;
            break;
        case 0x2:
            key = KEY_UPARROW;
            break;
        case 0x4:
            key = KEY_LEFTARROW;
            break;
        case 0x8:
            key = KEY_RIGHTARROW;
            break;
        case 0x10:
            key = KEY_DOWNARROW;
            break;
	}

    *doomKey = key;
    *pressed = (switches_data != 0) || (buttons_data != 0);
    // xil_printf("*doomKey=%x, *pressed=%x\r\n", *doomKey, *pressed);

	return *pressed;
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
