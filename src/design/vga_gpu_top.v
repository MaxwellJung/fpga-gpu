module vga_gpu_top #(
    parameter H_VIS_AREA_PXL = 200,
    parameter H_FRONT_PORCH_PXL = 10,
    parameter H_SYNC_PULSE_PXL = 32,
    parameter H_BACK_PORCH_PXL = 22,
    parameter H_WHOLE_LINE_PXL = H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL + H_BACK_PORCH_PXL,
    parameter H_NUM_BITS = 9, // ceil(log2(H_WHOLE_LINE_PXL))

    parameter V_VIS_AREA_PXL =  600,
    parameter V_FRONT_PORCH_PXL =  1,
    parameter V_SYNC_PULSE_PXL =  4,
    parameter V_BACK_PORCH_PXL =  23,
    parameter V_WHOE_FRAME_PXL =  V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL + V_BACK_PORCH_PXL,
    parameter V_NUM_BITS = 10, // ceil(log2(V_WHOE_FRAME_PXL))

    parameter COLOR_BITS = 4
) (
    input wire clk,
    input wire aresetn,

    output wire [COLOR_BITS-1:0] VGA_R,
    output wire [COLOR_BITS-1:0] VGA_G,
    output wire [COLOR_BITS-1:0] VGA_B,

    output wire VGA_HS,
    output wire VGA_VS
);

    vga_gpu #(
        .H_VIS_AREA_PXL(H_VIS_AREA_PXL),
        .H_FRONT_PORCH_PXL(H_FRONT_PORCH_PXL),
        .H_SYNC_PULSE_PXL(H_SYNC_PULSE_PXL),
        .H_BACK_PORCH_PXL(H_BACK_PORCH_PXL),
        .H_WHOLE_LINE_PXL(H_WHOLE_LINE_PXL),
        .H_NUM_BITS(H_NUM_BITS),

        .V_VIS_AREA_PXL(V_VIS_AREA_PXL),
        .V_FRONT_PORCH_PXL(V_FRONT_PORCH_PXL),
        .V_SYNC_PULSE_PXL(V_SYNC_PULSE_PXL),
        .V_BACK_PORCH_PXL(V_BACK_PORCH_PXL),
        .V_WHOE_FRAME_PXL(V_WHOE_FRAME_PXL),
        .V_NUM_BITS(V_NUM_BITS),

        .COLOR_BITS()
    ) gpu0 (
        .clk(clk),
        .aresetn(aresetn),

        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B),

        .h_sync(VGA_HS),
        .v_sync(VGA_VS)
    );

endmodule
