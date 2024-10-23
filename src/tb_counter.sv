module tb_counter ();
    localparam NUM_BITS = 10;

    logic clk;
    logic rst;
    logic [NUM_BITS-1:0] out;

    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rst <= 1;

        #20 rst <= 0;
        #80 rst <= 1;
        #50 rst <= 0;

        #20 $finish;
    end

endmodule
