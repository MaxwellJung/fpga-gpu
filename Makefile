SRC_DIRS := ./src
BUILD_DIR := ./build
SIM_DIR := $(BUILD_DIR)/sim
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')

all: gpu_sim counter_sim vivado synthesize implement bitstream


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

counter_sim: $(SIM_DIR)/counter_dump.vcd

$(SIM_DIR)/counter_dump.vcd: $(BUILD_DIR)/tb_counter.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/tb_counter.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_counter $^

gpu_sim: $(SIM_DIR)/gpu_dump.vcd

$(SIM_DIR)/gpu_dump.vcd: $(BUILD_DIR)/tb_gpu.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/tb_gpu.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_gpu $^

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
