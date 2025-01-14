SRC_DIRS := ./hdl
BUILD_DIR := ./build
SIM_DIR := $(BUILD_DIR)/sim
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')

all: gpu


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

gpu: FORCE
	mkdir -p $(dir $(BUILD_DIR)/gpu_sim.vvp)
	iverilog -o $(BUILD_DIR)/gpu_sim.vvp -s tb_gpu ./hdl/testbench/tb_gpu.sv ./hdl/design/gpu.v \
	./hdl/design/palette.sv ./hdl/design/latency.sv ./hdl/design/vga.sv ./hdl/design/counter.sv \
	./hdl/design/ram.sv
	vvp $(BUILD_DIR)/gpu_sim.vvp
	mkdir -p $(dir $(SIM_DIR)/gpu_sim.vcd)
	mv dump.vcd $(SIM_DIR)/gpu_sim.vcd

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)

FORCE: ;
