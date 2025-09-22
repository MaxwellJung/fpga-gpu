module gpu #(
    parameter FIRMWARE_FILE = "build/firmware/gputest.mem"
) (
    input  logic gpu_clk,
    input  logic reset,

    // IO registers interface
    input  logic        io_reg_port_a_clk,
    input  logic        io_reg_port_a_reset,
    input  logic [11:0] io_reg_port_a_addr,
    output logic [31:0] io_reg_port_a_rd_data,
    input  logic [31:0] io_reg_port_a_rd_en,
    input  logic [31:0] io_reg_port_a_wr_data,
    input  logic [3:0]  io_reg_port_a_wr_en,

    // AXI-Stream interface to heap memory
    input  logic        axis_clk,
    input  logic        axis_aresetn,

    input  logic [31:0] axis_tdata,
    input  logic [0:0]  axis_tkeep,
    input  logic        axis_tlast,
    input  logic        axis_tvalid,
    output logic        axis_tready,

    // vga interface
    input  logic       vga_clk,
    output logic       vga_hs,
    output logic       vga_vs,
    output logic [3:0] vga_r,
    output logic [3:0] vga_g,
    output logic [3:0] vga_b
);

    //#########################################################################
    // Display Processor
    //#########################################################################

    logic                                 dp_inst_reset;
    logic [31:0]                          dp_inst_addr;
    logic [31:0]                          dp_inst_rd_data;
    logic                                 dp_inst_rd_en;

    logic [31:0]                          dp_data_addr;
    logic [31:0]                          dp_data_rd_data;
    logic [31:0]                          dp_data_wr_data;
    logic [3:0]                           dp_data_wr_en;

    display_processor display_processor_inst_0 (
        .clk                   (gpu_clk),
        .reset                 (reset),
        // Instruction memory
        .dp_inst_reset         (dp_inst_reset),
        .dp_inst_addr          (dp_inst_addr),
        .dp_inst_rd_data       (dp_inst_rd_data),
        .dp_inst_rd_en         (dp_inst_rd_en),
        // Data memory
        .dp_data_addr          (dp_data_addr),
        .dp_data_rd_data       (dp_data_rd_data),
        .dp_data_wr_data       (dp_data_wr_data),
        .dp_data_wr_en         (dp_data_wr_en)
    );

    main_memory #(
        .INIT_FILE         (FIRMWARE_FILE)
    ) main_memory_inst_0 (
        .clk               (gpu_clk),

        .port_a_reset      (dp_inst_reset),
        .port_a_address    (dp_inst_addr),
        .port_a_rd_data    (dp_inst_rd_data),
        .port_a_rd_en      (dp_inst_rd_en),
        .port_a_wr_data    ('0),
        .port_a_wr_en      ('0),

        .port_b_reset      ('0),
        .port_b_address    (main_mem_port_b_address),
        .port_b_rd_data    (main_mem_port_b_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (main_mem_port_b_wr_data),
        .port_b_wr_en      (main_mem_port_b_wr_en)
    );

    logic [31:0] main_mem_port_b_address;
    logic [31:0] main_mem_port_b_rd_data;
    logic [31:0] main_mem_port_b_wr_data;
    logic  [3:0] main_mem_port_b_wr_en;

    logic [31:0] heap_mem_port_b_address;
    logic [31:0] heap_mem_port_b_rd_data;
    logic [31:0] heap_mem_port_b_wr_data;
    logic  [3:0] heap_mem_port_b_wr_en;

    logic [31:0] io_reg_port_b_address;
    logic [31:0] io_reg_port_b_rd_data;
    logic [31:0] io_reg_port_b_wr_data;
    logic  [3:0] io_reg_port_b_wr_en;

    logic [31:0] color_pal_port_b_address;
    logic [31:0] color_pal_port_b_rd_data;
    logic [31:0] color_pal_port_b_wr_data;
    logic  [3:0] color_pal_port_b_wr_en;

    logic [31:0] framebuffer_port_b_address;
    logic [31:0] framebuffer_port_b_rd_data;
    logic [31:0] framebuffer_port_b_wr_data;
    logic  [3:0] framebuffer_port_b_wr_en;

    data_bus_arbitrator data_bus_arbitrator_inst_0 (
        .clk                     (gpu_clk),
        .reset                   (reset),

        .dp_data_addr            (dp_data_addr),
        .dp_data_rd_data         (dp_data_rd_data),
        .dp_data_wr_data         (dp_data_wr_data),
        .dp_data_wr_en           (dp_data_wr_en),

        .main_mem_port_b_address (main_mem_port_b_address),
        .main_mem_port_b_rd_data (main_mem_port_b_rd_data),
        .main_mem_port_b_wr_data (main_mem_port_b_wr_data),
        .main_mem_port_b_wr_en   (main_mem_port_b_wr_en),

        .heap_mem_port_b_address (heap_mem_port_b_address),
        .heap_mem_port_b_rd_data (heap_mem_port_b_rd_data),
        .heap_mem_port_b_wr_data (heap_mem_port_b_wr_data),
        .heap_mem_port_b_wr_en   (heap_mem_port_b_wr_en),

        .io_reg_port_b_address   (io_reg_port_b_address),
        .io_reg_port_b_rd_data   (io_reg_port_b_rd_data),
        .io_reg_port_b_wr_data   (io_reg_port_b_wr_data),
        .io_reg_port_b_wr_en     (io_reg_port_b_wr_en),

        .color_pal_port_b_address (color_pal_port_b_address),
        .color_pal_port_b_rd_data (color_pal_port_b_rd_data),
        .color_pal_port_b_wr_data (color_pal_port_b_wr_data),
        .color_pal_port_b_wr_en   (color_pal_port_b_wr_en),

        .framebuffer_port_b_address (framebuffer_port_b_address),
        .framebuffer_port_b_rd_data (framebuffer_port_b_rd_data),
        .framebuffer_port_b_wr_data (framebuffer_port_b_wr_data),
        .framebuffer_port_b_wr_en   (framebuffer_port_b_wr_en)
    );

    //#########################################################################
    // AXI-Stream interface to heap memory
    //#########################################################################

    // heap memory interface
    logic        heap_mem_port_a_clk;
    logic [10:0] heap_mem_port_a_addr;
    logic [31:0] heap_mem_port_a_wr_data;
    logic [3:0]  heap_mem_port_a_wr_en;

    axis_to_memory axis_to_memory_inst_0 (
        .axis_clk               (axis_clk),
        .axis_aresetn           (axis_aresetn),

        .axis_tdata             (axis_tdata),
        .axis_tkeep             (axis_tkeep),
        .axis_tlast             (axis_tlast),
        .axis_tvalid            (axis_tvalid),
        .axis_tready            (axis_tready),

        .heap_mem_port_a_clk     (heap_mem_port_a_clk),
        .heap_mem_port_a_addr    (heap_mem_port_a_addr),
        .heap_mem_port_a_wr_data (heap_mem_port_a_wr_data),
        .heap_mem_port_a_wr_en   (heap_mem_port_a_wr_en)
    );

    heap_memory heap_memory_inst_0 (
        .port_a_clk        (heap_mem_port_a_clk),
        .port_a_addr       (heap_mem_port_a_addr),
        .port_a_wr_data    (heap_mem_port_a_wr_data),
        .port_a_wr_en      (heap_mem_port_a_wr_en),

        .port_b_clk        (gpu_clk),
        .port_b_address    (heap_mem_port_b_address),
        .port_b_rd_data    (heap_mem_port_b_rd_data),
        .port_b_wr_data    (heap_mem_port_b_wr_data),
        .port_b_wr_en      (heap_mem_port_b_wr_en)
    );

    //#########################################################################
    // IO Registers
    //#########################################################################

    io_registers io_registers_inst_0 (
        // CPU side interface
        .port_a_clk        (io_reg_port_a_clk),
        .port_a_reset      (io_reg_port_a_reset),
        .port_a_address    (io_reg_port_a_addr),
        .port_a_rd_data    (io_reg_port_a_rd_data),
        .port_a_rd_en      (io_reg_port_a_rd_en),
        .port_a_wr_data    (io_reg_port_a_wr_data),
        .port_a_wr_en      (io_reg_port_a_wr_en),
        // GPU side interface
        .port_b_clk        (gpu_clk),
        .port_b_reset      ('0),
        .port_b_address    (io_reg_port_b_address),
        .port_b_rd_data    (io_reg_port_b_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (io_reg_port_b_wr_data),
        .port_b_wr_en      (io_reg_port_b_wr_en)
    );

    //#########################################################################
    // Video Out
    //#########################################################################

    logic [$clog2(400*300)-1:0] pixel_index;
    logic pixel_index_valid;
    logic h_sync;
    logic v_sync;

    vga_controller vga_controller (
        .clk               (vga_clk),
        .reset             (reset),

        .pixel_index       (pixel_index),
        .pixel_index_valid (pixel_index_valid),

        .h_sync            (h_sync),
        .v_sync            (v_sync)
    );

    
    logic [7:0] color_index;
    logic       color_index_valid;

    framebuffer framebuffer_inst_0 (
        // vga interface
        .vga_clk           (vga_clk),
        .vga_reset         (reset),
        .pixel_index       (pixel_index),
        .pixel_index_valid (pixel_index_valid),
        .color_index       (color_index),
        .color_index_valid (color_index_valid),

        // display processor interface
        .port_b_clk        (gpu_clk),
        .port_b_reset      ('0),
        .port_b_address    (framebuffer_port_b_address),
        .port_b_rd_data    (framebuffer_port_b_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (framebuffer_port_b_wr_data),
        .port_b_wr_en      (framebuffer_port_b_wr_en)
    );

    logic [11:0] vga_rgb;
    color_palette color_palette_inst_0 (
        // vga interface
        .vga_clk           (vga_clk),
        .vga_reset         (reset),
        .color_index       (color_index),
        .color_index_valid (color_index_valid),
        .rgb               (vga_rgb),

        // display processor interface
        .port_b_clk        (gpu_clk),
        .port_b_reset      ('0),
        .port_b_address    (color_pal_port_b_address),
        .port_b_rd_data    (color_pal_port_b_rd_data),
        .port_b_rd_en      ('1),
        .port_b_wr_data    (color_pal_port_b_wr_data),
        .port_b_wr_en      (color_pal_port_b_wr_en)
    );

    always_comb begin
        {vga_r, vga_g, vga_b} = vga_rgb;
    end

    // Delay hsync and vsync by latency of framebuffer & color palette read (3 cycles)
    ff_chain #(
        .LENGTH(3),
        .WIDTH(2)
    ) ff_chain_inst_0 (
        .clk   (vga_clk),
        .reset (reset),

        .in    ({h_sync, v_sync}),
        .out   ({vga_hs, vga_vs})
    );

endmodule
