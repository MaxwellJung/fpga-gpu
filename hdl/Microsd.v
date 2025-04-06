module MicroSD (
    input   wire reset,
    input   wire sck,
    input   wire cs,
    input   wire mosi,
    output  wire miso,

    output  wire sd_vdd,
    output  wire sd_clk,
    output  wire sd_dat3,
    output  wire sd_cmd,
    input   wire sd_dat0
);

    assign sd_vdd = reset;
    assign sd_clk = sck;
    assign sd_dat3 = cs;
    assign sd_cmd = mosi;
    assign miso = sd_dat0;

endmodule
