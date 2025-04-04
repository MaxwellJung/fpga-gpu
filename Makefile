HDL_DIR := ./hdl
BUILD_DIR := ./build
SIM_DIR := $(BUILD_DIR)/sim
SRC_DIR := ./src
DATA_DIR := ./data
HDL_FILES := $(shell find $(HDL_DIR) -name '*.sv' -or -name '*.v')

RISCV-GNU-TOOLCHAIN = riscv64-unknown-elf
# RISCV-GNU-TOOLCHAIN = riscv64-unknown-linux-gnu
GCC-TARGET = -march=rv32i -mabi=ilp32
GCC-OPTIONS = -O1 -g ${GCC-TARGET}

all: gpu_firmware

gpu_firmware: FORCE
	mkdir -p $(BUILD_DIR)
# compile into assembly
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${BUILD_DIR}/main.asm -S ${SRC_DIR}/main.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${BUILD_DIR}/graphics.asm -S ${SRC_DIR}/graphics.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${BUILD_DIR}/framebuffer.asm -S ${SRC_DIR}/framebuffer.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${BUILD_DIR}/palette.asm -S ${SRC_DIR}/palette.c
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -o ${BUILD_DIR}/io_reg.asm -S ${SRC_DIR}/io_reg.c
# compile into object
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/startup.o ${SRC_DIR}/startup.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/main.o ${BUILD_DIR}/main.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/graphics.o ${BUILD_DIR}/graphics.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/framebuffer.o ${BUILD_DIR}/framebuffer.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/palette.o ${BUILD_DIR}/palette.asm
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} -o ${BUILD_DIR}/io_reg.o ${BUILD_DIR}/io_reg.asm
# link objects into elf
	${RISCV-GNU-TOOLCHAIN}-ld -b elf32-littleriscv -T ${SRC_DIR}/gpu_firmware.ld -o ${BUILD_DIR}/gpu_firmware.elf ${BUILD_DIR}/*.o
# convert to mem file
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary ${BUILD_DIR}/gpu_firmware.elf ${BUILD_DIR}/gpu_firmware.bin
	hexdump -v -e '1/4 "%08X" "\n"' ${BUILD_DIR}/gpu_firmware.bin > ${BUILD_DIR}/gpu_firmware.mem
	cp ${BUILD_DIR}/gpu_firmware.mem ${DATA_DIR}/gpu_mem_init.mem
# disassemble for debug
	${RISCV-GNU-TOOLCHAIN}-objdump -D -S -t ${BUILD_DIR}/gpu_firmware.elf > ${BUILD_DIR}/gpu_firmware-objdump.txt

riscvtest: riscvtest.mem

riscvtest.mem: riscvtest.bin
	hexdump -v -e '1/4 "%08X" "\n"' ${BUILD_DIR}/riscvtest.bin > ${BUILD_DIR}/riscvtest.mem

riscvtest.bin: riscvtest.out
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary --only-section=.text ${BUILD_DIR}/riscvtest.out ${BUILD_DIR}/riscvtest.bin

riscvtest.out: ${SRC_DIR}/riscvtest.asm
	mkdir -p $(BUILD_DIR)
	${RISCV-GNU-TOOLCHAIN}-as -march=rv32i ${SRC_DIR}/riscvtest.asm -o ${BUILD_DIR}/riscvtest.out
	${RISCV-GNU-TOOLCHAIN}-objdump -d ${BUILD_DIR}/riscvtest.out > ${BUILD_DIR}/riscvtest-objdump.txt

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


# Icarus

gpu: gpu_firmware
	mkdir -p $(dir $(BUILD_DIR)/gpu_sim.vvp)
	iverilog -g2005-sv -o $(BUILD_DIR)/gpu_sim.vvp \
		-s TbGpu \
		./testbench/tb_gpu.sv \
		$(HDL_FILES)
	vvp $(BUILD_DIR)/gpu_sim.vvp
	mkdir -p $(dir $(SIM_DIR)/gpu_sim.vcd)
	mv dump.vcd $(SIM_DIR)/gpu_sim.vcd

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)

FORCE: ;
