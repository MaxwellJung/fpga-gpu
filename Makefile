SRC_DIRS := ./src
BUILD_DIR := ./build
SIM_DIR := ./sim
SRC_FILES := $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v')

all: counter

counter: $(SIM_DIR)/counter_dump.vcd

$(SIM_DIR)/counter_dump.vcd: $(BUILD_DIR)/tb_counter.vvp
	vvp $^
	mkdir -p $(dir $@)
	mv dump.vcd $@

$(BUILD_DIR)/tb_counter.vvp: $(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog -o $@ -s tb_counter $^

.PHONY: clean
clean:
	rm -r $(BUILD_DIR) ${SIM_DIR}
