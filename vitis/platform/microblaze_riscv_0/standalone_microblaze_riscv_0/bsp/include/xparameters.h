#ifndef XPARAMETERS_H   /* prevent circular inclusions */
#define XPARAMETERS_H   /* by using protection macros */

#define XPAR_XBRAM_NUM_INSTANCES 1

/* Definitions for peripheral AXI_BRAM_CTRL_0 */
#define XPAR_AXI_BRAM_CTRL_0_COMPATIBLE "xlnx,axi-bram-ctrl-4.1"
#define XPAR_AXI_BRAM_CTRL_0_BASEADDR 0xc0000000
#define XPAR_AXI_BRAM_CTRL_0_HIGHADDR 0xc001ffff
#define XPAR_AXI_BRAM_CTRL_0_BASEADDR_1 0xc0000000
#define XPAR_AXI_BRAM_CTRL_0_BRAM_DATA_WIDTH 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_ECC_PRESENT 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_FAULT_INJECTION_PRESENT 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_CORRECTABLE_FAILING_REGISTERS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_CORRECTABLE_FAILING_DATA_REGS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_UNCORRECTABLE_FAILING_REGISTERS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_UNCORRECTABLE_FAILING_DATA_REGS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_ECC_STATUS_INTERRUPT_PRESENT 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_CORRECTABLE_COUNTER_BITS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_ECC_ON_OFF_REGISTER 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_ECC_ON_OFF_RESET_VALUE 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_WRITE_ACCESS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_MEM_BASE_ADDRESS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_MEM_HIGH_ADDRESS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_MEM_CTRL_BASE_ADDRESS 0x0
#define XPAR_AXI_BRAM_CTRL_0_BRAM_MEM_CTRL_HIGH_ADDRESS 0x0

/* Canonical definitions for peripheral AXI_BRAM_CTRL_0 */
#define XPAR_XBRAM_0_BASEADDR 0xc0000000
#define XPAR_XBRAM_0_HIGHADDR 0xc001ffff
#define XPAR_XBRAM_0_BRAM_DATA_WIDTH 0x0
#define XPAR_XBRAM_0_BRAM_ECC_PRESENT 0x0
#define XPAR_XBRAM_0_BRAM_FAULT_INJECTION_PRESENT 0x0
#define XPAR_XBRAM_0_BRAM_CORRECTABLE_FAILING_REGISTERS 0x0
#define XPAR_XBRAM_0_BRAM_CORRECTABLE_FAILING_DATA_REGS 0x0
#define XPAR_XBRAM_0_BRAM_UNCORRECTABLE_FAILING_REGISTERS 0x0
#define XPAR_XBRAM_0_BRAM_UNCORRECTABLE_FAILING_DATA_REGS 0x0
#define XPAR_XBRAM_0_BRAM_ECC_STATUS_INTERRUPT_PRESENT 0x0
#define XPAR_XBRAM_0_BRAM_CORRECTABLE_COUNTER_BITS 0x0
#define XPAR_XBRAM_0_BRAM_ECC_ON_OFF_REGISTER 0x0
#define XPAR_XBRAM_0_BRAM_ECC_ON_OFF_RESET_VALUE 0x0
#define XPAR_XBRAM_0_BRAM_WRITE_ACCESS 0x0
#define XPAR_XBRAM_0_BRAM_MEM_BASE_ADDRESS 0x0
#define XPAR_XBRAM_0_BRAM_MEM_HIGH_ADDRESS 0x0
#define XPAR_XBRAM_0_BRAM_MEM_CTRL_BASE_ADDRESS 0x0
#define XPAR_XBRAM_0_BRAM_MEM_CTRL_HIGH_ADDRESS 0x0
#define XPAR_XBRAM_0_COMPATIBLE "xlnx,axi-bram-ctrl-4.1"

#define XPAR_XGPIO_NUM_INSTANCES 2

/* Definitions for peripheral AXI_GPIO_0 */
#define XPAR_AXI_GPIO_0_COMPATIBLE "xlnx,axi-gpio-2.0"
#define XPAR_AXI_GPIO_0_BASEADDR 0x40000000
#define XPAR_AXI_GPIO_0_HIGHADDR 0x4000ffff
#define XPAR_AXI_GPIO_0_INTERRUPT_PRESENT 0x0
#define XPAR_AXI_GPIO_0_IS_DUAL 0x0
#define XPAR_AXI_GPIO_0_GPIO_WIDTH 0x10

/* Canonical definitions for peripheral AXI_GPIO_0 */
#define XPAR_XGPIO_0_BASEADDR 0x40000000
#define XPAR_XGPIO_0_HIGHADDR 0x4000ffff
#define XPAR_XGPIO_0_COMPATIBLE "xlnx,axi-gpio-2.0"
#define XPAR_XGPIO_0_GPIO_WIDTH 0x10
#define XPAR_XGPIO_0_INTERRUPT_PRESENT 0x0
#define XPAR_XGPIO_0_IS_DUAL 0x0

/* Definitions for peripheral AXI_GPIO_1 */
#define XPAR_AXI_GPIO_1_COMPATIBLE "xlnx,axi-gpio-2.0"
#define XPAR_AXI_GPIO_1_BASEADDR 0x40010000
#define XPAR_AXI_GPIO_1_HIGHADDR 0x4001ffff
#define XPAR_AXI_GPIO_1_INTERRUPT_PRESENT 0x0
#define XPAR_AXI_GPIO_1_IS_DUAL 0x0
#define XPAR_AXI_GPIO_1_GPIO_WIDTH 0x10

