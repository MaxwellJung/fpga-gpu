module vga_gpu #(
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
    parameter V_NUM_BITS = 10 // ceil(log2(V_WHOE_FRAME_PXL))
) (
    input logic clk,
    input logic rst,

    output logic red,
    output logic green,
    output logic blue,

    output wire h_sync,
    output wire v_sync
);
    
    wire [H_NUM_BITS-1:0] h_pxl_count;
    wire h_counter_end = h_pxl_count >= H_WHOLE_LINE_PXL;
    wire [V_NUM_BITS-1:0] v_pxl_count;
    wire v_counter_end = v_pxl_count >= V_WHOE_FRAME_PXL;

    counter #(
        .NUM_BITS(H_NUM_BITS)
        ) h_pxl_counter (
        .clk(clk),
        .rst(rst || h_counter_end),
        .enable(1'b1),
        .count(h_pxl_count)
    );

    counter #(
        .NUM_BITS(V_NUM_BITS)
        ) v_pxl_counter (
        .clk(h_counter_end),
        .rst(rst || v_counter_end),
        .enable(1'b1),
        .count(v_pxl_count)
    );

    assign h_sync = !(((H_VIS_AREA_PXL + H_FRONT_PORCH_PXL) <= h_pxl_count) 
                  && (h_pxl_count < (H_VIS_AREA_PXL + H_FRONT_PORCH_PXL + H_SYNC_PULSE_PXL)));
    assign v_sync = !(((V_VIS_AREA_PXL + V_FRONT_PORCH_PXL) <= v_pxl_count) 
                  && (v_pxl_count < (V_VIS_AREA_PXL + V_FRONT_PORCH_PXL + V_SYNC_PULSE_PXL)));

endmodule
