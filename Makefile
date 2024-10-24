SRC_DIRS := ./src
BUILD_DIR := ./build
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')

all: gpu_sim

gpu_sim: $(BUILD_DIR)/gpu_dump.vcd

$(BUILD_DIR)/gpu_dump.vcd: $(BUILD_DIR)/tb_gpu.vvp
	vvp $^
	mv dump.vcd $(BUILD_DIR)/gpu_dump.vcd

$(BUILD_DIR)/tb_gpu.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_gpu $(SRC_FILES)

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
