#include <stdint.h>
#include "palette.h"

void initColorPalette() {
    uint32_t r, g, b;
    uint32_t rgb444;

    for (int i = 0; i < PALETTE_LENGTH; ++i) {
        r = (i & 0b11100000) >> 5;
        g = (i & 0b00011100) >> 2;
        b = (i & 0b00000011) >> 0;
        rgb444 = (r << 9) | (g << 5) | (b << 2);
        
        *((uint32_t*)(PALETTE_BASE_ADDR+2*i)) = rgb444;
    }
}
