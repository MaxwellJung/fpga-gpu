// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Sun Jan 12 23:54:21 2025
// Host        : mint-ssd running 64-bit Linux Mint 21.1
// Command     : write_verilog -force -mode funcsim
//               /home/maxwelljung/programming/fpga-gpu/vivado/doom/doom.gen/sources_1/bd/design_1/ip/design_1_gpu_0_0/design_1_gpu_0_0_sim_netlist.v
// Design      : design_1_gpu_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_gpu_0_0,gpu,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "gpu,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_gpu_0_0
   (gpu_clk_i,
    reset_i,
    bram_clk_o,
    bram_rst_o,
    bram_en_o,
    bram_addr_o,
    bram_dout_i,
    bram_din_o,
    bram_we_o,
    vga_clk_i,
    VGA_R_o,
    VGA_G_o,
    VGA_B_o,
    VGA_HS_o,
    VGA_VS_o);
  input gpu_clk_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_i RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_i, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset_i;
  output bram_clk_o;
  output bram_rst_o;
  output bram_en_o;
  output [31:0]bram_addr_o;
  input [31:0]bram_dout_i;
  output [31:0]bram_din_o;
  output [3:0]bram_we_o;
  input vga_clk_i;
  output [3:0]VGA_R_o;
  output [3:0]VGA_G_o;
  output [3:0]VGA_B_o;
  output VGA_HS_o;
  output VGA_VS_o;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]VGA_B_o;
  wire [3:0]VGA_G_o;
  wire VGA_HS_o;
  wire [3:0]VGA_R_o;
  wire VGA_VS_o;
  wire [17:0]\^bram_addr_o ;
  wire [31:0]bram_dout_i;
  wire gpu_clk_i;
  wire reset_i;
  wire vga_clk_i;

  assign bram_addr_o[31] = \<const0> ;
  assign bram_addr_o[30] = \<const0> ;
  assign bram_addr_o[29] = \<const0> ;
  assign bram_addr_o[28] = \<const0> ;
  assign bram_addr_o[27] = \<const0> ;
  assign bram_addr_o[26] = \<const0> ;
  assign bram_addr_o[25] = \<const0> ;
  assign bram_addr_o[24] = \<const0> ;
  assign bram_addr_o[23] = \<const0> ;
  assign bram_addr_o[22] = \<const0> ;
  assign bram_addr_o[21] = \<const0> ;
  assign bram_addr_o[20] = \<const0> ;
  assign bram_addr_o[19] = \<const0> ;
  assign bram_addr_o[18] = \<const0> ;
  assign bram_addr_o[17:0] = \^bram_addr_o [17:0];
  assign bram_clk_o = gpu_clk_i;
  assign bram_din_o[31] = \<const0> ;
  assign bram_din_o[30] = \<const0> ;
  assign bram_din_o[29] = \<const0> ;
  assign bram_din_o[28] = \<const0> ;
  assign bram_din_o[27] = \<const0> ;
  assign bram_din_o[26] = \<const0> ;
  assign bram_din_o[25] = \<const0> ;
  assign bram_din_o[24] = \<const0> ;
  assign bram_din_o[23] = \<const0> ;
  assign bram_din_o[22] = \<const0> ;
  assign bram_din_o[21] = \<const0> ;
  assign bram_din_o[20] = \<const0> ;
  assign bram_din_o[19] = \<const0> ;
  assign bram_din_o[18] = \<const0> ;
  assign bram_din_o[17] = \<const0> ;
  assign bram_din_o[16] = \<const0> ;
  assign bram_din_o[15] = \<const0> ;
  assign bram_din_o[14] = \<const0> ;
  assign bram_din_o[13] = \<const0> ;
  assign bram_din_o[12] = \<const0> ;
  assign bram_din_o[11] = \<const0> ;
  assign bram_din_o[10] = \<const0> ;
  assign bram_din_o[9] = \<const0> ;
  assign bram_din_o[8] = \<const0> ;
  assign bram_din_o[7] = \<const0> ;
  assign bram_din_o[6] = \<const0> ;
  assign bram_din_o[5] = \<const0> ;
  assign bram_din_o[4] = \<const0> ;
  assign bram_din_o[3] = \<const0> ;
  assign bram_din_o[2] = \<const0> ;
  assign bram_din_o[1] = \<const0> ;
  assign bram_din_o[0] = \<const0> ;
  assign bram_en_o = \<const1> ;
  assign bram_rst_o = reset_i;
  assign bram_we_o[3] = \<const0> ;
  assign bram_we_o[2] = \<const0> ;
  assign bram_we_o[1] = \<const0> ;
  assign bram_we_o[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  design_1_gpu_0_0_gpu inst
       (.VGA_B_o(VGA_B_o),
        .VGA_G_o(VGA_G_o),
        .VGA_HS_o(VGA_HS_o),
        .VGA_R_o(VGA_R_o),
        .VGA_VS_o(VGA_VS_o),
        .bram_addr_o(\^bram_addr_o ),
        .bram_dout_i(bram_dout_i),
        .gpu_clk_i(gpu_clk_i),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
endmodule

(* ORIG_REF_NAME = "Counter" *) 
module design_1_gpu_0_0_Counter
   (E,
    Q,
    D,
    pixel_addr,
    reset_i,
    pixel_index0,
    \pixel_index_reg[7] ,
    \pixel_index_reg[11] ,
    vga_clk_i);
  output [0:0]E;
  output [9:0]Q;
  output [12:0]D;
  output [9:0]pixel_addr;
  input reset_i;
  input [12:0]pixel_index0;
  input [3:0]\pixel_index_reg[7] ;
  input [1:0]\pixel_index_reg[11] ;
  input vga_clk_i;

  wire [12:0]D;
  wire [0:0]E;
  wire [9:0]Q;
  wire \bram_addr_o[11]_INST_0_i_1_n_0 ;
  wire \bram_addr_o[11]_INST_0_i_1_n_1 ;
  wire \bram_addr_o[11]_INST_0_i_1_n_2 ;
  wire \bram_addr_o[11]_INST_0_i_1_n_3 ;
  wire \bram_addr_o[11]_INST_0_i_2_n_0 ;
  wire \bram_addr_o[15]_INST_0_i_1_n_0 ;
  wire \bram_addr_o[15]_INST_0_i_1_n_1 ;
  wire \bram_addr_o[15]_INST_0_i_1_n_2 ;
  wire \bram_addr_o[15]_INST_0_i_1_n_3 ;
  wire \bram_addr_o[7]_INST_0_i_1_n_0 ;
  wire \bram_addr_o[7]_INST_0_i_1_n_1 ;
  wire \bram_addr_o[7]_INST_0_i_1_n_2 ;
  wire \bram_addr_o[7]_INST_0_i_1_n_3 ;
  wire \count_o[10]_i_3_n_0 ;
  wire \count_o[9]_i_5_n_0 ;
  wire \count_o_reg_n_0_[0] ;
  wire [10:0]p_0_in;
  wire [9:0]pixel_addr;
  wire [12:0]pixel_index0;
  wire [1:0]\pixel_index_reg[11] ;
  wire \pixel_index_reg[11]_i_1_n_0 ;
  wire \pixel_index_reg[11]_i_1_n_1 ;
  wire \pixel_index_reg[11]_i_1_n_2 ;
  wire \pixel_index_reg[11]_i_1_n_3 ;
  wire \pixel_index_reg[15]_i_1_n_0 ;
  wire \pixel_index_reg[15]_i_1_n_1 ;
  wire \pixel_index_reg[15]_i_1_n_2 ;
  wire \pixel_index_reg[15]_i_1_n_3 ;
  wire [3:0]\pixel_index_reg[7] ;
  wire reset_i;
  wire reset_i00_out;
  wire vga_clk_i;
  wire [3:0]\NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_bram_addr_o[17]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_pixel_index_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_pixel_index_reg[16]_i_1_O_UNCONNECTED ;

  CARRY4 \bram_addr_o[11]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\bram_addr_o[11]_INST_0_i_1_n_0 ,\bram_addr_o[11]_INST_0_i_1_n_1 ,\bram_addr_o[11]_INST_0_i_1_n_2 ,\bram_addr_o[11]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,D[5],1'b0}),
        .O(pixel_addr[3:0]),
        .S({D[7:6],\bram_addr_o[11]_INST_0_i_2_n_0 ,D[4]}));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_addr_o[11]_INST_0_i_2 
       (.I0(D[5]),
        .O(\bram_addr_o[11]_INST_0_i_2_n_0 ));
  CARRY4 \bram_addr_o[15]_INST_0_i_1 
       (.CI(\bram_addr_o[11]_INST_0_i_1_n_0 ),
        .CO({\bram_addr_o[15]_INST_0_i_1_n_0 ,\bram_addr_o[15]_INST_0_i_1_n_1 ,\bram_addr_o[15]_INST_0_i_1_n_2 ,\bram_addr_o[15]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pixel_addr[7:4]),
        .S(D[11:8]));
  CARRY4 \bram_addr_o[17]_INST_0_i_1 
       (.CI(\bram_addr_o[15]_INST_0_i_1_n_0 ),
        .CO({\NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED [3:2],pixel_addr[9],\NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_bram_addr_o[17]_INST_0_i_1_O_UNCONNECTED [3:1],pixel_addr[8]}),
        .S({1'b0,1'b0,1'b1,D[12]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \bram_addr_o[7]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\bram_addr_o[7]_INST_0_i_1_n_0 ,\bram_addr_o[7]_INST_0_i_1_n_1 ,\bram_addr_o[7]_INST_0_i_1_n_2 ,\bram_addr_o[7]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(pixel_index0[3:0]),
        .O(D[3:0]),
        .S(\pixel_index_reg[7] ));
  LUT1 #(
    .INIT(2'h1)) 
    \count_o[0]_i_1 
       (.I0(\count_o_reg_n_0_[0] ),
        .O(p_0_in[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \count_o[10]_i_1 
       (.I0(reset_i),
        .I1(E),
        .O(reset_i00_out));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_o[10]_i_2 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_o[10]_i_3_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(p_0_in[10]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_o[10]_i_3 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\count_o_reg_n_0_[0] ),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_o[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_o[1]_i_1 
       (.I0(\count_o_reg_n_0_[0] ),
        .I1(Q[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_o[2]_i_1 
       (.I0(\count_o_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_o[3]_i_1 
       (.I0(Q[0]),
        .I1(\count_o_reg_n_0_[0] ),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_o[4]_i_1 
       (.I0(Q[1]),
        .I1(\count_o_reg_n_0_[0] ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_o[5]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(\count_o_reg_n_0_[0] ),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_o[6]_i_1 
       (.I0(\count_o[10]_i_3_n_0 ),
        .I1(Q[5]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_o[7]_i_1 
       (.I0(\count_o[10]_i_3_n_0 ),
        .I1(Q[5]),
        .I2(Q[6]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_o[8]_i_1 
       (.I0(Q[5]),
        .I1(\count_o[10]_i_3_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_o[9]_i_1 
       (.I0(Q[6]),
        .I1(\count_o[10]_i_3_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \count_o[9]_i_2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[6]),
        .I3(\count_o[9]_i_5_n_0 ),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(E));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \count_o[9]_i_5 
       (.I0(Q[8]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(\count_o_reg_n_0_[0] ),
        .I4(Q[3]),
        .I5(Q[0]),
        .O(\count_o[9]_i_5_n_0 ));
  FDRE \count_o_reg[0] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(\count_o_reg_n_0_[0] ),
        .R(reset_i00_out));
  FDRE \count_o_reg[10] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[10]),
        .Q(Q[9]),
        .R(reset_i00_out));
  FDRE \count_o_reg[1] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(Q[0]),
        .R(reset_i00_out));
  FDRE \count_o_reg[2] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(Q[1]),
        .R(reset_i00_out));
  FDRE \count_o_reg[3] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(Q[2]),
        .R(reset_i00_out));
  FDRE \count_o_reg[4] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(Q[3]),
        .R(reset_i00_out));
  FDRE \count_o_reg[5] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(Q[4]),
        .R(reset_i00_out));
  FDRE \count_o_reg[6] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(Q[5]),
        .R(reset_i00_out));
  FDRE \count_o_reg[7] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(Q[6]),
        .R(reset_i00_out));
  FDRE \count_o_reg[8] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[8]),
        .Q(Q[7]),
        .R(reset_i00_out));
  FDRE \count_o_reg[9] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(p_0_in[9]),
        .Q(Q[8]),
        .R(reset_i00_out));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pixel_index_reg[11]_i_1 
       (.CI(\bram_addr_o[7]_INST_0_i_1_n_0 ),
        .CO({\pixel_index_reg[11]_i_1_n_0 ,\pixel_index_reg[11]_i_1_n_1 ,\pixel_index_reg[11]_i_1_n_2 ,\pixel_index_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,pixel_index0[5:4]}),
        .O(D[7:4]),
        .S({pixel_index0[7:6],\pixel_index_reg[11] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pixel_index_reg[15]_i_1 
       (.CI(\pixel_index_reg[11]_i_1_n_0 ),
        .CO({\pixel_index_reg[15]_i_1_n_0 ,\pixel_index_reg[15]_i_1_n_1 ,\pixel_index_reg[15]_i_1_n_2 ,\pixel_index_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[11:8]),
        .S(pixel_index0[11:8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pixel_index_reg[16]_i_1 
       (.CI(\pixel_index_reg[15]_i_1_n_0 ),
        .CO(\NLW_pixel_index_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pixel_index_reg[16]_i_1_O_UNCONNECTED [3:1],D[12]}),
        .S({1'b0,1'b0,1'b0,pixel_index0[12]}));
endmodule

(* ORIG_REF_NAME = "Counter" *) 
module design_1_gpu_0_0_Counter__parameterized0
   (S,
    Q,
    \count_o_reg[6]_0 ,
    \count_o_reg[8]_0 ,
    \count_o_reg[7]_0 ,
    \count_o_reg[9]_0 ,
    reset_i,
    E,
    O,
    pixel_index0__25_carry__1,
    vga_clk_i);
  output [3:0]S;
  output [8:0]Q;
  output [3:0]\count_o_reg[6]_0 ;
  output [1:0]\count_o_reg[8]_0 ;
  output [3:0]\count_o_reg[7]_0 ;
  output [1:0]\count_o_reg[9]_0 ;
  input reset_i;
  input [0:0]E;
  input [3:0]O;
  input [1:0]pixel_index0__25_carry__1;
  input vga_clk_i;

  wire [0:0]E;
  wire [3:0]O;
  wire [8:0]Q;
  wire [3:0]S;
  wire \count_o[6]_i_2_n_0 ;
  wire \count_o[9]_i_4_n_0 ;
  wire \count_o[9]_i_6_n_0 ;
  wire [3:0]\count_o_reg[6]_0 ;
  wire [3:0]\count_o_reg[7]_0 ;
  wire [1:0]\count_o_reg[8]_0 ;
  wire [1:0]\count_o_reg[9]_0 ;
  wire [9:0]p_0_in__0;
  wire [1:0]pixel_index0__25_carry__1;
  wire reset_i;
  wire reset_i0;
  wire vga_clk_i;

  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_o[0]_i_1__0 
       (.I0(Q[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_o[1]_i_1__0 
       (.I0(Q[0]),
        .I1(S[0]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_o[2]_i_1__0 
       (.I0(Q[0]),
        .I1(S[0]),
        .I2(Q[1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_o[3]_i_1__0 
       (.I0(S[0]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_o[4]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(S[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_o[5]_i_1__0 
       (.I0(Q[2]),
        .I1(S[0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_o[6]_i_1__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(\count_o[6]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \count_o[6]_i_2 
       (.I0(S[0]),
        .I1(Q[0]),
        .O(\count_o[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \count_o[7]_i_1__0 
       (.I0(\count_o[9]_i_6_n_0 ),
        .I1(Q[5]),
        .I2(Q[6]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_o[8]_i_1__0 
       (.I0(Q[5]),
        .I1(\count_o[9]_i_6_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(p_0_in__0[8]));
  LUT6 #(
    .INIT(64'hEEEEEEEAAAAAAAAA)) 
    \count_o[9]_i_1__0 
       (.I0(reset_i),
        .I1(Q[8]),
        .I2(Q[7]),
        .I3(\count_o[9]_i_4_n_0 ),
        .I4(Q[6]),
        .I5(E),
        .O(reset_i0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_o[9]_i_3 
       (.I0(Q[6]),
        .I1(\count_o[9]_i_6_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(p_0_in__0[9]));
  LUT6 #(
    .INIT(64'h8888888000000000)) 
    \count_o[9]_i_4 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(\count_o[6]_i_2_n_0 ),
        .I4(Q[2]),
        .I5(Q[5]),
        .O(\count_o[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_o[9]_i_6 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(S[0]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_o[9]_i_6_n_0 ));
  FDRE \count_o_reg[0] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[0]),
        .Q(Q[0]),
        .R(reset_i0));
  FDRE \count_o_reg[1] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[1]),
        .Q(S[0]),
        .R(reset_i0));
  FDRE \count_o_reg[2] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[2]),
        .Q(Q[1]),
        .R(reset_i0));
  FDRE \count_o_reg[3] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[3]),
        .Q(Q[2]),
        .R(reset_i0));
  FDRE \count_o_reg[4] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[4]),
        .Q(Q[3]),
        .R(reset_i0));
  FDRE \count_o_reg[5] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[5]),
        .Q(Q[4]),
        .R(reset_i0));
  FDRE \count_o_reg[6] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[6]),
        .Q(Q[5]),
        .R(reset_i0));
  FDRE \count_o_reg[7] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[7]),
        .Q(Q[6]),
        .R(reset_i0));
  FDRE \count_o_reg[8] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[8]),
        .Q(Q[7]),
        .R(reset_i0));
  FDRE \count_o_reg[9] 
       (.C(vga_clk_i),
        .CE(E),
        .D(p_0_in__0[9]),
        .Q(Q[8]),
        .R(reset_i0));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__0_i_1
       (.I0(Q[6]),
        .I1(O[3]),
        .O(\count_o_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__0_i_2
       (.I0(Q[5]),
        .I1(O[2]),
        .O(\count_o_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__0_i_3
       (.I0(Q[4]),
        .I1(O[1]),
        .O(\count_o_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__0_i_4
       (.I0(Q[3]),
        .I1(O[0]),
        .O(\count_o_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__1_i_1
       (.I0(Q[8]),
        .I1(pixel_index0__25_carry__1[1]),
        .O(\count_o_reg[9]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    pixel_index0__25_carry__1_i_2
       (.I0(Q[7]),
        .I1(pixel_index0__25_carry__1[0]),
        .O(\count_o_reg[9]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry__0_i_1
       (.I0(Q[5]),
        .I1(Q[7]),
        .O(\count_o_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry__0_i_2
       (.I0(Q[4]),
        .I1(Q[6]),
        .O(\count_o_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry__0_i_3
       (.I0(Q[3]),
        .I1(Q[5]),
        .O(\count_o_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry__0_i_4
       (.I0(Q[2]),
        .I1(Q[4]),
        .O(\count_o_reg[6]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    pixel_index0_carry__1_i_1
       (.I0(Q[7]),
        .O(\count_o_reg[8]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry__1_i_2
       (.I0(Q[6]),
        .I1(Q[8]),
        .O(\count_o_reg[8]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry_i_1
       (.I0(Q[1]),
        .I1(Q[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    pixel_index0_carry_i_2
       (.I0(S[0]),
        .I1(Q[2]),
        .O(S[2]));
  LUT1 #(
    .INIT(2'h1)) 
    pixel_index0_carry_i_3
       (.I0(Q[1]),
        .O(S[1]));
endmodule

(* ORIG_REF_NAME = "Latency" *) 
module design_1_gpu_0_0_Latency
   (VGA_R_o,
    VGA_G_o,
    VGA_B_o,
    VGA_VS_o,
    VGA_HS_o,
    Q,
    reset_i,
    D,
    vga_clk_i);
  output [3:0]VGA_R_o;
  output [3:0]VGA_G_o;
  output [3:0]VGA_B_o;
  output VGA_VS_o;
  output VGA_HS_o;
  input [11:0]Q;
  input reset_i;
  input [17:0]D;
  input vga_clk_i;

  wire [17:0]D;
  wire [11:0]Q;
  wire [3:0]VGA_B_o;
  wire [3:0]VGA_G_o;
  wire VGA_HS_o;
  wire VGA_HS_o_INST_0_i_1_n_0;
  wire [3:0]VGA_R_o;
  wire \VGA_R_o[3]_INST_0_i_1_n_0 ;
  wire \VGA_R_o[3]_INST_0_i_2_n_0 ;
  wire VGA_VS_o;
  wire VGA_VS_o_INST_0_i_1_n_0;
  wire [10:3]delayed_h_pxl_count;
  wire [20:0]\ff_chain_reg[0] ;
  wire \ff_chain_reg_n_0_[1][0] ;
  wire \ff_chain_reg_n_0_[1][1] ;
  wire \ff_chain_reg_n_0_[1][2] ;
  wire \ff_chain_reg_n_0_[1][3] ;
  wire \ff_chain_reg_n_0_[1][4] ;
  wire \ff_chain_reg_n_0_[1][5] ;
  wire \ff_chain_reg_n_0_[1][6] ;
  wire \ff_chain_reg_n_0_[1][7] ;
  wire \ff_chain_reg_n_0_[1][8] ;
  wire \ff_chain_reg_n_0_[1][9] ;
  wire reset_i;
  wire vga_clk_i;

  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_B_o[0]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[0]),
        .O(VGA_B_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_B_o[1]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[1]),
        .O(VGA_B_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_B_o[2]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[2]),
        .O(VGA_B_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_B_o[3]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[3]),
        .O(VGA_B_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_G_o[0]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[4]),
        .O(VGA_G_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_G_o[1]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[5]),
        .O(VGA_G_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_G_o[2]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[6]),
        .O(VGA_G_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_G_o[3]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[7]),
        .O(VGA_G_o[3]));
  LUT4 #(
    .INIT(16'hFFDF)) 
    VGA_HS_o_INST_0
       (.I0(delayed_h_pxl_count[8]),
        .I1(delayed_h_pxl_count[10]),
        .I2(delayed_h_pxl_count[9]),
        .I3(VGA_HS_o_INST_0_i_1_n_0),
        .O(VGA_HS_o));
  LUT5 #(
    .INIT(32'hAAA85557)) 
    VGA_HS_o_INST_0_i_1
       (.I0(delayed_h_pxl_count[6]),
        .I1(delayed_h_pxl_count[5]),
        .I2(delayed_h_pxl_count[4]),
        .I3(delayed_h_pxl_count[3]),
        .I4(delayed_h_pxl_count[7]),
        .O(VGA_HS_o_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_R_o[0]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[8]),
        .O(VGA_R_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_R_o[1]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[9]),
        .O(VGA_R_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_R_o[2]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[10]),
        .O(VGA_R_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA200)) 
    \VGA_R_o[3]_INST_0 
       (.I0(\VGA_R_o[3]_INST_0_i_1_n_0 ),
        .I1(\ff_chain_reg_n_0_[1][9] ),
        .I2(\VGA_R_o[3]_INST_0_i_2_n_0 ),
        .I3(Q[11]),
        .O(VGA_R_o[3]));
  LUT6 #(
    .INIT(64'h000000005557FFFF)) 
    \VGA_R_o[3]_INST_0_i_1 
       (.I0(delayed_h_pxl_count[8]),
        .I1(delayed_h_pxl_count[5]),
        .I2(delayed_h_pxl_count[6]),
        .I3(delayed_h_pxl_count[7]),
        .I4(delayed_h_pxl_count[9]),
        .I5(delayed_h_pxl_count[10]),
        .O(\VGA_R_o[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0101010101111111)) 
    \VGA_R_o[3]_INST_0_i_2 
       (.I0(\ff_chain_reg_n_0_[1][8] ),
        .I1(\ff_chain_reg_n_0_[1][7] ),
        .I2(\ff_chain_reg_n_0_[1][6] ),
        .I3(\ff_chain_reg_n_0_[1][4] ),
        .I4(\ff_chain_reg_n_0_[1][3] ),
        .I5(\ff_chain_reg_n_0_[1][5] ),
        .O(\VGA_R_o[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBFFFFF)) 
    VGA_VS_o_INST_0
       (.I0(\ff_chain_reg_n_0_[1][5] ),
        .I1(\ff_chain_reg_n_0_[1][3] ),
        .I2(\ff_chain_reg_n_0_[1][4] ),
        .I3(\ff_chain_reg_n_0_[1][7] ),
        .I4(\ff_chain_reg_n_0_[1][6] ),
        .I5(VGA_VS_o_INST_0_i_1_n_0),
        .O(VGA_VS_o));
  LUT5 #(
    .INIT(32'hFDFDFDDF)) 
    VGA_VS_o_INST_0_i_1
       (.I0(\ff_chain_reg_n_0_[1][9] ),
        .I1(\ff_chain_reg_n_0_[1][8] ),
        .I2(\ff_chain_reg_n_0_[1][2] ),
        .I3(\ff_chain_reg_n_0_[1][0] ),
        .I4(\ff_chain_reg_n_0_[1][1] ),
        .O(VGA_VS_o_INST_0_i_1_n_0));
  FDRE \ff_chain_reg[0][0] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[0]),
        .Q(\ff_chain_reg[0] [0]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][13] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[10]),
        .Q(\ff_chain_reg[0] [13]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][14] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[11]),
        .Q(\ff_chain_reg[0] [14]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][15] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[12]),
        .Q(\ff_chain_reg[0] [15]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][16] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[13]),
        .Q(\ff_chain_reg[0] [16]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][17] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[14]),
        .Q(\ff_chain_reg[0] [17]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][18] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[15]),
        .Q(\ff_chain_reg[0] [18]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][19] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[16]),
        .Q(\ff_chain_reg[0] [19]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][1] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[1]),
        .Q(\ff_chain_reg[0] [1]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][20] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[17]),
        .Q(\ff_chain_reg[0] [20]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][2] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[2]),
        .Q(\ff_chain_reg[0] [2]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][3] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[3]),
        .Q(\ff_chain_reg[0] [3]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][4] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[4]),
        .Q(\ff_chain_reg[0] [4]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][5] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[5]),
        .Q(\ff_chain_reg[0] [5]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][6] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[6]),
        .Q(\ff_chain_reg[0] [6]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][7] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[7]),
        .Q(\ff_chain_reg[0] [7]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][8] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[8]),
        .Q(\ff_chain_reg[0] [8]),
        .R(reset_i));
  FDRE \ff_chain_reg[0][9] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(D[9]),
        .Q(\ff_chain_reg[0] [9]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][0] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [0]),
        .Q(\ff_chain_reg_n_0_[1][0] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][13] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [13]),
        .Q(delayed_h_pxl_count[3]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][14] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [14]),
        .Q(delayed_h_pxl_count[4]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][15] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [15]),
        .Q(delayed_h_pxl_count[5]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][16] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [16]),
        .Q(delayed_h_pxl_count[6]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][17] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [17]),
        .Q(delayed_h_pxl_count[7]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][18] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [18]),
        .Q(delayed_h_pxl_count[8]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][19] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [19]),
        .Q(delayed_h_pxl_count[9]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][1] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [1]),
        .Q(\ff_chain_reg_n_0_[1][1] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][20] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [20]),
        .Q(delayed_h_pxl_count[10]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][2] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [2]),
        .Q(\ff_chain_reg_n_0_[1][2] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][3] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [3]),
        .Q(\ff_chain_reg_n_0_[1][3] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][4] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [4]),
        .Q(\ff_chain_reg_n_0_[1][4] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][5] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [5]),
        .Q(\ff_chain_reg_n_0_[1][5] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][6] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [6]),
        .Q(\ff_chain_reg_n_0_[1][6] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][7] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [7]),
        .Q(\ff_chain_reg_n_0_[1][7] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][8] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [8]),
        .Q(\ff_chain_reg_n_0_[1][8] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][9] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0] [9]),
        .Q(\ff_chain_reg_n_0_[1][9] ),
        .R(reset_i));
endmodule

(* ORIG_REF_NAME = "Latency" *) 
module design_1_gpu_0_0_Latency__parameterized0
   (Q,
    reset_i,
    \ff_chain_reg[0][11]_0 ,
    vga_clk_i);
  output [11:0]Q;
  input reset_i;
  input [11:0]\ff_chain_reg[0][11]_0 ;
  input vga_clk_i;

  wire [11:0]Q;
  wire [11:0]\ff_chain_reg[0][11]_0 ;
  wire \ff_chain_reg_n_0_[0][0] ;
  wire \ff_chain_reg_n_0_[0][10] ;
  wire \ff_chain_reg_n_0_[0][11] ;
  wire \ff_chain_reg_n_0_[0][1] ;
  wire \ff_chain_reg_n_0_[0][2] ;
  wire \ff_chain_reg_n_0_[0][3] ;
  wire \ff_chain_reg_n_0_[0][4] ;
  wire \ff_chain_reg_n_0_[0][5] ;
  wire \ff_chain_reg_n_0_[0][6] ;
  wire \ff_chain_reg_n_0_[0][7] ;
  wire \ff_chain_reg_n_0_[0][8] ;
  wire \ff_chain_reg_n_0_[0][9] ;
  wire reset_i;
  wire vga_clk_i;

  FDRE \ff_chain_reg[0][0] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [0]),
        .Q(\ff_chain_reg_n_0_[0][0] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][10] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [10]),
        .Q(\ff_chain_reg_n_0_[0][10] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][11] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [11]),
        .Q(\ff_chain_reg_n_0_[0][11] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][1] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [1]),
        .Q(\ff_chain_reg_n_0_[0][1] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][2] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [2]),
        .Q(\ff_chain_reg_n_0_[0][2] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][3] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [3]),
        .Q(\ff_chain_reg_n_0_[0][3] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][4] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [4]),
        .Q(\ff_chain_reg_n_0_[0][4] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][5] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [5]),
        .Q(\ff_chain_reg_n_0_[0][5] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][6] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [6]),
        .Q(\ff_chain_reg_n_0_[0][6] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][7] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [7]),
        .Q(\ff_chain_reg_n_0_[0][7] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][8] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [8]),
        .Q(\ff_chain_reg_n_0_[0][8] ),
        .R(reset_i));
  FDRE \ff_chain_reg[0][9] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg[0][11]_0 [9]),
        .Q(\ff_chain_reg_n_0_[0][9] ),
        .R(reset_i));
  FDRE \ff_chain_reg[1][0] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][0] ),
        .Q(Q[0]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][10] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][10] ),
        .Q(Q[10]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][11] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][11] ),
        .Q(Q[11]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][1] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][1] ),
        .Q(Q[1]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][2] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][2] ),
        .Q(Q[2]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][3] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][3] ),
        .Q(Q[3]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][4] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][4] ),
        .Q(Q[4]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][5] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][5] ),
        .Q(Q[5]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][6] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][6] ),
        .Q(Q[6]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][7] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][7] ),
        .Q(Q[7]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][8] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][8] ),
        .Q(Q[8]),
        .R(reset_i));
  FDRE \ff_chain_reg[1][9] 
       (.C(vga_clk_i),
        .CE(1'b1),
        .D(\ff_chain_reg_n_0_[0][9] ),
        .Q(Q[9]),
        .R(reset_i));
endmodule

(* ORIG_REF_NAME = "Palette" *) 
module design_1_gpu_0_0_Palette
   (bram_addr_o,
    \argb_reg[11]_0 ,
    reset_i,
    gpu_clk_i,
    Q,
    D,
    bram_dout_i,
    pixel_addr);
  output [17:0]bram_addr_o;
  output [11:0]\argb_reg[11]_0 ;
  input reset_i;
  input gpu_clk_i;
  input [3:0]Q;
  input [12:0]D;
  input [31:0]bram_dout_i;
  input [9:0]pixel_addr;

  wire [12:0]D;
  wire [3:0]Q;
  wire [11:0]argb0;
  wire [11:0]\argb_reg[11]_0 ;
  wire argb_valid;
  wire [17:0]bram_addr_o;
  wire [31:0]bram_dout_i;
  wire color_index_valid;
  wire \delayed_bram_addr_reg_n_0_[0] ;
  wire \delayed_bram_addr_reg_n_0_[1] ;
  wire gpu_clk_i;
  wire new_pixel;
  wire new_pixel_carry__0_i_1_n_0;
  wire new_pixel_carry__0_i_2_n_0;
  wire new_pixel_carry__0_n_3;
  wire new_pixel_carry_i_1_n_0;
  wire new_pixel_carry_i_2_n_0;
  wire new_pixel_carry_i_3_n_0;
  wire new_pixel_carry_i_4_n_0;
  wire new_pixel_carry_n_0;
  wire new_pixel_carry_n_1;
  wire new_pixel_carry_n_2;
  wire new_pixel_carry_n_3;
  wire [9:0]pixel_addr;
  wire \pixel_index_reg_n_0_[0] ;
  wire \pixel_index_reg_n_0_[10] ;
  wire \pixel_index_reg_n_0_[11] ;
  wire \pixel_index_reg_n_0_[12] ;
  wire \pixel_index_reg_n_0_[13] ;
  wire \pixel_index_reg_n_0_[14] ;
  wire \pixel_index_reg_n_0_[15] ;
  wire \pixel_index_reg_n_0_[16] ;
  wire \pixel_index_reg_n_0_[1] ;
  wire \pixel_index_reg_n_0_[2] ;
  wire \pixel_index_reg_n_0_[3] ;
  wire \pixel_index_reg_n_0_[4] ;
  wire \pixel_index_reg_n_0_[5] ;
  wire \pixel_index_reg_n_0_[6] ;
  wire \pixel_index_reg_n_0_[7] ;
  wire \pixel_index_reg_n_0_[8] ;
  wire \pixel_index_reg_n_0_[9] ;
  wire reset_i;
  wire [3:0]NLW_new_pixel_carry_O_UNCONNECTED;
  wire [3:2]NLW_new_pixel_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_new_pixel_carry__0_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \argb[10]_i_1 
       (.I0(bram_dout_i[18]),
        .I1(bram_dout_i[10]),
        .I2(bram_dout_i[2]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[26]),
        .O(argb0[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \argb[11]_i_1 
       (.I0(bram_dout_i[19]),
        .I1(bram_dout_i[11]),
        .I2(bram_dout_i[3]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[27]),
        .O(argb0[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \argb[8]_i_1 
       (.I0(bram_dout_i[16]),
        .I1(bram_dout_i[8]),
        .I2(bram_dout_i[0]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[24]),
        .O(argb0[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \argb[9]_i_1 
       (.I0(bram_dout_i[17]),
        .I1(bram_dout_i[9]),
        .I2(bram_dout_i[1]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[25]),
        .O(argb0[9]));
  FDRE \argb_reg[0] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[0]),
        .Q(\argb_reg[11]_0 [0]),
        .R(reset_i));
  FDRE \argb_reg[10] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[10]),
        .Q(\argb_reg[11]_0 [10]),
        .R(reset_i));
  FDRE \argb_reg[11] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[11]),
        .Q(\argb_reg[11]_0 [11]),
        .R(reset_i));
  FDRE \argb_reg[1] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[1]),
        .Q(\argb_reg[11]_0 [1]),
        .R(reset_i));
  FDRE \argb_reg[2] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[2]),
        .Q(\argb_reg[11]_0 [2]),
        .R(reset_i));
  FDRE \argb_reg[3] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[3]),
        .Q(\argb_reg[11]_0 [3]),
        .R(reset_i));
  FDRE \argb_reg[4] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[4]),
        .Q(\argb_reg[11]_0 [4]),
        .R(reset_i));
  FDRE \argb_reg[5] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[5]),
        .Q(\argb_reg[11]_0 [5]),
        .R(reset_i));
  FDRE \argb_reg[6] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[6]),
        .Q(\argb_reg[11]_0 [6]),
        .R(reset_i));
  FDRE \argb_reg[7] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[7]),
        .Q(\argb_reg[11]_0 [7]),
        .R(reset_i));
  FDRE \argb_reg[8] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[8]),
        .Q(\argb_reg[11]_0 [8]),
        .R(reset_i));
  FDRE \argb_reg[9] 
       (.C(gpu_clk_i),
        .CE(argb_valid),
        .D(argb0[9]),
        .Q(\argb_reg[11]_0 [9]),
        .R(reset_i));
  FDRE argb_valid_reg
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(color_index_valid),
        .Q(argb_valid),
        .R(reset_i));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[0]_INST_0 
       (.I0(new_pixel),
        .I1(Q[0]),
        .O(bram_addr_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[10]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[2]),
        .O(bram_addr_o[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[11]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[3]),
        .O(bram_addr_o[11]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[12]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[4]),
        .O(bram_addr_o[12]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[13]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[5]),
        .O(bram_addr_o[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[14]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[6]),
        .O(bram_addr_o[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[15]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[7]),
        .O(bram_addr_o[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[16]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[8]),
        .O(bram_addr_o[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[17]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[9]),
        .O(bram_addr_o[17]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[1]_INST_0 
       (.I0(Q[1]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[0]),
        .O(bram_addr_o[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[1]_INST_0_i_1 
       (.I0(bram_dout_i[8]),
        .I1(bram_dout_i[0]),
        .I2(bram_dout_i[24]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[16]),
        .O(argb0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[2]_INST_0 
       (.I0(Q[2]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[1]),
        .O(bram_addr_o[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[2]_INST_0_i_1 
       (.I0(bram_dout_i[9]),
        .I1(bram_dout_i[1]),
        .I2(bram_dout_i[25]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[17]),
        .O(argb0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[3]_INST_0 
       (.I0(Q[3]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[2]),
        .O(bram_addr_o[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[3]_INST_0_i_1 
       (.I0(bram_dout_i[10]),
        .I1(bram_dout_i[2]),
        .I2(bram_dout_i[26]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[18]),
        .O(argb0[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[4]_INST_0 
       (.I0(D[0]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[3]),
        .O(bram_addr_o[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[4]_INST_0_i_1 
       (.I0(bram_dout_i[11]),
        .I1(bram_dout_i[3]),
        .I2(bram_dout_i[27]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[19]),
        .O(argb0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[5]_INST_0 
       (.I0(D[1]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[4]),
        .O(bram_addr_o[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[5]_INST_0_i_1 
       (.I0(bram_dout_i[12]),
        .I1(bram_dout_i[4]),
        .I2(bram_dout_i[28]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[20]),
        .O(argb0[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[6]_INST_0 
       (.I0(D[2]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[5]),
        .O(bram_addr_o[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[6]_INST_0_i_1 
       (.I0(bram_dout_i[13]),
        .I1(bram_dout_i[5]),
        .I2(bram_dout_i[29]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[21]),
        .O(argb0[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[7]_INST_0 
       (.I0(D[3]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[6]),
        .O(bram_addr_o[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[7]_INST_0_i_2 
       (.I0(bram_dout_i[14]),
        .I1(bram_dout_i[6]),
        .I2(bram_dout_i[30]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[22]),
        .O(argb0[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \bram_addr_o[8]_INST_0 
       (.I0(pixel_addr[0]),
        .I1(new_pixel),
        .I2(color_index_valid),
        .I3(argb0[7]),
        .O(bram_addr_o[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \bram_addr_o[8]_INST_0_i_1 
       (.I0(bram_dout_i[15]),
        .I1(bram_dout_i[7]),
        .I2(bram_dout_i[31]),
        .I3(\delayed_bram_addr_reg_n_0_[1] ),
        .I4(\delayed_bram_addr_reg_n_0_[0] ),
        .I5(bram_dout_i[23]),
        .O(argb0[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \bram_addr_o[9]_INST_0 
       (.I0(new_pixel),
        .I1(pixel_addr[1]),
        .O(bram_addr_o[9]));
  FDRE color_index_valid_reg
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(new_pixel),
        .Q(color_index_valid),
        .R(reset_i));
  FDRE \delayed_bram_addr_reg[0] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(bram_addr_o[0]),
        .Q(\delayed_bram_addr_reg_n_0_[0] ),
        .R(reset_i));
  FDRE \delayed_bram_addr_reg[1] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(bram_addr_o[1]),
        .Q(\delayed_bram_addr_reg_n_0_[1] ),
        .R(reset_i));
  CARRY4 new_pixel_carry
       (.CI(1'b0),
        .CO({new_pixel_carry_n_0,new_pixel_carry_n_1,new_pixel_carry_n_2,new_pixel_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_new_pixel_carry_O_UNCONNECTED[3:0]),
        .S({new_pixel_carry_i_1_n_0,new_pixel_carry_i_2_n_0,new_pixel_carry_i_3_n_0,new_pixel_carry_i_4_n_0}));
  CARRY4 new_pixel_carry__0
       (.CI(new_pixel_carry_n_0),
        .CO({NLW_new_pixel_carry__0_CO_UNCONNECTED[3:2],new_pixel,new_pixel_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b1}),
        .O(NLW_new_pixel_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,new_pixel_carry__0_i_1_n_0,new_pixel_carry__0_i_2_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    new_pixel_carry__0_i_1
       (.I0(\pixel_index_reg_n_0_[15] ),
        .I1(D[11]),
        .I2(\pixel_index_reg_n_0_[16] ),
        .I3(D[12]),
        .O(new_pixel_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    new_pixel_carry__0_i_2
       (.I0(\pixel_index_reg_n_0_[12] ),
        .I1(D[8]),
        .I2(D[10]),
        .I3(\pixel_index_reg_n_0_[14] ),
        .I4(D[9]),
        .I5(\pixel_index_reg_n_0_[13] ),
        .O(new_pixel_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    new_pixel_carry_i_1
       (.I0(\pixel_index_reg_n_0_[9] ),
        .I1(D[5]),
        .I2(D[7]),
        .I3(\pixel_index_reg_n_0_[11] ),
        .I4(D[6]),
        .I5(\pixel_index_reg_n_0_[10] ),
        .O(new_pixel_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    new_pixel_carry_i_2
       (.I0(\pixel_index_reg_n_0_[6] ),
        .I1(D[2]),
        .I2(D[4]),
        .I3(\pixel_index_reg_n_0_[8] ),
        .I4(D[3]),
        .I5(\pixel_index_reg_n_0_[7] ),
        .O(new_pixel_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    new_pixel_carry_i_3
       (.I0(\pixel_index_reg_n_0_[3] ),
        .I1(Q[3]),
        .I2(D[1]),
        .I3(\pixel_index_reg_n_0_[5] ),
        .I4(D[0]),
        .I5(\pixel_index_reg_n_0_[4] ),
        .O(new_pixel_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    new_pixel_carry_i_4
       (.I0(\pixel_index_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\pixel_index_reg_n_0_[2] ),
        .I4(Q[1]),
        .I5(\pixel_index_reg_n_0_[1] ),
        .O(new_pixel_carry_i_4_n_0));
  FDRE \pixel_index_reg[0] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(Q[0]),
        .Q(\pixel_index_reg_n_0_[0] ),
        .R(reset_i));
  FDRE \pixel_index_reg[10] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[6]),
        .Q(\pixel_index_reg_n_0_[10] ),
        .R(reset_i));
  FDRE \pixel_index_reg[11] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[7]),
        .Q(\pixel_index_reg_n_0_[11] ),
        .R(reset_i));
  FDRE \pixel_index_reg[12] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[8]),
        .Q(\pixel_index_reg_n_0_[12] ),
        .R(reset_i));
  FDRE \pixel_index_reg[13] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[9]),
        .Q(\pixel_index_reg_n_0_[13] ),
        .R(reset_i));
  FDRE \pixel_index_reg[14] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[10]),
        .Q(\pixel_index_reg_n_0_[14] ),
        .R(reset_i));
  FDRE \pixel_index_reg[15] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[11]),
        .Q(\pixel_index_reg_n_0_[15] ),
        .R(reset_i));
  FDRE \pixel_index_reg[16] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[12]),
        .Q(\pixel_index_reg_n_0_[16] ),
        .R(reset_i));
  FDRE \pixel_index_reg[1] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(Q[1]),
        .Q(\pixel_index_reg_n_0_[1] ),
        .R(reset_i));
  FDRE \pixel_index_reg[2] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(Q[2]),
        .Q(\pixel_index_reg_n_0_[2] ),
        .R(reset_i));
  FDRE \pixel_index_reg[3] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(Q[3]),
        .Q(\pixel_index_reg_n_0_[3] ),
        .R(reset_i));
  FDRE \pixel_index_reg[4] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[0]),
        .Q(\pixel_index_reg_n_0_[4] ),
        .R(reset_i));
  FDRE \pixel_index_reg[5] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[1]),
        .Q(\pixel_index_reg_n_0_[5] ),
        .R(reset_i));
  FDRE \pixel_index_reg[6] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[2]),
        .Q(\pixel_index_reg_n_0_[6] ),
        .R(reset_i));
  FDRE \pixel_index_reg[7] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[3]),
        .Q(\pixel_index_reg_n_0_[7] ),
        .R(reset_i));
  FDRE \pixel_index_reg[8] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[4]),
        .Q(\pixel_index_reg_n_0_[8] ),
        .R(reset_i));
  FDRE \pixel_index_reg[9] 
       (.C(gpu_clk_i),
        .CE(1'b1),
        .D(D[5]),
        .Q(\pixel_index_reg_n_0_[9] ),
        .R(reset_i));
endmodule

(* ORIG_REF_NAME = "VgaController" *) 
module design_1_gpu_0_0_VgaController
   (S,
    Q,
    \count_o_reg[6] ,
    \count_o_reg[8] ,
    VGA_R_o,
    VGA_G_o,
    VGA_B_o,
    \count_o_reg[10] ,
    D,
    pixel_addr,
    \count_o_reg[7] ,
    \count_o_reg[9] ,
    VGA_VS_o,
    VGA_HS_o,
    reset_i,
    pixel_index0,
    \pixel_index_reg[7] ,
    \pixel_index_reg[11] ,
    O,
    pixel_index0__25_carry__1,
    vga_clk_i,
    \ff_chain_reg[0][11] );
  output [3:0]S;
  output [7:0]Q;
  output [3:0]\count_o_reg[6] ;
  output [1:0]\count_o_reg[8] ;
  output [3:0]VGA_R_o;
  output [3:0]VGA_G_o;
  output [3:0]VGA_B_o;
  output [9:0]\count_o_reg[10] ;
  output [12:0]D;
  output [9:0]pixel_addr;
  output [3:0]\count_o_reg[7] ;
  output [1:0]\count_o_reg[9] ;
  output VGA_VS_o;
  output VGA_HS_o;
  input reset_i;
  input [12:0]pixel_index0;
  input [3:0]\pixel_index_reg[7] ;
  input [1:0]\pixel_index_reg[11] ;
  input [3:0]O;
  input [1:0]pixel_index0__25_carry__1;
  input vga_clk_i;
  input [11:0]\ff_chain_reg[0][11] ;

  wire [12:0]D;
  wire [3:0]O;
  wire [7:0]Q;
  wire [3:0]S;
  wire [3:0]VGA_B_o;
  wire [3:0]VGA_G_o;
  wire VGA_HS_o;
  wire [3:0]VGA_R_o;
  wire VGA_VS_o;
  wire [9:0]\count_o_reg[10] ;
  wire [3:0]\count_o_reg[6] ;
  wire [3:0]\count_o_reg[7] ;
  wire [1:0]\count_o_reg[8] ;
  wire [1:0]\count_o_reg[9] ;
  wire double_flop_pxl_color_n_0;
  wire double_flop_pxl_color_n_1;
  wire double_flop_pxl_color_n_10;
  wire double_flop_pxl_color_n_11;
  wire double_flop_pxl_color_n_2;
  wire double_flop_pxl_color_n_3;
  wire double_flop_pxl_color_n_4;
  wire double_flop_pxl_color_n_5;
  wire double_flop_pxl_color_n_6;
  wire double_flop_pxl_color_n_7;
  wire double_flop_pxl_color_n_8;
  wire double_flop_pxl_color_n_9;
  wire [11:0]\ff_chain_reg[0][11] ;
  wire h_counter_end;
  wire [9:0]pixel_addr;
  wire [12:0]pixel_index0;
  wire [1:0]pixel_index0__25_carry__1;
  wire [1:0]\pixel_index_reg[11] ;
  wire [3:0]\pixel_index_reg[7] ;
  wire reset_i;
  wire vga_clk_i;
  wire [0:0]vga_v_pxl_index;

  design_1_gpu_0_0_Latency delay_pxl_count
       (.D({\count_o_reg[10] [9:2],Q,S[0],vga_v_pxl_index}),
        .Q({double_flop_pxl_color_n_0,double_flop_pxl_color_n_1,double_flop_pxl_color_n_2,double_flop_pxl_color_n_3,double_flop_pxl_color_n_4,double_flop_pxl_color_n_5,double_flop_pxl_color_n_6,double_flop_pxl_color_n_7,double_flop_pxl_color_n_8,double_flop_pxl_color_n_9,double_flop_pxl_color_n_10,double_flop_pxl_color_n_11}),
        .VGA_B_o(VGA_B_o),
        .VGA_G_o(VGA_G_o),
        .VGA_HS_o(VGA_HS_o),
        .VGA_R_o(VGA_R_o),
        .VGA_VS_o(VGA_VS_o),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
  design_1_gpu_0_0_Latency__parameterized0 double_flop_pxl_color
       (.Q({double_flop_pxl_color_n_0,double_flop_pxl_color_n_1,double_flop_pxl_color_n_2,double_flop_pxl_color_n_3,double_flop_pxl_color_n_4,double_flop_pxl_color_n_5,double_flop_pxl_color_n_6,double_flop_pxl_color_n_7,double_flop_pxl_color_n_8,double_flop_pxl_color_n_9,double_flop_pxl_color_n_10,double_flop_pxl_color_n_11}),
        .\ff_chain_reg[0][11]_0 (\ff_chain_reg[0][11] ),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
  design_1_gpu_0_0_Counter h_pxl_counter
       (.D(D),
        .E(h_counter_end),
        .Q(\count_o_reg[10] ),
        .pixel_addr(pixel_addr),
        .pixel_index0(pixel_index0),
        .\pixel_index_reg[11] (\pixel_index_reg[11] ),
        .\pixel_index_reg[7] (\pixel_index_reg[7] ),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
  design_1_gpu_0_0_Counter__parameterized0 v_pxl_counter
       (.E(h_counter_end),
        .O(O),
        .Q({Q,vga_v_pxl_index}),
        .S(S),
        .\count_o_reg[6]_0 (\count_o_reg[6] ),
        .\count_o_reg[7]_0 (\count_o_reg[7] ),
        .\count_o_reg[8]_0 (\count_o_reg[8] ),
        .\count_o_reg[9]_0 (\count_o_reg[9] ),
        .pixel_index0__25_carry__1(pixel_index0__25_carry__1),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
endmodule

(* ORIG_REF_NAME = "gpu" *) 
module design_1_gpu_0_0_gpu
   (VGA_R_o,
    VGA_G_o,
    VGA_B_o,
    bram_addr_o,
    VGA_VS_o,
    VGA_HS_o,
    reset_i,
    vga_clk_i,
    gpu_clk_i,
    bram_dout_i);
  output [3:0]VGA_R_o;
  output [3:0]VGA_G_o;
  output [3:0]VGA_B_o;
  output [17:0]bram_addr_o;
  output VGA_VS_o;
  output VGA_HS_o;
  input reset_i;
  input vga_clk_i;
  input gpu_clk_i;
  input [31:0]bram_dout_i;

  wire [9:0]C;
  wire [3:0]VGA_B_o;
  wire [3:0]VGA_G_o;
  wire VGA_HS_o;
  wire [3:0]VGA_R_o;
  wire VGA_VS_o;
  wire [11:0]argb;
  wire [17:0]bram_addr_o;
  wire \bram_addr_o[7]_INST_0_i_3_n_0 ;
  wire \bram_addr_o[7]_INST_0_i_4_n_0 ;
  wire \bram_addr_o[7]_INST_0_i_5_n_0 ;
  wire \bram_addr_o[7]_INST_0_i_6_n_0 ;
  wire [31:0]bram_dout_i;
  wire gpu_clk_i;
  wire [17:8]pixel_addr;
  wire [16:4]pixel_index;
  wire [16:4]pixel_index0;
  wire pixel_index0__25_carry__0_n_0;
  wire pixel_index0__25_carry__0_n_1;
  wire pixel_index0__25_carry__0_n_2;
  wire pixel_index0__25_carry__0_n_3;
  wire pixel_index0__25_carry__1_n_0;
  wire pixel_index0__25_carry__1_n_1;
  wire pixel_index0__25_carry__1_n_2;
  wire pixel_index0__25_carry__1_n_3;
  wire pixel_index0__25_carry__2_n_3;
  wire pixel_index0__25_carry_n_0;
  wire pixel_index0__25_carry_n_1;
  wire pixel_index0__25_carry_n_2;
  wire pixel_index0__25_carry_n_3;
  wire pixel_index0_carry__0_n_0;
  wire pixel_index0_carry__0_n_1;
  wire pixel_index0_carry__0_n_2;
  wire pixel_index0_carry__0_n_3;
  wire pixel_index0_carry__0_n_4;
  wire pixel_index0_carry__0_n_5;
  wire pixel_index0_carry__0_n_6;
  wire pixel_index0_carry__0_n_7;
  wire pixel_index0_carry__1_n_3;
  wire pixel_index0_carry__1_n_6;
  wire pixel_index0_carry__1_n_7;
  wire pixel_index0_carry_n_0;
  wire pixel_index0_carry_n_1;
  wire pixel_index0_carry_n_2;
  wire pixel_index0_carry_n_3;
  wire pixel_index0_carry_n_4;
  wire pixel_index0_carry_n_5;
  wire pixel_index0_carry_n_6;
  wire pixel_index0_carry_n_7;
  wire \pixel_index[11]_i_2_n_0 ;
  wire \pixel_index[11]_i_3_n_0 ;
  wire reset_i;
  wire vga_clk_i;
  wire vga_n_0;
  wire vga_n_1;
  wire vga_n_12;
  wire vga_n_13;
  wire vga_n_14;
  wire vga_n_15;
  wire vga_n_16;
  wire vga_n_17;
  wire vga_n_2;
  wire vga_n_63;
  wire vga_n_64;
  wire vga_n_65;
  wire vga_n_66;
  wire vga_n_67;
  wire vga_n_68;
  wire [9:1]vga_v_pxl_index;
  wire [0:0]NLW_pixel_index0__25_carry_O_UNCONNECTED;
  wire [3:1]NLW_pixel_index0__25_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_pixel_index0__25_carry__2_O_UNCONNECTED;
  wire [3:1]NLW_pixel_index0_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_pixel_index0_carry__1_O_UNCONNECTED;

  LUT2 #(
    .INIT(4'h6)) 
    \bram_addr_o[7]_INST_0_i_3 
       (.I0(pixel_index0[7]),
        .I1(C[7]),
        .O(\bram_addr_o[7]_INST_0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \bram_addr_o[7]_INST_0_i_4 
       (.I0(pixel_index0[6]),
        .I1(C[6]),
        .O(\bram_addr_o[7]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \bram_addr_o[7]_INST_0_i_5 
       (.I0(pixel_index0[5]),
        .I1(C[5]),
        .O(\bram_addr_o[7]_INST_0_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \bram_addr_o[7]_INST_0_i_6 
       (.I0(pixel_index0[4]),
        .I1(C[4]),
        .O(\bram_addr_o[7]_INST_0_i_6_n_0 ));
  design_1_gpu_0_0_Palette color_palette
       (.D(pixel_index),
        .Q(C[3:0]),
        .\argb_reg[11]_0 (argb),
        .bram_addr_o(bram_addr_o),
        .bram_dout_i(bram_dout_i),
        .gpu_clk_i(gpu_clk_i),
        .pixel_addr(pixel_addr),
        .reset_i(reset_i));
  CARRY4 pixel_index0__25_carry
       (.CI(1'b0),
        .CO({pixel_index0__25_carry_n_0,pixel_index0__25_carry_n_1,pixel_index0__25_carry_n_2,pixel_index0__25_carry_n_3}),
        .CYINIT(1'b0),
        .DI({vga_v_pxl_index[3:1],1'b0}),
        .O({pixel_index0[6:4],NLW_pixel_index0__25_carry_O_UNCONNECTED[0]}),
        .S({vga_v_pxl_index[3:1],1'b0}));
  CARRY4 pixel_index0__25_carry__0
       (.CI(pixel_index0__25_carry_n_0),
        .CO({pixel_index0__25_carry__0_n_0,pixel_index0__25_carry__0_n_1,pixel_index0__25_carry__0_n_2,pixel_index0__25_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(vga_v_pxl_index[7:4]),
        .O(pixel_index0[10:7]),
        .S({vga_n_63,vga_n_64,vga_n_65,vga_n_66}));
  CARRY4 pixel_index0__25_carry__1
       (.CI(pixel_index0__25_carry__0_n_0),
        .CO({pixel_index0__25_carry__1_n_0,pixel_index0__25_carry__1_n_1,pixel_index0__25_carry__1_n_2,pixel_index0__25_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,vga_v_pxl_index[9:8]}),
        .O(pixel_index0[14:11]),
        .S({pixel_index0_carry__0_n_4,pixel_index0_carry__0_n_5,vga_n_67,vga_n_68}));
  CARRY4 pixel_index0__25_carry__2
       (.CI(pixel_index0__25_carry__1_n_0),
        .CO({NLW_pixel_index0__25_carry__2_CO_UNCONNECTED[3:1],pixel_index0__25_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_pixel_index0__25_carry__2_O_UNCONNECTED[3:2],pixel_index0[16:15]}),
        .S({1'b0,1'b0,pixel_index0_carry__1_n_6,pixel_index0_carry__1_n_7}));
  CARRY4 pixel_index0_carry
       (.CI(1'b0),
        .CO({pixel_index0_carry_n_0,pixel_index0_carry_n_1,pixel_index0_carry_n_2,pixel_index0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({vga_v_pxl_index[2:1],1'b0,1'b1}),
        .O({pixel_index0_carry_n_4,pixel_index0_carry_n_5,pixel_index0_carry_n_6,pixel_index0_carry_n_7}),
        .S({vga_n_0,vga_n_1,vga_n_2,vga_v_pxl_index[1]}));
  CARRY4 pixel_index0_carry__0
       (.CI(pixel_index0_carry_n_0),
        .CO({pixel_index0_carry__0_n_0,pixel_index0_carry__0_n_1,pixel_index0_carry__0_n_2,pixel_index0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(vga_v_pxl_index[6:3]),
        .O({pixel_index0_carry__0_n_4,pixel_index0_carry__0_n_5,pixel_index0_carry__0_n_6,pixel_index0_carry__0_n_7}),
        .S({vga_n_12,vga_n_13,vga_n_14,vga_n_15}));
  CARRY4 pixel_index0_carry__1
       (.CI(pixel_index0_carry__0_n_0),
        .CO({NLW_pixel_index0_carry__1_CO_UNCONNECTED[3:1],pixel_index0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,vga_v_pxl_index[7]}),
        .O({NLW_pixel_index0_carry__1_O_UNCONNECTED[3:2],pixel_index0_carry__1_n_6,pixel_index0_carry__1_n_7}),
        .S({1'b0,1'b0,vga_n_16,vga_n_17}));
  LUT2 #(
    .INIT(4'h6)) 
    \pixel_index[11]_i_2 
       (.I0(pixel_index0[9]),
        .I1(C[9]),
        .O(\pixel_index[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \pixel_index[11]_i_3 
       (.I0(pixel_index0[8]),
        .I1(C[8]),
        .O(\pixel_index[11]_i_3_n_0 ));
  design_1_gpu_0_0_VgaController vga
       (.D(pixel_index),
        .O({pixel_index0_carry_n_4,pixel_index0_carry_n_5,pixel_index0_carry_n_6,pixel_index0_carry_n_7}),
        .Q(vga_v_pxl_index[9:2]),
        .S({vga_n_0,vga_n_1,vga_n_2,vga_v_pxl_index[1]}),
        .VGA_B_o(VGA_B_o),
        .VGA_G_o(VGA_G_o),
        .VGA_HS_o(VGA_HS_o),
        .VGA_R_o(VGA_R_o),
        .VGA_VS_o(VGA_VS_o),
        .\count_o_reg[10] (C),
        .\count_o_reg[6] ({vga_n_12,vga_n_13,vga_n_14,vga_n_15}),
        .\count_o_reg[7] ({vga_n_63,vga_n_64,vga_n_65,vga_n_66}),
        .\count_o_reg[8] ({vga_n_16,vga_n_17}),
        .\count_o_reg[9] ({vga_n_67,vga_n_68}),
        .\ff_chain_reg[0][11] (argb),
        .pixel_addr(pixel_addr),
        .pixel_index0(pixel_index0),
        .pixel_index0__25_carry__1({pixel_index0_carry__0_n_6,pixel_index0_carry__0_n_7}),
        .\pixel_index_reg[11] ({\pixel_index[11]_i_2_n_0 ,\pixel_index[11]_i_3_n_0 }),
        .\pixel_index_reg[7] ({\bram_addr_o[7]_INST_0_i_3_n_0 ,\bram_addr_o[7]_INST_0_i_4_n_0 ,\bram_addr_o[7]_INST_0_i_5_n_0 ,\bram_addr_o[7]_INST_0_i_6_n_0 }),
        .reset_i(reset_i),
        .vga_clk_i(vga_clk_i));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
