#ifndef _HEAP_H
#define _HEAP_H

#include <stdint.h>

#define HEAP_BASE_ADDR         0x10000000

extern uint8_t* heap;

void testHeap();


#endif // _HEAP_H
