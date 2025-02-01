#ifndef __SPI_H
#define __SPI_H

#ifdef __cplusplus
extern "C" {
#endif

#include "xspi.h"		/* SPI device driver */

int initSDSpi(XSpi *SpiInstancePtr, UINTPTR BaseAddress);
void setCsLow(XSpi *SpiInstancePtr);
void setCsHigh(XSpi *SpiInstancePtr);
void beginTransaction(XSpi *SpiInstancePtr);
void endTransaction(XSpi *SpiInstancePtr);
uint8_t transfer(XSpi *SpiInstancePtr, u8 write_data);
int testSPI(XSpi *SpiInstancePtr);

extern XSpi sd_spi;

#ifdef __cplusplus
}
#endif

#endif /* __SPI_H */
