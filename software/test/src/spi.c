#include "spi.h"

#include "xparameters.h"	/* XPAR parameters */
#include "xspi.h"		/* SPI device driver */
#include "xspi_l.h"
#include "xil_printf.h"

#define BUFFER_SIZE		12
typedef u8 DataBuffer[BUFFER_SIZE];
u8 ReadBuffer[BUFFER_SIZE];
u8 WriteBuffer[BUFFER_SIZE];

XSpi sd_spi;

int initSDSpi(XSpi *SpiInstancePtr, UINTPTR BaseAddress) {
	int Status;
    XSpi_Config *ConfigPtr;

	/*
	 * Initialize the SPI driver so that it is  ready to use.
	 */
	ConfigPtr = XSpi_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		return XST_DEVICE_NOT_FOUND;
	}

	Status = XSpi_CfgInitialize(SpiInstancePtr, ConfigPtr,
				    ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XSpi_SelfTest(SpiInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Run loopback test only in case of standard SPI mode.
	 */
	if (SpiInstancePtr->SpiMode != XSP_STANDARD_MODE) {
		return XST_SUCCESS;
	}

	/*
	 * Set the Spi device as a master and manual slave select mode.
	 */
	Status = XSpi_SetOptions(SpiInstancePtr, 
        XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

  	beginTransaction(&sd_spi);

	return XST_SUCCESS;
}

void setCsLow(XSpi *SpiInstancePtr) {
	XSpi_SetSlaveSelect(SpiInstancePtr, 0b1);
}

void setCsHigh(XSpi *SpiInstancePtr) {
	XSpi_SetSlaveSelect(SpiInstancePtr, 0b0);
}

void beginTransaction(XSpi *SpiInstancePtr) {
	/*
	 * Start the SPI driver so that the device is enabled.
	 */
	XSpi_Start(SpiInstancePtr);
	XSpi_IntrGlobalDisable(SpiInstancePtr);
}

void endTransaction(XSpi *SpiInstancePtr) {
	/*
	 * Stop the SPI driver so that the device is disabled.
	 */
	while (SpiInstancePtr->IsBusy); // wait until not busy
	XSpi_Stop(SpiInstancePtr);
}

// transfer data out on output line and in on input line
uint8_t transfer(XSpi *SpiInstancePtr, u8 write_data) {
	u8 read_data;
    int status = XSpi_Transfer(SpiInstancePtr, &write_data, &read_data, 1);
    // xil_printf("transfer %x result: %d\r\n", write_data, status);
	return read_data;
}

int testSPI(XSpi *SpiInstancePtr) {
	u32 Count;
	u8 Test;

	/*
	 * Initialize the write buffer with pattern to write, initialize the
	 * read buffer to zero so it can be verified after the read, the
	 * Test value that is added to the unique value allows the value to be
	 * changed in a debug environment.
	 */
	Test = 0x10;
	for (Count = 0; Count < BUFFER_SIZE; Count++) {
		WriteBuffer[Count] = (u8)(Count + Test);
		ReadBuffer[Count] = 0;
	}

	/*
	 * Transmit the data.
	 */
    setCsLow(SpiInstancePtr);
    beginTransaction(SpiInstancePtr);
	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);
    endTransaction(SpiInstancePtr);
    setCsHigh(SpiInstancePtr);

	/*
	 * Compare the data received with the data that was transmitted.
	 */
	for (Count = 0; Count < BUFFER_SIZE; Count++) {
	    xil_printf("write: %d, read: %d\r\n", WriteBuffer[Count], ReadBuffer[Count]);
		if (WriteBuffer[Count] != ReadBuffer[Count]) {
			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}