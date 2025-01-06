#ifndef __STM32L476R_NUCLEO_SYSTICK_H
#define __STM32L476R_NUCLEO_SYSTICK_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

int initSysTick(void);
void delayMilli(uint32_t ms);
void delayMicro(uint32_t us);
uint32_t millis(void);
uint32_t micros(void);

#ifdef __cplusplus
}
#endif

#endif /* __STM32L476R_NUCLEO_SYSTICK_H */
