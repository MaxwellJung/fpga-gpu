#include <stdint.h>

#include "palette.h"
#include "framebuffer.h"
#include "graphics.h"
#include "io_reg.h"
#include "heap.h"

void main() {
    initColorPalette();
    initFrameBuffer();
    while (true)
        testHeap();

    while (true) {
        while (!isStartBitHigh());

        setBusyBit();
        clearStartBit();

        executeCommandList();

        clearBusyBit();
    }
}
