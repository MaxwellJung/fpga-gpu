SRC_DIR := ./src
# Find all the ASM, C, and C++ files we want to compile
# Note the single quotes around the * expressions. The shell will incorrectly expand these otherwise, but we want to send the * directly to the find command.
SRCS := $(shell basename $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c' -or -name '*.s'))

BUILD_DIR := ./build
# Prepends BUILD_DIR and appends .o to every src file
# As an example, ./your_dir/hello.cpp turns into ./build/./your_dir/hello.cpp.o
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

DATA_DIR := ./data

HDL_DIR := ./hdl
HDL_FILES := $(shell find $(HDL_DIR) -name '*.sv' -or -name '*.v')
VERILATOR_OBJ_DIR := ./obj_dir
SIM_DIR := $(BUILD_DIR)/sim
TESTBENCH_DIR := ./testbench

VFLAGS := -j 0 -Wall -Wno-PINCONNECTEMPTY -Wno-UNUSEDSIGNAL -O3 --x-assign fast --x-initial fast --noassert
SDL_CFLAGS := `sdl2-config --cflags`
SDL_LDFLAGS := `sdl2-config --libs`

RISCV-GNU-TOOLCHAIN = riscv64-unknown-elf
# RISCV-GNU-TOOLCHAIN = riscv64-unknown-linux-gnu
GCC-TARGET = -march=rv32i -mabi=ilp32
GCC-OPTIONS = -O1 -g ${GCC-TARGET}

all: ${VERILATOR_OBJ_DIR}/Gpu $(SIM_DIR)/gpu_sim.vcd

# RISCV Compiler
${BUILD_DIR}/%.mem: ${BUILD_DIR}/%.bin
	hexdump -v -e '1/4 "%08X" "\n"' ${BUILD_DIR}/$(basename $(notdir $@)).bin > ${BUILD_DIR}/$(basename $(notdir $@)).mem

${BUILD_DIR}/%.bin: ${BUILD_DIR}/%.elf
	${RISCV-GNU-TOOLCHAIN}-objcopy -O binary ${BUILD_DIR}/$(basename $(notdir $@)).elf ${BUILD_DIR}/$(basename $(notdir $@)).bin

${BUILD_DIR}/gpu_firmware.elf: $(OBJS)
	${RISCV-GNU-TOOLCHAIN}-ld -b elf32-littleriscv -T ${SRC_DIR}/gpu_firmware.ld -o ${BUILD_DIR}/gpu_firmware.elf $^
	${RISCV-GNU-TOOLCHAIN}-objdump -D -S -t ${BUILD_DIR}/gpu_firmware.elf > ${BUILD_DIR}/gpu_firmware-objdump.txt

# Build step for C source
$(BUILD_DIR)/%.c.o: $(SRC_DIR)/%.c
	mkdir -p $(BUILD_DIR)
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -S $< -o $(BUILD_DIR)/$(basename $(notdir $<)).s
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} $(BUILD_DIR)/$(basename $(notdir $<)).s -o $@

# Build step for assembly source
$(BUILD_DIR)/%.s.o: ${SRC_DIR}/%.s
	mkdir -p $(BUILD_DIR)
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} $< -o $@


# Verilator
${VERILATOR_OBJ_DIR}/%: ${BUILD_DIR}/gpu_firmware.mem ${VERILATOR_OBJ_DIR}/%.mk
	make -C ${VERILATOR_OBJ_DIR} -f V$(notdir $(shell echo $(word 2,$^)))

${VERILATOR_OBJ_DIR}/%.mk: ${HDL_FILES}
	verilator ${VFLAGS} \
		-Ihdl -Ihdl/processor -Ihdl/processor/controlpath -Ihdl/processor/datapath -Ihdl/processor/memory \
		-cc $(basename $(notdir $@)).sv --exe ${TESTBENCH_DIR}/$(basename $(notdir $@))_sim.cpp -o $(basename $(notdir $@)) \
		-CFLAGS "${SDL_CFLAGS}" -LDFLAGS "${SDL_LDFLAGS}"

# Icarus
$(SIM_DIR)/gpu_sim.vcd: ${BUILD_DIR}/gpu_firmware.mem FORCE
	mkdir -p $(dir $@)
	iverilog -o $(BUILD_DIR)/gpu_sim.vvp \
		-g2005-sv \
		-s TbGpu ./testbench/TbGpu.sv \
		$(HDL_FILES)
	vvp $(BUILD_DIR)/gpu_sim.vvp
	mkdir -p $(dir $(SIM_DIR)/gpu_sim.vcd)
	mv dump.vcd $(SIM_DIR)/gpu_sim.vcd

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

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) ${VERILATOR_OBJ_DIR}

FORCE: ;
