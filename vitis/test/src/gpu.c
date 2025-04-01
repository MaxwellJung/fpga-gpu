#include "gpu.h"

#include <stdint.h>
#include <string.h>
#include <xil_types.h>

#include "xstatus.h"
#include "xil_io.h"

int initGPU() {
    Xil_Out32(COMMAND0_REG_ADDR, 0);
    Xil_Out32(COMMAND0_REG_ADDR+4, 0);
    Xil_Out32(COMMAND0_REG_ADDR+8, 0);
    Xil_Out32(CONTROL_REG_ADDR, 0);

    return XST_SUCCESS;
}

void testGPU() {
    for (int i = 0; i < 256; i++) {
        // Wait if busy
        while(Xil_In8(STATUS_REG_ADDR));

        // move(i, i)
        Xil_Out32(COMMAND0_REG_ADDR, 1);
        Xil_Out16(COMMAND0_REG_ADDR+4, i);
        Xil_Out16(COMMAND0_REG_ADDR+6, i);

        // pixelValue(i)
        Xil_Out32(COMMAND1_REG_ADDR, 9);
        Xil_Out8(COMMAND1_REG_ADDR+4, i);

        // rect(RESOLUTION_X-1-i, RESOLUTION_Y-1-i)
        Xil_Out32(COMMAND2_REG_ADDR, 7);
        Xil_Out16(COMMAND2_REG_ADDR+4, RESOLUTION_X-1-i);
        Xil_Out16(COMMAND2_REG_ADDR+6, RESOLUTION_Y-1-i);

        // Execute 3 commands
        Xil_Out8(CONTROL_REG_ADDR+1, 3);
        Xil_Out8(CONTROL_REG_ADDR, 1);
    }
}
