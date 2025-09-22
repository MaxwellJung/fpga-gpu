import display_processor_pkg::*;

module display_processor (
    input logic clk,
    input logic reset,

    // Instruction memory
    output logic        dp_inst_reset,
    output logic [31:0] dp_inst_addr,
    input  logic [31:0] dp_inst_rd_data,
    output logic        dp_inst_rd_en,

    // Data memory
    output logic [31:0] dp_data_addr,
    input  logic [31:0] dp_data_rd_data,
    output logic [31:0] dp_data_wr_data,
    output logic [3:0]  dp_data_wr_en
);

    RISCVCore RISCVCore_inst_0 (
        .clk                (clk),
        .reset              (reset),
        // instr bus
        .inst_reset         (dp_inst_reset),
        .inst_addr          (dp_inst_addr),
        .inst_rd_data       (dp_inst_rd_data),
        .inst_rd_en         (dp_inst_rd_en),
        // data bus
        .dbus_addr          (dp_data_addr),
        .dbus_rd_data       (dp_data_rd_data),
        .dbus_wr_data       (dp_data_wr_data),
        .dbus_wr_en         (dp_data_wr_en),
        // framebuffer
        .fb_wr_pxl_x        (),
        .fb_wr_pxl_y        (),
        .fb_wr_pxl_value    (),
        .fb_wr_en           ()
    );

endmodule
