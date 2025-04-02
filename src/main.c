#include <stdint.h>

#include "palette.h"
#include "framebuffer.h"
#include "graphics.h"
#include "io_reg.h"

void main() {
    initColorPalette();
    initFrameBuffer();
    // testGraphics();

    while (true) {
        while (!isStartBitHigh());

        setBusyBit();
        clearStartBit();

        executeCommandList();

        clearBusyBit();
    }
}
