module VideoController #(
    parameter H_VIS_AREA_PXL = 800,
    parameter H_FRONT_PORCH_PXL = 40,
    parameter H_SYNC_PULSE_PXL = 128,
    parameter H_BACK_PORCH_PXL = 88,

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,

    parameter SYNC_LATENCY = 1, // latency between video controller requesting pixel to palette outputting pixel

    localparam H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    localparam V_WHOLE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,

    parameter RED_BITS = 4,
    parameter GREEN_BITS = 4,
    parameter BLUE_BITS = 4,
    localparam COLOR_BITS = RED_BITS + GREEN_BITS + BLUE_BITS
) (
    input logic clk_i,
    input logic reset_i,

    output logic [$clog2(H_VIS_AREA_PXL)-1:0] fb_rd_x_o,
    output logic [$clog2(V_VIS_AREA_PXL)-1:0] fb_rd_y_o,
    input logic [COLOR_BITS-1:0] color_i,

    output logic vga_hs_o,
    output logic vga_vs_o,

    output logic [RED_BITS-1:0] vga_r_o,
    output logic [GREEN_BITS-1:0] vga_g_o,
    output logic [BLUE_BITS-1:0] vga_b_o
);
    logic [$clog2(H_WHOLE_LINE_PXL)-1:0] h_pxl_count;
    logic [$clog2(V_WHOLE_FRAME_PXL)-1:0] v_pxl_count;
    logic h_visible, v_visible, frame_end;

    VgaTimingGenerator #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),
        
        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),

        .SYNC_LATENCY(SYNC_LATENCY)
    ) vga_timing_generator_0 (
        .clk_i(clk_i),
        .reset_i(reset_i),

        .h_pxl_count_o(h_pxl_count),
        .v_pxl_count_o(v_pxl_count),

        .h_sync_o(vga_hs_o),
        .v_sync_o(vga_vs_o),

        .h_visible_o(h_visible),
        .v_visible_o(v_visible)
    );

    always_ff @(posedge clk_i) begin
        if (reset_i) begin
            fb_rd_x_o <= '0;
            fb_rd_y_o <= '0;
        end else begin
            fb_rd_x_o <= (h_pxl_count < H_VIS_AREA_PXL) ? h_pxl_count>>1 : 0;
            fb_rd_y_o <= (v_pxl_count < V_VIS_AREA_PXL) ? ((V_VIS_AREA_PXL-1) - v_pxl_count)>>1 : 0;
        end
    end

    assign {vga_r_o, vga_g_o, vga_b_o} = (h_visible & v_visible) ? color_i : '0;

endmodule