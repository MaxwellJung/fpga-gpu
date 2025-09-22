package io_registers_pkg;
    localparam NUM_COMMANDS = 4;

    //#########################################################################
    // Register definitions
    //#########################################################################
    typedef struct packed {
        logic [15:0] reserved;
        logic [7:0] finished_commands;
        logic [7:0] busy;
    } status_reg_t;

    typedef struct packed {
        logic [15:0] reserved;
        logic [7:0] queue_length;
        logic [7:0] start;
    } control_reg_t;

    typedef struct packed {
        // pad to 4 words (128-bits) for future proofing/alignment
        logic [31:0] reserved;
        
        logic [7:0] arg7;
        logic [7:0] arg6;
        logic [7:0] arg5;
        logic [7:0] arg4;

        logic [7:0] arg3;
        logic [7:0] arg2;
        logic [7:0] arg1;
        logic [7:0] arg0;

        logic [31:0] op_code;
    } command_reg_t;

    //#########################################################################
    // IO register memory map
    //#########################################################################
    typedef struct packed {
        // array of graphics commands
        command_reg_t [NUM_COMMANDS-1:0] command_list;

        // 16 32-bit registers
        logic [31:0][12:0] reserved;
        logic [31:0] heap_wr_start_addr; // Heap write start address for AXIS
        control_reg_t control; // controls GPU
        status_reg_t status; // GPU status
    } io_register_file_t;

    localparam IO_REGISTERS_BYTES = $bits(io_register_file_t)/8;
    localparam WORD_BYTES = 4;
    localparam WORD_COUNT = IO_REGISTERS_BYTES/WORD_BYTES;

    //#########################################################################
    // function to select i-th 32-bit word from IO register file
    //#########################################################################
    function logic [31:0] get_word(io_register_file_t io_register_file, int word_index);
        case (word_index)
            0 : return io_register_file.status;
            1 : return io_register_file.control;
            2 : return io_register_file.heap_wr_start_addr;

            16 : return io_register_file.command_list[0][0+:32];
            17 : return io_register_file.command_list[0][32+:32];
            18 : return io_register_file.command_list[0][64+:32];
            19 : return io_register_file.command_list[0][96+:32];

            20 : return io_register_file.command_list[1][0+:32];
            21 : return io_register_file.command_list[1][32+:32];
            22 : return io_register_file.command_list[1][64+:32];
            23 : return io_register_file.command_list[1][96+:32];

            24 : return io_register_file.command_list[2][0+:32];
            25 : return io_register_file.command_list[2][32+:32];
            26 : return io_register_file.command_list[2][64+:32];
            27 : return io_register_file.command_list[2][96+:32];

            28 : return io_register_file.command_list[3][0+:32];
            29 : return io_register_file.command_list[3][32+:32];
            30 : return io_register_file.command_list[3][64+:32];
            31 : return io_register_file.command_list[3][96+:32];
        endcase
    endfunction
endpackage

import io_registers_pkg::*;

module io_registers (
    // CPU interface
    input  logic port_a_clk,
    input  logic port_a_reset,
    input  logic [$clog2(IO_REGISTERS_BYTES)-1:0] port_a_address,
    output logic [8*WORD_BYTES-1:0] port_a_rd_data,
    input  logic port_a_rd_en,
    input  logic [8*WORD_BYTES-1:0] port_a_wr_data,
    input  logic [WORD_BYTES-1:0] port_a_wr_en,

    // Heap write start address for axis_to_memory
    output logic [31:0] heap_wr_start_addr,

    // GPU interface
    input  logic port_b_clk,
    input  logic port_b_reset,
    input  logic [$clog2(IO_REGISTERS_BYTES)-1:0] port_b_address,
    output logic [8*WORD_BYTES-1:0] port_b_rd_data,
    input  logic port_b_rd_en,
    input  logic [8*WORD_BYTES-1:0] port_b_wr_data,
    input  logic [WORD_BYTES-1:0] port_b_wr_en
);
    io_register_file_t io_register_file;

    logic [$clog2(WORD_COUNT)-1:0] port_a_word_index, port_b_word_index;
    logic [$clog2(WORD_BYTES)-1:0] port_a_byte_index, port_b_byte_index;
    assign {port_a_word_index, port_a_byte_index} = port_a_address;
    assign {port_b_word_index, port_b_byte_index} = port_b_address;

    int i;
    always_ff @(posedge port_a_clk) begin
        if (port_a_reset)
            port_a_rd_data <= '0;
        else
            if (port_a_rd_en) begin
                port_a_rd_data <= get_word(io_register_file, port_a_word_index);
            end
        
        // CPU can only write to control register or command registers
        for (i = 0; i < WORD_BYTES; i++) begin
            if (port_a_wr_en[i]) begin
                case (port_a_word_index)
                    1  : io_register_file.control[i*8 +: 8]            <= port_a_wr_data[i*8 +: 8];
                    2  : io_register_file.heap_wr_start_addr[i*8 +: 8] <= port_a_wr_data[i*8 +: 8];

                    16 : io_register_file.command_list[0][   i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    17 : io_register_file.command_list[0][32+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    18 : io_register_file.command_list[0][64+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    19 : io_register_file.command_list[0][96+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];

                    20 : io_register_file.command_list[1][   i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    21 : io_register_file.command_list[1][32+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    22 : io_register_file.command_list[1][64+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    23 : io_register_file.command_list[1][96+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];

                    24 : io_register_file.command_list[2][   i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    25 : io_register_file.command_list[2][32+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    26 : io_register_file.command_list[2][64+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    27 : io_register_file.command_list[2][96+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];

                    28 : io_register_file.command_list[3][   i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    29 : io_register_file.command_list[3][32+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    30 : io_register_file.command_list[3][64+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                    31 : io_register_file.command_list[3][96+i*8 +: 8] <= port_a_wr_data[i*8 +: 8];
                endcase
            end
        end
    end

    assign heap_wr_start_addr = io_register_file.heap_wr_start_addr;

    int j;
    always_ff @(posedge port_b_clk) begin
        if (port_b_reset)
            port_b_rd_data <= '0;
        else
            // [TODO] Probably needs to be double-flopped to resolve CDC
            if (port_b_rd_en) begin
                port_b_rd_data <= get_word(io_register_file, port_b_word_index);
            end

        // GPU can only write to status register
        for (j = 0; j < WORD_BYTES; j++) begin
            if (port_b_wr_en[j]) begin
                case (port_b_word_index)
                    0 : io_register_file.status[i*8 +: 8] <= port_b_wr_data[i*8 +: 8];
                endcase
            end
        end
    end

endmodule
