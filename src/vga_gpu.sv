module vga_gpu #(
    parameters width = 1920; // ignore for now
    parameters height = 1080; // ignore for now
) (
    input logic clk,
    input logic rst,

    output logic red,
    output logic green,
    output logic blue,

    output logic hsync,
    output logic vsync
);
    
endmodule