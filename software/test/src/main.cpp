#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"

#include "SysTick.h"
#include "spi.h"
#include "SD.h"                     // Arduino SD card & FAT filesystem library

int initHardware();
void setup(void);
void loop(void);

int initHardware() {
    if (initSysTick() == XST_SUCCESS) {
	    xil_printf("Initialized Systick!\r\n");
    }
    if (initSDCard() == XST_SUCCESS) {
	    xil_printf("Initialized SD Card!\r\n");
    }

	return XST_SUCCESS;
}

void printDirectory(File dir, int numTabs) {
  while (true) {

    File entry =  dir.openNextFile();
    if (! entry) {
      // no more files
      break;
    }
    for (uint8_t i = 0; i < numTabs; i++) {
      xil_printf("\t");
    }
    xil_printf(entry.name());
    if (entry.isDirectory()) {
      xil_printf("/\r\n");
      printDirectory(entry, numTabs + 1);
    } else {
      // files have sizes, directories do not
      xil_printf("\t\t");
      xil_printf("%d\r\n", entry.size());
    }
    entry.close();
  }
}

void setup() {
    if (initHardware() == XST_SUCCESS) {
	    xil_printf("Initialized Hardware!\r\n");
    } else {
	    xil_printf("Failed to initialize hardware!\r\n");
    }

    File root = SD.open("/");
    printDirectory(root, 0);
}

void loop() {
    xil_printf("Timestamp: %dms\r\n", millis());
    delayMilli(1000);
}

int main() {
  	setup();
	while(true) {
		loop();
	}

	return 1; // if program reaches this line, something went wrong
}
