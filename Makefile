SRC_DIRS := ./src
BUILD_DIR := ./build
SIM_DIR := $(BUILD_DIR)/sim
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')

all: vga_sim counter_sim vivado synthesize implement bitstream


# Vivado

vivado:
	vivado -mode batch -source ./scripts/init_vivado.tcl	

block_design:
	vivado -mode batch -source ./scripts/export_bd.tcl

synthesize:
	vivado -mode batch -source ./scripts/synthesize.tcl

implement:
	vivado -mode batch -source ./scripts/implement.tcl

bitstream: 
	vivado -mode batch -source ./scripts/bitstream.tcl


# Icarus

gpu_sim: $(SIM_DIR)/gpu_sim.vcd

$(SIM_DIR)/gpu_sim.vcd: $(BUILD_DIR)/gpu_sim.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/gpu_sim.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_gpu $^

counter_sim: $(SIM_DIR)/counter_sim.vcd

$(SIM_DIR)/counter_sim.vcd: $(BUILD_DIR)/counter_sim.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/counter_sim.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_counter $^

vga_sim: $(SIM_DIR)/vga_sim.vcd

$(SIM_DIR)/vga_sim.vcd: $(BUILD_DIR)/vga_sim.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/vga_sim.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_vga $^

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
