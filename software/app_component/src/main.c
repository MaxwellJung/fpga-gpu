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

void delay(u32 d);
void draw_diagonal_background(XBram_Config *frame_buffer_cfg_ptr);
void draw_horizontal_background(XBram_Config *frame_buffer_cfg_ptr);
void draw_vertical_background(XBram_Config *frame_buffer_cfg_ptr);

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

    draw_diagonal_background(bram_cfg_ptr);

	u32 sw_data;
    u32 pixel_index = 0;
	u8 pixel_color;
    int f = 15;
	while (1) {
		sw_data = XGpio_DiscreteRead(&sw_device, SW_CHANNEL);
		XGpio_DiscreteWrite(&led_device, LED_CHANNEL, sw_data);

        if (sw_data != 0) {
            if (pixel_index%f < f/3) {
                draw_horizontal_background(bram_cfg_ptr);
            } else if (pixel_index%f < 2*f/3) {
                draw_diagonal_background(bram_cfg_ptr);
            } else {
                draw_vertical_background(bram_cfg_ptr);
            }
        }

		pixel_color = XBram_In8(bram_cfg_ptr->BaseAddress + pixel_index);
		XBram_Out8(bram_cfg_ptr->BaseAddress + pixel_index, 0xff);
	    xil_printf("Wrote %x to address %x\r\n", 0xff, bram_cfg_ptr->BaseAddress + pixel_index);

        XBram_Out8(bram_cfg_ptr->BaseAddress + pixel_index, pixel_color);
        pixel_index++;
        if (pixel_index > 400*300) pixel_index = 0;
	}
}

void delay(u32 d) {
    for (u32 i = 0; i < d; i++);
}

void draw_diagonal_background(XBram_Config *frame_buffer_cfg_ptr) {
    int pixel_index = 0;
    for (int row = 0; row < 300; row++) {
        for (int col = 0; col < 400; col++) {
            pixel_index = 400 * row + col;
            XBram_Out8(frame_buffer_cfg_ptr->BaseAddress + pixel_index, row + col);
            // XBram_Out8(bram_cfg_ptr->BaseAddress + i, 0);
            // xil_printf("Wrote %x to address %x\r\n", i, bram_cfg_ptr->BaseAddress + i);
            // for (u32 delay = 0; delay < 1000; delay++);
        }
    }
}

void draw_horizontal_background(XBram_Config *frame_buffer_cfg_ptr) {
    int pixel_index = 0;
    for (int row = 0; row < 300; row++) {
        for (int col = 0; col < 400; col++) {
            pixel_index = 400 * row + col;
            XBram_Out8(frame_buffer_cfg_ptr->BaseAddress + pixel_index, row);
            // XBram_Out8(bram_cfg_ptr->BaseAddress + i, 0);
            // xil_printf("Wrote %x to address %x\r\n", i, bram_cfg_ptr->BaseAddress + i);
            // for (u32 delay = 0; delay < 1000; delay++);
        }
    }
}

void draw_vertical_background(XBram_Config *frame_buffer_cfg_ptr) {
    int pixel_index = 0;
    for (int row = 0; row < 300; row++) {
        for (int col = 0; col < 400; col++) {
            pixel_index = 400 * row + col;
            XBram_Out8(frame_buffer_cfg_ptr->BaseAddress + pixel_index, col);
            // XBram_Out8(bram_cfg_ptr->BaseAddress + i, 0);
            // xil_printf("Wrote %x to address %x\r\n", i, bram_cfg_ptr->BaseAddress + i);
            // for (u32 delay = 0; delay < 1000; delay++);
        }
    }
}