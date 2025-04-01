#include <stdint.h>
#include "palette.h"

uint16_t* color_palette = (uint16_t*)(PALETTE_BASE_ADDR);

void initColorPalette() {
    uint16_t r4, g4, b4, a4;
    uint16_t rgba4444;
    int palette_index;

    for (int i = 0; i < PALETTE_LENGTH; ++i) {
        r4 = ((i & 0b11100000) >> 5) << 1;
        g4 = ((i & 0b00011100) >> 2) << 1;
        b4 = ((i & 0b00000011) >> 0) << 2;
        a4 = 0;
        rgba4444 = (r4 << 12) | (g4 << 8) | (b4 << 4) | (a4 << 0);
        
        color_palette[i] = rgba4444;
    }
}
