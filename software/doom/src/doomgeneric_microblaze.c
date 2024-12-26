#include "doomgeneric.h"

#include "xparameters.h"
#include "xbram.h"
 
// Get device IDs from xparameters.h
#define BRAM_DEVICE_ID      XPAR_XBRAM_0_BASEADDR

XBram_Config *bram_cfg_ptr;

void DG_Init() {
	xil_printf("Init platform\r\n");

  // Initialize BRAM Device
  XBram bram_device;
  bram_cfg_ptr = XBram_LookupConfig(BRAM_DEVICE_ID);
  XBram_CfgInitialize(&bram_device, bram_cfg_ptr, bram_cfg_ptr->CtrlBaseAddress);
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
  for (u32 i = 0; i < ms * 1000; i++);
}

uint32_t DG_GetTicksMs()
{
  return 0;
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

    for (int i = 0; ; i++)
    {
        doomgeneric_Tick();
    }
    

    return 0;
}
