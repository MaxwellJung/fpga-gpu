#include "xparameters.h"
#include "xbram.h"
#include "xgpio.h"
#include <stdio.h>
 
// Get device IDs from xparameters.h
#define SW_ID               XPAR_AXI_GPIO_1_BASEADDR
#define LED_ID              XPAR_AXI_GPIO_0_BASEADDR
#define SW_CHANNEL          1
#define LED_CHANNEL         1
#define BTN_MASK            0b1111111111111111
#define LED_MASK            0b1111

#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR


int main() {
	xil_printf("Entered function main\r\n");

	XGpio_Config *gpio_cfg_ptr;
	XGpio led_device, sw_device;
 
	// Initialize LED Device
	gpio_cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);
 
	// Initialize Button Device
	gpio_cfg_ptr = XGpio_LookupConfig(SW_ID);
	XGpio_CfgInitialize(&sw_device, gpio_cfg_ptr, gpio_cfg_ptr->BaseAddress);
 
	// Set Button Tristate
	XGpio_SetDataDirection(&sw_device, SW_CHANNEL, BTN_MASK);
 
	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);


    // Initialize BRAM Device
    XBram_Config *bram_cfg_ptr;
    XBram bram_device;
    bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
    XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);

    int i = 0;
    for (int row = 0; row < 300; row++) {
        for (int col = 0; col < 400; col++) {
            i = 400 * row + col;
            XBram_Out8(bram_cfg_ptr->BaseAddress + i, i);
            // XBram_Out8(bram_cfg_ptr->BaseAddress + i, 0);
            // xil_printf("Wrote %x to address %x\r\n", i, bram_cfg_ptr->BaseAddress + i);
            // for (u32 delay = 0; delay < 1000; delay++);
        }
    }


	// u32 sw_data;
    u32 pixel_index = 0;
	u8 pixel_color;
	while (1) {
		// sw_data = XGpio_DiscreteRead(&sw_device, SW_CHANNEL);
		// XGpio_DiscreteWrite(&led_device, LED_CHANNEL, sw_data);
        // pixel_index = sw_data;

		pixel_color = XBram_In8(bram_cfg_ptr->BaseAddress + pixel_index);
		XBram_Out8(bram_cfg_ptr->BaseAddress + pixel_index, 0xff);
	    xil_printf("Wrote %x to address %x\r\n", 0xff, bram_cfg_ptr->BaseAddress + pixel_index);

        XBram_Out8(bram_cfg_ptr->BaseAddress + pixel_index, pixel_color);
        pixel_index++;
        if (pixel_index > 400*300) pixel_index = 0;
	}
}
