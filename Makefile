HDL_DIR := ./hdl
BUILD_DIR := ./build
SIM_DIR := ./sim
PKG_FILES := ./hdl/processor/display_processor_pkg.sv
HDL_FILES := $(shell find $(HDL_DIR) -name '*.sv' -or -name '*.v' -or -name '*.svh')
SIM_FILES := $(shell find $(SIM_DIR) -name '*.sv' -or -name '*.v')
VERILATOR_BUILD_DIR := $(BUILD_DIR)/verilator
VERILATOR-NO-WARNINGS := -Wno-MODDUP -Wno-INITIALDLY -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND -Wno-MULTIDRIVEN -Wno-TIMESCALEMOD -Wno-PINMISSING
VERILATOR-FLAGS := --binary -j 0 $(VERILATOR-NO-WARNINGS) --trace --Mdir $(VERILATOR_BUILD_DIR)

SRC_DIR := ./src
DATA_DIR := ./data
SRC_FILES := $(shell find $(SRC_DIR) -name '*.c')
FIRMWARE_BUILD_DIR := $(BUILD_DIR)/firmware
RISCV-GNU-TOOLCHAIN = riscv64-unknown-elf
# RISCV-GNU-TOOLCHAIN = riscv64-unknown-linux-gnu
GCC-TARGET = -march=rv32i -mabi=ilp32
GCC-OPTIONS = -O1 -g ${GCC-TARGET}

all: gpu_tb.vcd

gpu_firmware: $(SRC_FILES)
	mkdir -p $(FIRMWARE_BUILD_DIR)
# compile into assembly
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/main.asm -S ${SRC_DIR}/main.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/graphics.asm -S ${SRC_DIR}/graphics.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/framebuffer.asm -S ${SRC_DIR}/framebuffer.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/palette.asm -S ${SRC_DIR}/palette.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/io_reg.asm -S ${SRC_DIR}/io_reg.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${FIRMWARE_BUILD_DIR}/heap.asm -S ${SRC_DIR}/heap.c
# compile into object
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/startup.o ${SRC_DIR}/startup.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/main.o ${FIRMWARE_BUILD_DIR}/main.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/graphics.o ${FIRMWARE_BUILD_DIR}/graphics.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/framebuffer.o ${FIRMWARE_BUILD_DIR}/framebuffer.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/palette.o ${FIRMWARE_BUILD_DIR}/palette.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/io_reg.o ${FIRMWARE_BUILD_DIR}/io_reg.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${FIRMWARE_BUILD_DIR}/heap.o ${FIRMWARE_BUILD_DIR}/heap.asm
# link objects into elf
	${RISCV-GNU-TOOLCHAIN}-ld -b elf32-littleriscv -T ${SRC_DIR}/gpu_firmware.ld -o ${FIRMWARE_BUILD_DIR}/gpu_firmware.elf ${FIRMWARE_BUILD_DIR}/*.o
# convert to mem file
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary ${FIRMWARE_BUILD_DIR}/gpu_firmware.elf ${FIRMWARE_BUILD_DIR}/gpu_firmware.bin
	hexdump -v -e '1/4 "%08X" "\n"' ${FIRMWARE_BUILD_DIR}/gpu_firmware.bin > ${FIRMWARE_BUILD_DIR}/gpu_firmware.mem
	cp ${FIRMWARE_BUILD_DIR}/gpu_firmware.mem ${DATA_DIR}/gpu_mem_init.mem
# disassemble for debug
	${RISCV-GNU-TOOLCHAIN}-objdump -D -S -t ${FIRMWARE_BUILD_DIR}/gpu_firmware.elf > ${FIRMWARE_BUILD_DIR}/gpu_firmware-objdump.txt

riscvtest: riscvtest.mem

riscvtest.mem: riscvtest.bin
	hexdump -v -e '1/4 "%08X" "\n"' ${FIRMWARE_BUILD_DIR}/riscvtest.bin > ${FIRMWARE_BUILD_DIR}/riscvtest.mem

riscvtest.bin: riscvtest.out
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary --only-section=.text ${FIRMWARE_BUILD_DIR}/riscvtest.out ${FIRMWARE_BUILD_DIR}/riscvtest.bin

riscvtest.out: ${SRC_DIR}/riscvtest.asm
	mkdir -p $(FIRMWARE_BUILD_DIR)
	${RISCV-GNU-TOOLCHAIN}-as -march=rv32i ${SRC_DIR}/riscvtest.asm -o ${FIRMWARE_BUILD_DIR}/riscvtest.out
	${RISCV-GNU-TOOLCHAIN}-objdump -d ${FIRMWARE_BUILD_DIR}/riscvtest.out > ${FIRMWARE_BUILD_DIR}/riscvtest-objdump.txt

# Vivado

vivado: FORCE
	vivado -mode batch -source ./scripts/init_vivado.tcl	

block_design: FORCE
	vivado -mode batch -source ./scripts/export_bd.tcl

synthesize: FORCE
	vivado -mode batch -source ./scripts/synthesize.tcl

implement: FORCE
	vivado -mode batch -source ./scripts/implement.tcl

bitstream: FORCE
	vivado -mode batch -source ./scripts/bitstream.tcl


# Verilator
gpu_tb.vcd: $(HDL_FILES) $(SIM_FILES) gpu_firmware
	mkdir -p $(VERILATOR_BUILD_DIR)
	verilator $(VERILATOR-FLAGS) --top-module gpu_tb $(PKG_FILES) $(HDL_FILES) $(SIM_FILES)
	$(VERILATOR_BUILD_DIR)/Vgpu_tb

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)

FORCE: ;
