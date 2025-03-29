#include <stdint.h>

#include "io_reg.h"
#include "palette.h"
#include "framebuffer.h"

void main() {
    initColorPalette();
    initFrameBuffer();

    while (true) {
        while (!isStartBitHigh());

        setBusyBit();
        clearStartBit();

        executeCommandList();

        clearBusyBit();
    }
}
