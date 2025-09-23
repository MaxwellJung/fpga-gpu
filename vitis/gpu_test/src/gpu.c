#include "gpu.h"

#include <stdint.h>
#include <string.h>
#include <xil_types.h>

#include "xstatus.h"
#include "xil_io.h"

#include "xaxidma.h"

XAxiDma_Config* dma_cfg_ptr;
XAxiDma dma_device;

int initGPU() {
    Xil_Out32(COMMAND0_REG_ADDR, 0);
    Xil_Out32(COMMAND0_REG_ADDR+4, 0);
    Xil_Out32(COMMAND0_REG_ADDR+8, 0);
    Xil_Out32(CONTROL_REG_ADDR, 0);

    // Local variables
	XStatus status = 0;

	// Look up hardware configuration for device
	dma_cfg_ptr = XAxiDma_LookupConfig(DMA_DEVICE_ID);
	if (!dma_cfg_ptr)
	{
		xil_printf("ERROR! No hardware configuration found for AXI DMA with device id %d.\r\n", DMA_DEVICE_ID);
		return XST_FAILURE;
	}

	// Initialize driver
	status = XAxiDma_CfgInitialize(&dma_device, dma_cfg_ptr);
	if (status != XST_SUCCESS)
	{
		xil_printf("ERROR! Initialization of AXI DMA failed with %d\r\n", status);
		return XST_FAILURE;
	}

	// Test for Scatter Gather
	if (XAxiDma_HasSg(&dma_device))
	{
		xil_printf("ERROR! Device configured as SG mode.\r\n");
		return XST_FAILURE;
	}

	// Disable all interrupts for both channels
	XAxiDma_IntrDisable(&dma_device, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&dma_device, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Reset DMA
	XAxiDma_Reset(&dma_device);
	while (!XAxiDma_ResetIsDone(&dma_device));

	xil_printf("Note: MaxTransferLen=%d\r\n", dma_device.TxBdRing.MaxTransferLen);

	return XST_SUCCESS;
}

XStatus dma_send(UINTPTR buffer, u32 length) {
	XStatus status;

	Xil_DCacheFlushRange(buffer, length);

	status = XAxiDma_SimpleTransfer(&dma_device, buffer, length, XAXIDMA_DMA_TO_DEVICE);

	if (status != XST_SUCCESS)
		xil_printf("ERROR: failed to kick off MM2S transfer\r\n");

	while (XAxiDma_Busy(&dma_device, XAXIDMA_DMA_TO_DEVICE));

	if ((XAxiDma_ReadReg(dma_device.RegBase, XAXIDMA_TX_OFFSET+XAXIDMA_SR_OFFSET) & XAXIDMA_IRQ_ERROR_MASK) != 0) {
		xil_printf("ERROR: AXI DMA returned an error during the MM2S transfer\r\n");
		return XST_FAILURE;
	}

	Xil_DCacheFlushRange((UINTPTR)buffer, length);

	return XST_SUCCESS;
}

XStatus dma_receive(UINTPTR buffer, u32 length) {
	XStatus status;

	Xil_DCacheFlushRange(buffer, length);

	status = XAxiDma_SimpleTransfer(&dma_device, buffer, length, XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: failed to kick off S2MM transfer\r\n");
		return XST_FAILURE;
	}

	u32 busy = 0;
	do {
		busy = XAxiDma_Busy(&dma_device, XAXIDMA_DEVICE_TO_DMA);
	} while (busy);

	if ((XAxiDma_ReadReg(dma_device.RegBase, XAXIDMA_RX_OFFSET+XAXIDMA_SR_OFFSET) & XAXIDMA_IRQ_ERROR_MASK) != 0) {
		xil_printf("ERROR: AXI DMA returned an error during the S2MM transfer\r\n");
		return XST_FAILURE;
	}

	Xil_DCacheFlushRange(buffer, length);

	return XST_SUCCESS;
}

void testGPU() {
	static const u32 BUFFER_SIZE_BYTES = 400*300;
	u8 *buffer = malloc(BUFFER_SIZE_BYTES);

    for (int i = 0; i < 256; i++) {
        // Wait if busy
        while(Xil_In8(STATUS_REG_ADDR));

        // move(i, i)
        Xil_Out32(COMMAND0_REG_ADDR, 1);
        Xil_Out16(COMMAND0_REG_ADDR+4, i);
        Xil_Out16(COMMAND0_REG_ADDR+6, i);

        // pixelValue(i)
        Xil_Out32(COMMAND1_REG_ADDR, 9);
        Xil_Out8(COMMAND1_REG_ADDR+4, i);

        // rect(RESOLUTION_X-1-i, RESOLUTION_Y-1-i)
        Xil_Out32(COMMAND2_REG_ADDR, 7);
        Xil_Out16(COMMAND2_REG_ADDR+4, RESOLUTION_X-1-i);
        Xil_Out16(COMMAND2_REG_ADDR+6, RESOLUTION_Y-1-i);

        // Execute 3 commands
        Xil_Out8(CONTROL_REG_ADDR+1, 3);
        Xil_Out8(CONTROL_REG_ADDR, 1);

        // DMA transfer buffer to heap address=400*i
	    memset(buffer, i, BUFFER_SIZE_BYTES);
        Xil_Out32(HEAP_WR_START_ADDR, 400*i);
        dma_send((UINTPTR)buffer, BUFFER_SIZE_BYTES-400*i);
    }
}
