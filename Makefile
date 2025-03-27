SRC_DIRS := ./hdl
PROCESSOR_SRC_DIRS := ${SRC_DIRS}/processor
BUILD_DIR := ./build
SIM_DIR := $(BUILD_DIR)/sim
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')
PROCESSOR_SRC_FILES := $(shell find $(PROCESSOR_SRC_DIRS) -name '*.sv' -or -name '*.v')
SRC_DIR := ./src
DATA_DIR := ./data
RISCV-GNU-TOOLCHAIN = riscv64-unknown-elf
# RISCV-GNU-TOOLCHAIN = riscv64-unknown-linux-gnu

all: gputest display-processor

gputest: FORCE
	mkdir -p $(BUILD_DIR)
	${RISCV-GNU-TOOLCHAIN}-gcc -o ${SRC_DIR}/gputest.asm -S ${SRC_DIR}/main.c \
		-O1 -g -march=rv32i -mabi=ilp32

	${RISCV-GNU-TOOLCHAIN}-as -o ${BUILD_DIR}/gputest.o ${SRC_DIR}/gputest.asm \
		-march=rv32i -mabi=ilp32 
	${RISCV-GNU-TOOLCHAIN}-as -o ${BUILD_DIR}/startup.o ${SRC_DIR}/startup.asm \
		-march=rv32i -mabi=ilp32

	${RISCV-GNU-TOOLCHAIN}-ld -o ${BUILD_DIR}/gputest.elf ${BUILD_DIR}/gputest.o ${BUILD_DIR}/startup.o \
		--format=elf32-littleriscv --script ${SRC_DIR}/gputest.ld
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary ${BUILD_DIR}/gputest.elf ${BUILD_DIR}/gputest.bin
	hexdump -e '1/4 "%08X" "\n"' ${BUILD_DIR}/gputest.bin > ${BUILD_DIR}/gputest.mem
	
	${RISCV-GNU-TOOLCHAIN}-objdump -D -S -t ${BUILD_DIR}/gputest.elf > ${BUILD_DIR}/gputest-objdump.txt

riscvtest: riscvtest.mem

riscvtest.mem: riscvtest.bin
	hexdump -e '1/4 "%08X" "\n"' ${BUILD_DIR}/riscvtest.bin > ${BUILD_DIR}/riscvtest.mem

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

display-processor: FORCE
	mkdir -p $(dir $(BUILD_DIR)/display_processor_sim.vvp)
	iverilog -g2005-sv -o $(BUILD_DIR)/display_processor_sim.vvp \
		-s TbDisplayProcessor \
		./testbench/tb_display_processor.sv \
		$(PROCESSOR_SRC_FILES)
	vvp $(BUILD_DIR)/display_processor_sim.vvp
	mkdir -p $(dir $(SIM_DIR)/display_processor_sim.vcd)
	mv dump.vcd $(SIM_DIR)/display_processor_sim.vcd

gpu: FORCE
	mkdir -p $(dir $(BUILD_DIR)/gpu_sim.vvp)
	iverilog -g2005-sv -o $(BUILD_DIR)/gpu_sim.vvp -s tb_gpu ./testbench/tb_gpu.sv $(SRC_FILES)
	vvp $(BUILD_DIR)/gpu_sim.vvp
	mkdir -p $(dir $(SIM_DIR)/gpu_sim.vcd)
	mv dump.vcd $(SIM_DIR)/gpu_sim.vcd

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)

FORCE: ;