/* Canonical definitions for peripheral AXI_GPIO_1 */
#define XPAR_XGPIO_1_BASEADDR 0x40010000
#define XPAR_XGPIO_1_HIGHADDR 0x4001ffff
#define XPAR_XGPIO_1_COMPATIBLE "xlnx,axi-gpio-2.0"
#define XPAR_XGPIO_1_GPIO_WIDTH 0x10
#define XPAR_XGPIO_1_INTERRUPT_PRESENT 0x0
#define XPAR_XGPIO_1_IS_DUAL 0x0

#define XPAR_XINTC_NUM_INSTANCES 1

/* Definitions for peripheral MICROBLAZE_RISCV_0_AXI_INTC */
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_COMPATIBLE "xlnx,axi-intc-4.1"
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_BASEADDR 0x41200000
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_HIGHADDR 0x4120ffff
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_KIND_OF_INTR 0x3
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_IS_FAST 0x1
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_IVAR_RST_VAL 0x10
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_NUM_INTR_INPUTS 0x2
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_ADDR_WIDTH 0x20
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_OPTIONS 0x0
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_INTCTYPE 0x0
#define XPAR_MICROBLAZE_RISCV_0_AXI_INTC_HANDLER_TABLE 0x0

/* Canonical definitions for peripheral MICROBLAZE_RISCV_0_AXI_INTC */
#define XPAR_XINTC_0_BASEADDR 0x41200000
#define XPAR_XINTC_0_HIGHADDR 0x4120ffff
#define XPAR_XINTC_0_HANDLER_TABLE 0x0
#define XPAR_XINTC_0_ADDR_WIDTH 0x20
#define XPAR_XINTC_0_COMPATIBLE "xlnx,axi-intc-4.1"
#define XPAR_XINTC_0_IS_FAST 0x1
#define XPAR_XINTC_0_IVAR_RST_VAL 0x10
#define XPAR_XINTC_0_INTCTYPE 0x0
#define XPAR_XINTC_0_KIND_OF_INTR 0x3
#define XPAR_XINTC_0_NUM_INTR_INPUTS 0x2
#define XPAR_XINTC_0_OPTIONS 0x0

#define XPAR_XUARTLITE_NUM_INSTANCES 1

/* Definitions for peripheral AXI_UARTLITE_0 */
#define XPAR_AXI_UARTLITE_0_COMPATIBLE "xlnx,axi-uartlite-2.0"
#define XPAR_AXI_UARTLITE_0_BASEADDR 0x40600000
#define XPAR_AXI_UARTLITE_0_HIGHADDR 0x4060ffff
#define XPAR_AXI_UARTLITE_0_BAUDRATE 0x2580
#define XPAR_AXI_UARTLITE_0_USE_PARITY 0x0
#define XPAR_AXI_UARTLITE_0_ODD_PARITY 0x0
#define XPAR_AXI_UARTLITE_0_DATA_BITS 0x8

/* Canonical definitions for peripheral AXI_UARTLITE_0 */
#define XPAR_XUARTLITE_0_BASEADDR 0x40600000
#define XPAR_XUARTLITE_0_HIGHADDR 0x4060ffff
#define XPAR_XUARTLITE_0_BAUDRATE 0x2580
#define XPAR_XUARTLITE_0_COMPATIBLE "xlnx,axi-uartlite-2.0"
#define XPAR_XUARTLITE_0_DATA_BITS 0x8
#define XPAR_XUARTLITE_0_ODD_PARITY 0x0
#define XPAR_XUARTLITE_0_USE_PARITY 0x0

/*  BOARD definition */
#define XPS_BOARD_NEXYS-A7-100T

#define XPAR_MIG_0_BASEADDRESS 0x80000000
#define XPAR_MIG_0_HIGHADDRESS 0x87ffffff
#define XPAR_LMB_BRAM_0_BASEADDRESS 0x0
#define XPAR_LMB_BRAM_0_HIGHADDRESS 0x7fff
#define XPAR_AXI_BRAM_0_BASEADDRESS 0xc0000000
#define XPAR_AXI_BRAM_0_HIGHADDRESS 0xc0001fff

/*  CPU parameters definition */
#define XPAR_CPU_CORE_CLOCK_FREQ_HZ 81247969
#define XPAR_MICROBLAZE_RISCV_USE_DCACHE 1
#define XPAR_MICROBLAZE_RISCV_DCACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_RISCV_DCACHE_BYTE_SIZE 16384
#define XPAR_MICROBLAZE_RISCV_USE_ICACHE 1
#define XPAR_MICROBLAZE_RISCV_ICACHE_LINE_LEN 4
#define XPAR_MICROBLAZE_RISCV_ICACHE_BYTE_SIZE 16384
#define XPAR_MICROBLAZE_RISCV_USE_FPU 0
#define XPAR_MICROBLAZE_RISCV_USE_MMU 0
#define XPAR_MICROBLAZE_RISCV_USE_SLEEP 0
#define XPAR_MICROBLAZE_RISCV_FAULT_TOLERANT 0
#define XPAR_MICROBLAZE_RISCV_D_LMB 1
#define XPAR_MICROBLAZE_RISCV_USE_BRANCH_TARGET_CACHE 0
#define XPAR_MICROBLAZE_RISCV_BRANCH_TARGET_CACHE_SIZE 0

#define STDOUT_BASEADDRESS 0x40600000
#define STDIN_BASEADDRESS 0x40600000

/* Number of SLRs */
#define NUMBER_OF_SLRS 0x1

/* Device ID */
#define XPAR_DEVICE_ID "7a100t"

#endif  /* end of protection macro */