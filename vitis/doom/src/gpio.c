#include "gpio.h"

#include <xil_types.h>

#include "xparameters.h"
#include "xstatus.h"
#include "xgpio.h"

#include "doomgeneric.h"

// Get device IDs from xparameters.h
#define BTN_SWITCH_DEVICE_ID        XPAR_AXI_GPIO_1_BASEADDR
// 16 switches
#define SWITCH_CHANNEL 1
#define SWITCH_MASK 0xffff
// 5 push buttons
#define BTN_CHANNEL 2
#define BTN_MASK 0b11111

XGpio_Config *btn_switch_cfg_ptr;
XGpio btn_switch_device;

int initGpio() {
	// Initialize switch/button Device
	btn_switch_cfg_ptr = XGpio_LookupConfig(BTN_SWITCH_DEVICE_ID);
	XGpio_CfgInitialize(&btn_switch_device, btn_switch_cfg_ptr, btn_switch_cfg_ptr->BaseAddress);
 
	// Set switch as inputs
	XGpio_SetDataDirection(&btn_switch_device, SWITCH_CHANNEL, SWITCH_MASK);
	// Set button as inputs
	XGpio_SetDataDirection(&btn_switch_device, BTN_CHANNEL, BTN_MASK);

    return XST_SUCCESS;
}

int readSwitches() {
    return XGpio_DiscreteRead(&btn_switch_device, SWITCH_CHANNEL);
}

int readButtons() {
    return XGpio_DiscreteRead(&btn_switch_device, BTN_CHANNEL);
}
