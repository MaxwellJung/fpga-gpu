#ifndef __GPIO_H_
#define __GPIO_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "xgpio.h"

#include "doomgeneric.h"

extern XGpio btn_switch_device;

int initGpio();
int readSwitches();
int readButtons();

#ifdef __cplusplus
}
#endif

#endif
