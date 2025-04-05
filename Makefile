SRC_DIR := ./src
# Find all the ASM, C, and C++ files we want to compile
# Note the single quotes around the * expressions. The shell will incorrectly expand these otherwise, but we want to send the * directly to the find command.
SRCS := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c' -or -name '*.s')

BUILD_DIR := ./build
# Replace SRC_DIR with BUILD_DIR and appends .o to every src file
# As an example, ./src/hello.cpp turns into ./build/hello.cpp.o
OBJS := $(SRCS:$(SRC_DIR)/%=$(BUILD_DIR)/%.o)

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

all: verilator-sim icarus-sim
verilator: ${VERILATOR_OBJ_DIR}/Gpu.mk
verilator-sim: ${VERILATOR_OBJ_DIR}/Gpu.exe
icarus: $(BUILD_DIR)/TbGpu.vvp
icarus-sim: $(SIM_DIR)/TbGpu.vcd

############## RISCV Compiler ##############
${BUILD_DIR}/%.mem: ${BUILD_DIR}/%.bin
	hexdump -v -e '1/4 "%08X" "\n"' $< > $@

${BUILD_DIR}/%.bin: ${BUILD_DIR}/%.elf
	${RISCV-GNU-TOOLCHAIN}-objcopy $< -O binary $@

${BUILD_DIR}/%.elf: $(OBJS)
	${RISCV-GNU-TOOLCHAIN}-ld -b elf32-littleriscv -T ${SRC_DIR}/linker.ld $^ -o $@
	${RISCV-GNU-TOOLCHAIN}-objdump -D -S -t $@ > ${BUILD_DIR}/$(basename $(notdir $@))-objdump.txt

# Build step for C source
$(BUILD_DIR)/%.c.o: $(BUILD_DIR)/%.c.s
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} $< -o $@

$(BUILD_DIR)/%.c.s: $(SRC_DIR)/%.c
	mkdir -p $(dir $@)
	${RISCV-GNU-TOOLCHAIN}-gcc ${GCC-OPTIONS} -S $< -o $@

# Build step for assembly source
$(BUILD_DIR)/%.s.o: ${SRC_DIR}/%.s
	mkdir -p $(dir $@)
	${RISCV-GNU-TOOLCHAIN}-as ${GCC-TARGET} $< -o $@


############## Verilator ##############
${VERILATOR_OBJ_DIR}/%.exe: ${VERILATOR_OBJ_DIR}/%.mk
	make -C ${VERILATOR_OBJ_DIR} -f V$(notdir $<)

${VERILATOR_OBJ_DIR}/%.mk: ${HDL_FILES} ${BUILD_DIR}/gpu_firmware.mem
	verilator ${VFLAGS} \
		-Ihdl -Ihdl/processor -Ihdl/processor/controlpath -Ihdl/processor/datapath -Ihdl/processor/memory \
		-cc $(basename $(notdir $@)).sv --exe ${TESTBENCH_DIR}/$(basename $(notdir $@))_sim.cpp -o $(basename $(notdir $@)) \
		-CFLAGS "${SDL_CFLAGS}" -LDFLAGS "${SDL_LDFLAGS}"


############## Icarus ##############
$(SIM_DIR)/%.vcd: $(BUILD_DIR)/%.vvp
	mkdir -p $(dir $@)
	vvp $<

$(BUILD_DIR)/%.vvp: $(TESTBENCH_DIR)/%.sv $(HDL_FILES) ${BUILD_DIR}/gpu_firmware.mem
	mkdir -p $(dir $@)
	iverilog -o $(BUILD_DIR)/$(basename $(notdir $@)).vvp \
		-g2005-sv \
		-s $(basename $(notdir $@)) $< \
		$(HDL_FILES)

############## Vivado ##############
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

.SECONDARY:
