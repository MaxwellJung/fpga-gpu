#include "heap.h"
#include "graphics.h"

uint8_t* heap = (uint8_t*)(HEAP_BASE_ADDR);

void testHeap() {
    drawBlock(0, 0, 400, 300, heap);
}
