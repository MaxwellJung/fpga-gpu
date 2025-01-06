#include "SysTick.h"

#include "xtmrctr.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xinterrupt_wrap.h"

#define XTMRCTR_BASEADDRESS XPAR_XTMRCTR_0_BASEADDR
#define TIMER_CNTR_0	0

#define TIMING_INTERVAL_SECONDS 0.001 // 1 millisecond
#define RESET_VALUE ((TIMING_INTERVAL_SECONDS * XPAR_XTMRCTR_0_CLOCK_FREQUENCY) - 2)

static void TmrCtrDisableIntr(XTmrCtr *InstancePtr);
static void TmrCtr_FastHandler(void) __attribute__ ((fast_interrupt));
static void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber);

XTmrCtr TimerCounterInst;   /* The instance of the Timer Counter */
XTmrCtr *TmrCtrInstancePtr = &TimerCounterInst;
UINTPTR BaseAddr = XTMRCTR_BASEADDRESS;
u8 TmrCtrNumber = TIMER_CNTR_0;

volatile uint32_t us_elapsed;

//******************************************************************************************
// Initialize SysTick
// generate 1 tick/interrupt every 1us
//******************************************************************************************	
int initSysTick(void){
	int Status;
	/*
	 * Initialize the timer counter so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */
	Status = XTmrCtr_Initialize(TmrCtrInstancePtr, BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly, use the 1st timer in the device (0)
	 */
	Status = XTmrCtr_SelfTest(TmrCtrInstancePtr, TmrCtrNumber);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the timer counter to the interrupt subsystem such that
	 * interrupts can occur.  This function is application specific.
	 */
	Status = XSetupInterruptSystem(TmrCtrInstancePtr, (void *)TmrCtr_FastHandler, \
				       TmrCtrInstancePtr->Config.IntrId, TmrCtrInstancePtr->Config.IntrParent, \
				       XINTERRUPT_DEFAULT_PRIORITY);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the handler for the timer counter that will be called from the
	 * interrupt context when the timer expires, specify a pointer to the
	 * timer counter driver instance as the callback reference so the
	 * handler is able to access the instance data
	 */
	XTmrCtr_SetHandler(TmrCtrInstancePtr, TimerCounterHandler,
			   TmrCtrInstancePtr);

	/*
	 * Enable the interrupt of the timer counter so interrupts will occur
	 * and use auto reload mode such that the timer counter will reload
	 * itself automatically and continue repeatedly, without this option
	 * it would expire once only
	 */
	XTmrCtr_SetOptions(TmrCtrInstancePtr, TmrCtrNumber,
			   XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION | XTC_DOWN_COUNT_OPTION);

	/*
	 * Set a reset value for the timer counter such that it will expire
	 * eariler than letting it roll over from 0, the reset value is loaded
	 * into the timer counter when it is started
	 */
	XTmrCtr_SetResetValue(TmrCtrInstancePtr, TmrCtrNumber, RESET_VALUE);

	us_elapsed = 0;

	/*
	 * Start the timer counter such that it's incrementing by default,
	 * then wait for it to timeout a number of times
	 */
	XTmrCtr_Start(TmrCtrInstancePtr, TmrCtrNumber);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
* This function is the handler which performs processing for the timer counter.
* It is called from an interrupt context such that the amount of processing
* performed should be minimized.  It is called when the timer counter expires
* if interrupts are enabled.
*
* This handler provides an example of how to handle timer counter interrupts
* but is application specific.
*
* @param	CallBackRef is a pointer to the callback function
* @param	TmrCtrNumber is the number of the timer to which this
*		handler is associated with.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber)
{
	XTmrCtr *InstancePtr = (XTmrCtr *)CallBackRef;

	us_elapsed += 1000000 * TIMING_INTERVAL_SECONDS;
}
	
//******************************************************************************************
// Delay in ms
//******************************************************************************************
void delayMilli(uint32_t ms){
	uint32_t future_time;

	future_time = us_elapsed + 1000*ms;
	while (us_elapsed < future_time);
}

//******************************************************************************************
// Delay in us
//******************************************************************************************
void delayMicro(uint32_t us){
	uint32_t future_time;

	future_time = us_elapsed + us;
	while (us_elapsed < future_time);
}

uint32_t millis(void){
	return us_elapsed/1000;
}

uint32_t micros(void){
	return us_elapsed;
}

/*****************************************************************************/
/**
*
* This function disables the interrupts for the Timer.
*
* @param	IntcInstancePtr is a reference to the Interrupt Controller
*		driver Instance.
* @param	IntrId is XPAR_<INTC_instance>_<Timer_instance>_VEC_ID
*		value from xparameters.h.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void TmrCtrDisableIntr(XTmrCtr *TmrCtrInstancePtr) {
	XDisableIntrId(TmrCtrInstancePtr->Config.IntrId, TmrCtrInstancePtr->Config.IntrParent);
}

/*****************************************************************************/
/**
*
* This is the Fast Interrupt Handler for the Timer.
*
* @return	None.
*
* @note		None.
*
****************************************************************************/
void TmrCtr_FastHandler(void) {

	/* Call the TmrCtr Interrupt handler */
	XTmrCtr_InterruptHandler(&TimerCounterInst);
}