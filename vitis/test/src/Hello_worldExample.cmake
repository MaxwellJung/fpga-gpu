set(UARTLITE_NUM_DRIVER_INSTANCES "axi_uartlite_0")
set(UARTLITE0_PROP_LIST "0x40600000")
list(APPEND TOTAL_UARTLITE_PROP_LIST UARTLITE0_PROP_LIST)
set(UARTNS550_NUM_DRIVER_INSTANCES "")
set(UARTPS_NUM_DRIVER_INSTANCES "")
set(UARTPSV_NUM_DRIVER_INSTANCES "")
set(DDR lmb_bram_0)
set(mig_0 "0x80000000;0x8000000")
set(axi_bram_0 "0xc0000000;0x20000")
set(lmb_bram_0 "0x0;0x4000")
set(TOTAL_MEM_CONTROLLERS "lmb_bram_0;mig_0;axi_bram_0")
set(MEMORY_SECTION "MEMORY
{
	mig_0 : ORIGIN = 0x80000000, LENGTH = 0x8000000
	axi_bram_0 : ORIGIN = 0xc0000000, LENGTH = 0x20000
	lmb_bram_0 : ORIGIN = 0x0, LENGTH = 0x4000
}")
set(STACK_SIZE 0x400)
set(HEAP_SIZE 0x800)
