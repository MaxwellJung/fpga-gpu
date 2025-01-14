-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Sun Jan 12 23:54:21 2025
-- Host        : mint-ssd running 64-bit Linux Mint 21.1
-- Command     : write_vhdl -force -mode funcsim
--               /home/maxwelljung/programming/fpga-gpu/vivado/doom/doom.gen/sources_1/bd/design_1/ip/design_1_gpu_0_0/design_1_gpu_0_0_sim_netlist.vhdl
-- Design      : design_1_gpu_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0_Counter is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    D : out STD_LOGIC_VECTOR ( 12 downto 0 );
    pixel_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    reset_i : in STD_LOGIC;
    pixel_index0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \pixel_index_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \pixel_index_reg[11]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    vga_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_gpu_0_0_Counter : entity is "Counter";
end design_1_gpu_0_0_Counter;

architecture STRUCTURE of design_1_gpu_0_0_Counter is
  signal \^d\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \bram_addr_o[11]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \bram_addr_o[11]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \bram_addr_o[11]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \bram_addr_o[11]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \bram_addr_o[11]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \bram_addr_o[15]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \bram_addr_o[15]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \bram_addr_o[15]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \bram_addr_o[15]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \count_o[10]_i_3_n_0\ : STD_LOGIC;
  signal \count_o[9]_i_5_n_0\ : STD_LOGIC;
  signal \count_o_reg_n_0_[0]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \pixel_index_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \pixel_index_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \pixel_index_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \pixel_index_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \pixel_index_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \pixel_index_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \pixel_index_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \pixel_index_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal reset_i00_out : STD_LOGIC;
  signal \NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bram_addr_o[17]_INST_0_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pixel_index_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pixel_index_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \bram_addr_o[7]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_o[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \count_o[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \count_o[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count_o[4]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count_o[6]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \count_o[7]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \count_o[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count_o[9]_i_1\ : label is "soft_lutpair15";
  attribute ADDER_THRESHOLD of \pixel_index_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pixel_index_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \pixel_index_reg[16]_i_1\ : label is 35;
begin
  D(12 downto 0) <= \^d\(12 downto 0);
  E(0) <= \^e\(0);
  Q(9 downto 0) <= \^q\(9 downto 0);
\bram_addr_o[11]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \bram_addr_o[11]_INST_0_i_1_n_0\,
      CO(2) => \bram_addr_o[11]_INST_0_i_1_n_1\,
      CO(1) => \bram_addr_o[11]_INST_0_i_1_n_2\,
      CO(0) => \bram_addr_o[11]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \^d\(5),
      DI(0) => '0',
      O(3 downto 0) => pixel_addr(3 downto 0),
      S(3 downto 2) => \^d\(7 downto 6),
      S(1) => \bram_addr_o[11]_INST_0_i_2_n_0\,
      S(0) => \^d\(4)
    );
\bram_addr_o[11]_INST_0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^d\(5),
      O => \bram_addr_o[11]_INST_0_i_2_n_0\
    );
\bram_addr_o[15]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bram_addr_o[11]_INST_0_i_1_n_0\,
      CO(3) => \bram_addr_o[15]_INST_0_i_1_n_0\,
      CO(2) => \bram_addr_o[15]_INST_0_i_1_n_1\,
      CO(1) => \bram_addr_o[15]_INST_0_i_1_n_2\,
      CO(0) => \bram_addr_o[15]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pixel_addr(7 downto 4),
      S(3 downto 0) => \^d\(11 downto 8)
    );
\bram_addr_o[17]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bram_addr_o[15]_INST_0_i_1_n_0\,
      CO(3 downto 2) => \NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => pixel_addr(9),
      CO(0) => \NLW_bram_addr_o[17]_INST_0_i_1_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_bram_addr_o[17]_INST_0_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => pixel_addr(8),
      S(3 downto 1) => B"001",
      S(0) => \^d\(12)
    );
\bram_addr_o[7]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \bram_addr_o[7]_INST_0_i_1_n_0\,
      CO(2) => \bram_addr_o[7]_INST_0_i_1_n_1\,
      CO(1) => \bram_addr_o[7]_INST_0_i_1_n_2\,
      CO(0) => \bram_addr_o[7]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => pixel_index0(3 downto 0),
      O(3 downto 0) => \^d\(3 downto 0),
      S(3 downto 0) => \pixel_index_reg[7]\(3 downto 0)
    );
\count_o[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_o_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\count_o[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => reset_i,
      I1 => \^e\(0),
      O => reset_i00_out
    );
\count_o[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_o[10]_i_3_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \^q\(9),
      O => p_0_in(10)
    );
\count_o[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \count_o_reg_n_0_[0]\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_o[10]_i_3_n_0\
    );
\count_o[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_o_reg_n_0_[0]\,
      I1 => \^q\(0),
      O => p_0_in(1)
    );
\count_o[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \count_o_reg_n_0_[0]\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => p_0_in(2)
    );
\count_o[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(0),
      I1 => \count_o_reg_n_0_[0]\,
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => p_0_in(3)
    );
\count_o[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_o_reg_n_0_[0]\,
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(4)
    );
\count_o[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \count_o_reg_n_0_[0]\,
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(4),
      O => p_0_in(5)
    );
\count_o[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_o[10]_i_3_n_0\,
      I1 => \^q\(5),
      O => p_0_in(6)
    );
\count_o[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \count_o[10]_i_3_n_0\,
      I1 => \^q\(5),
      I2 => \^q\(6),
      O => p_0_in(7)
    );
\count_o[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_o[10]_i_3_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => p_0_in(8)
    );
\count_o[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_o[10]_i_3_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => p_0_in(9)
    );
\count_o[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \^q\(6),
      I3 => \count_o[9]_i_5_n_0\,
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \^e\(0)
    );
\count_o[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \count_o_reg_n_0_[0]\,
      I4 => \^q\(3),
      I5 => \^q\(0),
      O => \count_o[9]_i_5_n_0\
    );
\count_o_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(0),
      Q => \count_o_reg_n_0_[0]\,
      R => reset_i00_out
    );
\count_o_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(10),
      Q => \^q\(9),
      R => reset_i00_out
    );
\count_o_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(1),
      Q => \^q\(0),
      R => reset_i00_out
    );
\count_o_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(2),
      Q => \^q\(1),
      R => reset_i00_out
    );
\count_o_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(3),
      Q => \^q\(2),
      R => reset_i00_out
    );
\count_o_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(4),
      Q => \^q\(3),
      R => reset_i00_out
    );
\count_o_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(5),
      Q => \^q\(4),
      R => reset_i00_out
    );
\count_o_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(6),
      Q => \^q\(5),
      R => reset_i00_out
    );
\count_o_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(7),
      Q => \^q\(6),
      R => reset_i00_out
    );
\count_o_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(8),
      Q => \^q\(7),
      R => reset_i00_out
    );
\count_o_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => p_0_in(9),
      Q => \^q\(8),
      R => reset_i00_out
    );
\pixel_index_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bram_addr_o[7]_INST_0_i_1_n_0\,
      CO(3) => \pixel_index_reg[11]_i_1_n_0\,
      CO(2) => \pixel_index_reg[11]_i_1_n_1\,
      CO(1) => \pixel_index_reg[11]_i_1_n_2\,
      CO(0) => \pixel_index_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => pixel_index0(5 downto 4),
      O(3 downto 0) => \^d\(7 downto 4),
      S(3 downto 2) => pixel_index0(7 downto 6),
      S(1 downto 0) => \pixel_index_reg[11]\(1 downto 0)
    );
\pixel_index_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index_reg[11]_i_1_n_0\,
      CO(3) => \pixel_index_reg[15]_i_1_n_0\,
      CO(2) => \pixel_index_reg[15]_i_1_n_1\,
      CO(1) => \pixel_index_reg[15]_i_1_n_2\,
      CO(0) => \pixel_index_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \^d\(11 downto 8),
      S(3 downto 0) => pixel_index0(11 downto 8)
    );
\pixel_index_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index_reg[15]_i_1_n_0\,
      CO(3 downto 0) => \NLW_pixel_index_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_pixel_index_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \^d\(12),
      S(3 downto 1) => B"000",
      S(0) => pixel_index0(12)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_gpu_0_0_Counter__parameterized0\ is
  port (
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \count_o_reg[6]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_o_reg[8]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \count_o_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_o_reg[9]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    reset_i : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \pixel_index0__25_carry__1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    vga_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_gpu_0_0_Counter__parameterized0\ : entity is "Counter";
end \design_1_gpu_0_0_Counter__parameterized0\;

architecture STRUCTURE of \design_1_gpu_0_0_Counter__parameterized0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^s\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count_o[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_o[9]_i_4_n_0\ : STD_LOGIC;
  signal \count_o[9]_i_6_n_0\ : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal reset_i0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_o[0]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count_o[1]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \count_o[2]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \count_o[3]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \count_o[4]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \count_o[6]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count_o[8]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \count_o[9]_i_3\ : label is "soft_lutpair19";
begin
  Q(8 downto 0) <= \^q\(8 downto 0);
  S(3 downto 0) <= \^s\(3 downto 0);
\count_o[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__0\(0)
    );
\count_o[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^s\(0),
      O => \p_0_in__0\(1)
    );
\count_o[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^s\(0),
      I2 => \^q\(1),
      O => \p_0_in__0\(2)
    );
\count_o[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^s\(0),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \p_0_in__0\(3)
    );
\count_o[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^s\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => \p_0_in__0\(4)
    );
\count_o[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^s\(0),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(4),
      O => \p_0_in__0\(5)
    );
\count_o[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \count_o[6]_i_2_n_0\,
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \p_0_in__0\(6)
    );
\count_o[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s\(0),
      I1 => \^q\(0),
      O => \count_o[6]_i_2_n_0\
    );
\count_o[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \count_o[9]_i_6_n_0\,
      I1 => \^q\(5),
      I2 => \^q\(6),
      O => \p_0_in__0\(7)
    );
\count_o[8]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_o[9]_i_6_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \p_0_in__0\(8)
    );
\count_o[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEAAAAAAAAA"
    )
        port map (
      I0 => reset_i,
      I1 => \^q\(8),
      I2 => \^q\(7),
      I3 => \count_o[9]_i_4_n_0\,
      I4 => \^q\(6),
      I5 => E(0),
      O => reset_i0
    );
\count_o[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_o[9]_i_6_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \p_0_in__0\(9)
    );
\count_o[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(1),
      I3 => \count_o[6]_i_2_n_0\,
      I4 => \^q\(2),
      I5 => \^q\(5),
      O => \count_o[9]_i_4_n_0\
    );
\count_o[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^s\(0),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_o[9]_i_6_n_0\
    );
\count_o_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(0),
      Q => \^q\(0),
      R => reset_i0
    );
\count_o_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(1),
      Q => \^s\(0),
      R => reset_i0
    );
\count_o_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(2),
      Q => \^q\(1),
      R => reset_i0
    );
\count_o_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(3),
      Q => \^q\(2),
      R => reset_i0
    );
\count_o_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(4),
      Q => \^q\(3),
      R => reset_i0
    );
\count_o_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(5),
      Q => \^q\(4),
      R => reset_i0
    );
\count_o_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(6),
      Q => \^q\(5),
      R => reset_i0
    );
\count_o_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(7),
      Q => \^q\(6),
      R => reset_i0
    );
\count_o_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(8),
      Q => \^q\(7),
      R => reset_i0
    );
\count_o_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => E(0),
      D => \p_0_in__0\(9),
      Q => \^q\(8),
      R => reset_i0
    );
\pixel_index0__25_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(6),
      I1 => O(3),
      O => \count_o_reg[7]_0\(3)
    );
\pixel_index0__25_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(5),
      I1 => O(2),
      O => \count_o_reg[7]_0\(2)
    );
\pixel_index0__25_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => O(1),
      O => \count_o_reg[7]_0\(1)
    );
\pixel_index0__25_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(3),
      I1 => O(0),
      O => \count_o_reg[7]_0\(0)
    );
\pixel_index0__25_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(8),
      I1 => \pixel_index0__25_carry__1\(1),
      O => \count_o_reg[9]_0\(1)
    );
\pixel_index0__25_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(7),
      I1 => \pixel_index0__25_carry__1\(0),
      O => \count_o_reg[9]_0\(0)
    );
\pixel_index0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(7),
      O => \count_o_reg[6]_0\(3)
    );
\pixel_index0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(6),
      O => \count_o_reg[6]_0\(2)
    );
\pixel_index0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(5),
      O => \count_o_reg[6]_0\(1)
    );
\pixel_index0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(4),
      O => \count_o_reg[6]_0\(0)
    );
\pixel_index0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(7),
      O => \count_o_reg[8]_0\(1)
    );
\pixel_index0_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(8),
      O => \count_o_reg[8]_0\(0)
    );
pixel_index0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      O => \^s\(3)
    );
pixel_index0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^s\(0),
      I1 => \^q\(2),
      O => \^s\(2)
    );
pixel_index0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(1),
      O => \^s\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0_Latency is
  port (
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    VGA_HS_o : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 11 downto 0 );
    reset_i : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 17 downto 0 );
    vga_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_gpu_0_0_Latency : entity is "Latency";
end design_1_gpu_0_0_Latency;

architecture STRUCTURE of design_1_gpu_0_0_Latency is
  signal VGA_HS_o_INST_0_i_1_n_0 : STD_LOGIC;
  signal \VGA_R_o[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \VGA_R_o[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal VGA_VS_o_INST_0_i_1_n_0 : STD_LOGIC;
  signal delayed_h_pxl_count : STD_LOGIC_VECTOR ( 10 downto 3 );
  signal \ff_chain_reg[0]\ : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal \ff_chain_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][5]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][6]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][7]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][8]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[1][9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \VGA_B_o[0]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VGA_B_o[1]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VGA_B_o[2]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VGA_B_o[3]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VGA_G_o[0]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \VGA_G_o[1]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \VGA_G_o[2]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \VGA_G_o[3]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \VGA_R_o[0]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \VGA_R_o[1]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \VGA_R_o[2]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \VGA_R_o[3]_INST_0\ : label is "soft_lutpair9";
begin
\VGA_B_o[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(0),
      O => VGA_B_o(0)
    );
\VGA_B_o[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(1),
      O => VGA_B_o(1)
    );
\VGA_B_o[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(2),
      O => VGA_B_o(2)
    );
\VGA_B_o[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(3),
      O => VGA_B_o(3)
    );
\VGA_G_o[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(4),
      O => VGA_G_o(0)
    );
\VGA_G_o[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(5),
      O => VGA_G_o(1)
    );
\VGA_G_o[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(6),
      O => VGA_G_o(2)
    );
\VGA_G_o[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(7),
      O => VGA_G_o(3)
    );
VGA_HS_o_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => delayed_h_pxl_count(8),
      I1 => delayed_h_pxl_count(10),
      I2 => delayed_h_pxl_count(9),
      I3 => VGA_HS_o_INST_0_i_1_n_0,
      O => VGA_HS_o
    );
VGA_HS_o_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA85557"
    )
        port map (
      I0 => delayed_h_pxl_count(6),
      I1 => delayed_h_pxl_count(5),
      I2 => delayed_h_pxl_count(4),
      I3 => delayed_h_pxl_count(3),
      I4 => delayed_h_pxl_count(7),
      O => VGA_HS_o_INST_0_i_1_n_0
    );
\VGA_R_o[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(8),
      O => VGA_R_o(0)
    );
\VGA_R_o[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(9),
      O => VGA_R_o(1)
    );
\VGA_R_o[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(10),
      O => VGA_R_o(2)
    );
\VGA_R_o[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A200"
    )
        port map (
      I0 => \VGA_R_o[3]_INST_0_i_1_n_0\,
      I1 => \ff_chain_reg_n_0_[1][9]\,
      I2 => \VGA_R_o[3]_INST_0_i_2_n_0\,
      I3 => Q(11),
      O => VGA_R_o(3)
    );
\VGA_R_o[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005557FFFF"
    )
        port map (
      I0 => delayed_h_pxl_count(8),
      I1 => delayed_h_pxl_count(5),
      I2 => delayed_h_pxl_count(6),
      I3 => delayed_h_pxl_count(7),
      I4 => delayed_h_pxl_count(9),
      I5 => delayed_h_pxl_count(10),
      O => \VGA_R_o[3]_INST_0_i_1_n_0\
    );
\VGA_R_o[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0101010101111111"
    )
        port map (
      I0 => \ff_chain_reg_n_0_[1][8]\,
      I1 => \ff_chain_reg_n_0_[1][7]\,
      I2 => \ff_chain_reg_n_0_[1][6]\,
      I3 => \ff_chain_reg_n_0_[1][4]\,
      I4 => \ff_chain_reg_n_0_[1][3]\,
      I5 => \ff_chain_reg_n_0_[1][5]\,
      O => \VGA_R_o[3]_INST_0_i_2_n_0\
    );
VGA_VS_o_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFBFFFFF"
    )
        port map (
      I0 => \ff_chain_reg_n_0_[1][5]\,
      I1 => \ff_chain_reg_n_0_[1][3]\,
      I2 => \ff_chain_reg_n_0_[1][4]\,
      I3 => \ff_chain_reg_n_0_[1][7]\,
      I4 => \ff_chain_reg_n_0_[1][6]\,
      I5 => VGA_VS_o_INST_0_i_1_n_0,
      O => VGA_VS_o
    );
VGA_VS_o_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDFDFDDF"
    )
        port map (
      I0 => \ff_chain_reg_n_0_[1][9]\,
      I1 => \ff_chain_reg_n_0_[1][8]\,
      I2 => \ff_chain_reg_n_0_[1][2]\,
      I3 => \ff_chain_reg_n_0_[1][0]\,
      I4 => \ff_chain_reg_n_0_[1][1]\,
      O => VGA_VS_o_INST_0_i_1_n_0
    );
\ff_chain_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(0),
      Q => \ff_chain_reg[0]\(0),
      R => reset_i
    );
\ff_chain_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(10),
      Q => \ff_chain_reg[0]\(13),
      R => reset_i
    );
\ff_chain_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(11),
      Q => \ff_chain_reg[0]\(14),
      R => reset_i
    );
\ff_chain_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(12),
      Q => \ff_chain_reg[0]\(15),
      R => reset_i
    );
\ff_chain_reg[0][16]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(13),
      Q => \ff_chain_reg[0]\(16),
      R => reset_i
    );
\ff_chain_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(14),
      Q => \ff_chain_reg[0]\(17),
      R => reset_i
    );
\ff_chain_reg[0][18]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(15),
      Q => \ff_chain_reg[0]\(18),
      R => reset_i
    );
\ff_chain_reg[0][19]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(16),
      Q => \ff_chain_reg[0]\(19),
      R => reset_i
    );
\ff_chain_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(1),
      Q => \ff_chain_reg[0]\(1),
      R => reset_i
    );
\ff_chain_reg[0][20]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(17),
      Q => \ff_chain_reg[0]\(20),
      R => reset_i
    );
\ff_chain_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(2),
      Q => \ff_chain_reg[0]\(2),
      R => reset_i
    );
\ff_chain_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(3),
      Q => \ff_chain_reg[0]\(3),
      R => reset_i
    );
\ff_chain_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(4),
      Q => \ff_chain_reg[0]\(4),
      R => reset_i
    );
\ff_chain_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(5),
      Q => \ff_chain_reg[0]\(5),
      R => reset_i
    );
\ff_chain_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(6),
      Q => \ff_chain_reg[0]\(6),
      R => reset_i
    );
\ff_chain_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(7),
      Q => \ff_chain_reg[0]\(7),
      R => reset_i
    );
\ff_chain_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(8),
      Q => \ff_chain_reg[0]\(8),
      R => reset_i
    );
\ff_chain_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => D(9),
      Q => \ff_chain_reg[0]\(9),
      R => reset_i
    );
\ff_chain_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(0),
      Q => \ff_chain_reg_n_0_[1][0]\,
      R => reset_i
    );
\ff_chain_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(13),
      Q => delayed_h_pxl_count(3),
      R => reset_i
    );
\ff_chain_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(14),
      Q => delayed_h_pxl_count(4),
      R => reset_i
    );
\ff_chain_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(15),
      Q => delayed_h_pxl_count(5),
      R => reset_i
    );
\ff_chain_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(16),
      Q => delayed_h_pxl_count(6),
      R => reset_i
    );
\ff_chain_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(17),
      Q => delayed_h_pxl_count(7),
      R => reset_i
    );
\ff_chain_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(18),
      Q => delayed_h_pxl_count(8),
      R => reset_i
    );
\ff_chain_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(19),
      Q => delayed_h_pxl_count(9),
      R => reset_i
    );
\ff_chain_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(1),
      Q => \ff_chain_reg_n_0_[1][1]\,
      R => reset_i
    );
\ff_chain_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(20),
      Q => delayed_h_pxl_count(10),
      R => reset_i
    );
\ff_chain_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(2),
      Q => \ff_chain_reg_n_0_[1][2]\,
      R => reset_i
    );
\ff_chain_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(3),
      Q => \ff_chain_reg_n_0_[1][3]\,
      R => reset_i
    );
\ff_chain_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(4),
      Q => \ff_chain_reg_n_0_[1][4]\,
      R => reset_i
    );
\ff_chain_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(5),
      Q => \ff_chain_reg_n_0_[1][5]\,
      R => reset_i
    );
\ff_chain_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(6),
      Q => \ff_chain_reg_n_0_[1][6]\,
      R => reset_i
    );
\ff_chain_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(7),
      Q => \ff_chain_reg_n_0_[1][7]\,
      R => reset_i
    );
\ff_chain_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(8),
      Q => \ff_chain_reg_n_0_[1][8]\,
      R => reset_i
    );
\ff_chain_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0]\(9),
      Q => \ff_chain_reg_n_0_[1][9]\,
      R => reset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_gpu_0_0_Latency__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 11 downto 0 );
    reset_i : in STD_LOGIC;
    \ff_chain_reg[0][11]_0\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    vga_clk_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_gpu_0_0_Latency__parameterized0\ : entity is "Latency";
end \design_1_gpu_0_0_Latency__parameterized0\;

architecture STRUCTURE of \design_1_gpu_0_0_Latency__parameterized0\ is
  signal \ff_chain_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][10]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][11]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][5]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][6]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][7]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][8]\ : STD_LOGIC;
  signal \ff_chain_reg_n_0_[0][9]\ : STD_LOGIC;
begin
\ff_chain_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(0),
      Q => \ff_chain_reg_n_0_[0][0]\,
      R => reset_i
    );
\ff_chain_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(10),
      Q => \ff_chain_reg_n_0_[0][10]\,
      R => reset_i
    );
\ff_chain_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(11),
      Q => \ff_chain_reg_n_0_[0][11]\,
      R => reset_i
    );
\ff_chain_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(1),
      Q => \ff_chain_reg_n_0_[0][1]\,
      R => reset_i
    );
\ff_chain_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(2),
      Q => \ff_chain_reg_n_0_[0][2]\,
      R => reset_i
    );
\ff_chain_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(3),
      Q => \ff_chain_reg_n_0_[0][3]\,
      R => reset_i
    );
\ff_chain_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(4),
      Q => \ff_chain_reg_n_0_[0][4]\,
      R => reset_i
    );
\ff_chain_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(5),
      Q => \ff_chain_reg_n_0_[0][5]\,
      R => reset_i
    );
\ff_chain_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(6),
      Q => \ff_chain_reg_n_0_[0][6]\,
      R => reset_i
    );
\ff_chain_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(7),
      Q => \ff_chain_reg_n_0_[0][7]\,
      R => reset_i
    );
\ff_chain_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(8),
      Q => \ff_chain_reg_n_0_[0][8]\,
      R => reset_i
    );
\ff_chain_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg[0][11]_0\(9),
      Q => \ff_chain_reg_n_0_[0][9]\,
      R => reset_i
    );
\ff_chain_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][0]\,
      Q => Q(0),
      R => reset_i
    );
\ff_chain_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][10]\,
      Q => Q(10),
      R => reset_i
    );
\ff_chain_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][11]\,
      Q => Q(11),
      R => reset_i
    );
\ff_chain_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][1]\,
      Q => Q(1),
      R => reset_i
    );
\ff_chain_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][2]\,
      Q => Q(2),
      R => reset_i
    );
\ff_chain_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][3]\,
      Q => Q(3),
      R => reset_i
    );
\ff_chain_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][4]\,
      Q => Q(4),
      R => reset_i
    );
\ff_chain_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][5]\,
      Q => Q(5),
      R => reset_i
    );
\ff_chain_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][6]\,
      Q => Q(6),
      R => reset_i
    );
\ff_chain_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][7]\,
      Q => Q(7),
      R => reset_i
    );
\ff_chain_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][8]\,
      Q => Q(8),
      R => reset_i
    );
\ff_chain_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => vga_clk_i,
      CE => '1',
      D => \ff_chain_reg_n_0_[0][9]\,
      Q => Q(9),
      R => reset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0_Palette is
  port (
    bram_addr_o : out STD_LOGIC_VECTOR ( 17 downto 0 );
    \argb_reg[11]_0\ : out STD_LOGIC_VECTOR ( 11 downto 0 );
    reset_i : in STD_LOGIC;
    gpu_clk_i : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    D : in STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_dout_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pixel_addr : in STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_gpu_0_0_Palette : entity is "Palette";
end design_1_gpu_0_0_Palette;

architecture STRUCTURE of design_1_gpu_0_0_Palette is
  signal argb0 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal argb_valid : STD_LOGIC;
  signal \^bram_addr_o\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal color_index_valid : STD_LOGIC;
  signal \delayed_bram_addr_reg_n_0_[0]\ : STD_LOGIC;
  signal \delayed_bram_addr_reg_n_0_[1]\ : STD_LOGIC;
  signal new_pixel : STD_LOGIC;
  signal \new_pixel_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \new_pixel_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \new_pixel_carry__0_n_3\ : STD_LOGIC;
  signal new_pixel_carry_i_1_n_0 : STD_LOGIC;
  signal new_pixel_carry_i_2_n_0 : STD_LOGIC;
  signal new_pixel_carry_i_3_n_0 : STD_LOGIC;
  signal new_pixel_carry_i_4_n_0 : STD_LOGIC;
  signal new_pixel_carry_n_0 : STD_LOGIC;
  signal new_pixel_carry_n_1 : STD_LOGIC;
  signal new_pixel_carry_n_2 : STD_LOGIC;
  signal new_pixel_carry_n_3 : STD_LOGIC;
  signal \pixel_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[10]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[11]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[12]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[13]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[14]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[15]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[16]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[4]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[5]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[6]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[7]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[8]\ : STD_LOGIC;
  signal \pixel_index_reg_n_0_[9]\ : STD_LOGIC;
  signal NLW_new_pixel_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_new_pixel_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_new_pixel_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bram_addr_o[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bram_addr_o[10]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bram_addr_o[11]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bram_addr_o[12]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bram_addr_o[13]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bram_addr_o[14]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bram_addr_o[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bram_addr_o[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bram_addr_o[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bram_addr_o[1]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bram_addr_o[2]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bram_addr_o[3]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bram_addr_o[4]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bram_addr_o[5]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bram_addr_o[6]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bram_addr_o[7]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bram_addr_o[8]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bram_addr_o[9]_INST_0\ : label is "soft_lutpair1";
begin
  bram_addr_o(17 downto 0) <= \^bram_addr_o\(17 downto 0);
\argb[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(18),
      I1 => bram_dout_i(10),
      I2 => bram_dout_i(2),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(26),
      O => argb0(10)
    );
\argb[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(19),
      I1 => bram_dout_i(11),
      I2 => bram_dout_i(3),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(27),
      O => argb0(11)
    );
\argb[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(16),
      I1 => bram_dout_i(8),
      I2 => bram_dout_i(0),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(24),
      O => argb0(8)
    );
\argb[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(17),
      I1 => bram_dout_i(9),
      I2 => bram_dout_i(1),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(25),
      O => argb0(9)
    );
\argb_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(0),
      Q => \argb_reg[11]_0\(0),
      R => reset_i
    );
\argb_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(10),
      Q => \argb_reg[11]_0\(10),
      R => reset_i
    );
\argb_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(11),
      Q => \argb_reg[11]_0\(11),
      R => reset_i
    );
\argb_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(1),
      Q => \argb_reg[11]_0\(1),
      R => reset_i
    );
\argb_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(2),
      Q => \argb_reg[11]_0\(2),
      R => reset_i
    );
\argb_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(3),
      Q => \argb_reg[11]_0\(3),
      R => reset_i
    );
\argb_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(4),
      Q => \argb_reg[11]_0\(4),
      R => reset_i
    );
\argb_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(5),
      Q => \argb_reg[11]_0\(5),
      R => reset_i
    );
\argb_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(6),
      Q => \argb_reg[11]_0\(6),
      R => reset_i
    );
\argb_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(7),
      Q => \argb_reg[11]_0\(7),
      R => reset_i
    );
\argb_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(8),
      Q => \argb_reg[11]_0\(8),
      R => reset_i
    );
\argb_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => argb_valid,
      D => argb0(9),
      Q => \argb_reg[11]_0\(9),
      R => reset_i
    );
argb_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => color_index_valid,
      Q => argb_valid,
      R => reset_i
    );
\bram_addr_o[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => Q(0),
      O => \^bram_addr_o\(0)
    );
\bram_addr_o[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(2),
      O => \^bram_addr_o\(10)
    );
\bram_addr_o[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(3),
      O => \^bram_addr_o\(11)
    );
\bram_addr_o[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(4),
      O => \^bram_addr_o\(12)
    );
\bram_addr_o[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(5),
      O => \^bram_addr_o\(13)
    );
\bram_addr_o[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(6),
      O => \^bram_addr_o\(14)
    );
\bram_addr_o[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(7),
      O => \^bram_addr_o\(15)
    );
\bram_addr_o[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(8),
      O => \^bram_addr_o\(16)
    );
\bram_addr_o[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(9),
      O => \^bram_addr_o\(17)
    );
\bram_addr_o[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => Q(1),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(0),
      O => \^bram_addr_o\(1)
    );
\bram_addr_o[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(8),
      I1 => bram_dout_i(0),
      I2 => bram_dout_i(24),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(16),
      O => argb0(0)
    );
\bram_addr_o[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => Q(2),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(1),
      O => \^bram_addr_o\(2)
    );
\bram_addr_o[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(9),
      I1 => bram_dout_i(1),
      I2 => bram_dout_i(25),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(17),
      O => argb0(1)
    );
\bram_addr_o[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => Q(3),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(2),
      O => \^bram_addr_o\(3)
    );
\bram_addr_o[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(10),
      I1 => bram_dout_i(2),
      I2 => bram_dout_i(26),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(18),
      O => argb0(2)
    );
\bram_addr_o[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => D(0),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(3),
      O => \^bram_addr_o\(4)
    );
\bram_addr_o[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(11),
      I1 => bram_dout_i(3),
      I2 => bram_dout_i(27),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(19),
      O => argb0(3)
    );
\bram_addr_o[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => D(1),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(4),
      O => \^bram_addr_o\(5)
    );
\bram_addr_o[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(12),
      I1 => bram_dout_i(4),
      I2 => bram_dout_i(28),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(20),
      O => argb0(4)
    );
\bram_addr_o[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => D(2),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(5),
      O => \^bram_addr_o\(6)
    );
\bram_addr_o[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(13),
      I1 => bram_dout_i(5),
      I2 => bram_dout_i(29),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(21),
      O => argb0(5)
    );
\bram_addr_o[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => D(3),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(6),
      O => \^bram_addr_o\(7)
    );
\bram_addr_o[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(14),
      I1 => bram_dout_i(6),
      I2 => bram_dout_i(30),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(22),
      O => argb0(6)
    );
\bram_addr_o[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => pixel_addr(0),
      I1 => new_pixel,
      I2 => color_index_valid,
      I3 => argb0(7),
      O => \^bram_addr_o\(8)
    );
\bram_addr_o[8]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => bram_dout_i(15),
      I1 => bram_dout_i(7),
      I2 => bram_dout_i(31),
      I3 => \delayed_bram_addr_reg_n_0_[1]\,
      I4 => \delayed_bram_addr_reg_n_0_[0]\,
      I5 => bram_dout_i(23),
      O => argb0(7)
    );
\bram_addr_o[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => new_pixel,
      I1 => pixel_addr(1),
      O => \^bram_addr_o\(9)
    );
color_index_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => new_pixel,
      Q => color_index_valid,
      R => reset_i
    );
\delayed_bram_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => \^bram_addr_o\(0),
      Q => \delayed_bram_addr_reg_n_0_[0]\,
      R => reset_i
    );
\delayed_bram_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => \^bram_addr_o\(1),
      Q => \delayed_bram_addr_reg_n_0_[1]\,
      R => reset_i
    );
new_pixel_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => new_pixel_carry_n_0,
      CO(2) => new_pixel_carry_n_1,
      CO(1) => new_pixel_carry_n_2,
      CO(0) => new_pixel_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => NLW_new_pixel_carry_O_UNCONNECTED(3 downto 0),
      S(3) => new_pixel_carry_i_1_n_0,
      S(2) => new_pixel_carry_i_2_n_0,
      S(1) => new_pixel_carry_i_3_n_0,
      S(0) => new_pixel_carry_i_4_n_0
    );
\new_pixel_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => new_pixel_carry_n_0,
      CO(3 downto 2) => \NLW_new_pixel_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => new_pixel,
      CO(0) => \new_pixel_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0011",
      O(3 downto 0) => \NLW_new_pixel_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \new_pixel_carry__0_i_1_n_0\,
      S(0) => \new_pixel_carry__0_i_2_n_0\
    );
\new_pixel_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[15]\,
      I1 => D(11),
      I2 => \pixel_index_reg_n_0_[16]\,
      I3 => D(12),
      O => \new_pixel_carry__0_i_1_n_0\
    );
\new_pixel_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[12]\,
      I1 => D(8),
      I2 => D(10),
      I3 => \pixel_index_reg_n_0_[14]\,
      I4 => D(9),
      I5 => \pixel_index_reg_n_0_[13]\,
      O => \new_pixel_carry__0_i_2_n_0\
    );
new_pixel_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[9]\,
      I1 => D(5),
      I2 => D(7),
      I3 => \pixel_index_reg_n_0_[11]\,
      I4 => D(6),
      I5 => \pixel_index_reg_n_0_[10]\,
      O => new_pixel_carry_i_1_n_0
    );
new_pixel_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[6]\,
      I1 => D(2),
      I2 => D(4),
      I3 => \pixel_index_reg_n_0_[8]\,
      I4 => D(3),
      I5 => \pixel_index_reg_n_0_[7]\,
      O => new_pixel_carry_i_2_n_0
    );
new_pixel_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[3]\,
      I1 => Q(3),
      I2 => D(1),
      I3 => \pixel_index_reg_n_0_[5]\,
      I4 => D(0),
      I5 => \pixel_index_reg_n_0_[4]\,
      O => new_pixel_carry_i_3_n_0
    );
new_pixel_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \pixel_index_reg_n_0_[0]\,
      I1 => Q(0),
      I2 => Q(2),
      I3 => \pixel_index_reg_n_0_[2]\,
      I4 => Q(1),
      I5 => \pixel_index_reg_n_0_[1]\,
      O => new_pixel_carry_i_4_n_0
    );
\pixel_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => Q(0),
      Q => \pixel_index_reg_n_0_[0]\,
      R => reset_i
    );
\pixel_index_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(6),
      Q => \pixel_index_reg_n_0_[10]\,
      R => reset_i
    );
\pixel_index_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(7),
      Q => \pixel_index_reg_n_0_[11]\,
      R => reset_i
    );
\pixel_index_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(8),
      Q => \pixel_index_reg_n_0_[12]\,
      R => reset_i
    );
\pixel_index_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(9),
      Q => \pixel_index_reg_n_0_[13]\,
      R => reset_i
    );
\pixel_index_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(10),
      Q => \pixel_index_reg_n_0_[14]\,
      R => reset_i
    );
\pixel_index_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(11),
      Q => \pixel_index_reg_n_0_[15]\,
      R => reset_i
    );
\pixel_index_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(12),
      Q => \pixel_index_reg_n_0_[16]\,
      R => reset_i
    );
\pixel_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => Q(1),
      Q => \pixel_index_reg_n_0_[1]\,
      R => reset_i
    );
\pixel_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => Q(2),
      Q => \pixel_index_reg_n_0_[2]\,
      R => reset_i
    );
\pixel_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => Q(3),
      Q => \pixel_index_reg_n_0_[3]\,
      R => reset_i
    );
\pixel_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(0),
      Q => \pixel_index_reg_n_0_[4]\,
      R => reset_i
    );
\pixel_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(1),
      Q => \pixel_index_reg_n_0_[5]\,
      R => reset_i
    );
\pixel_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(2),
      Q => \pixel_index_reg_n_0_[6]\,
      R => reset_i
    );
\pixel_index_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(3),
      Q => \pixel_index_reg_n_0_[7]\,
      R => reset_i
    );
\pixel_index_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(4),
      Q => \pixel_index_reg_n_0_[8]\,
      R => reset_i
    );
\pixel_index_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => gpu_clk_i,
      CE => '1',
      D => D(5),
      Q => \pixel_index_reg_n_0_[9]\,
      R => reset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0_VgaController is
  port (
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \count_o_reg[6]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_o_reg[8]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_o_reg[10]\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    D : out STD_LOGIC_VECTOR ( 12 downto 0 );
    pixel_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \count_o_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_o_reg[9]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    VGA_HS_o : out STD_LOGIC;
    reset_i : in STD_LOGIC;
    pixel_index0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \pixel_index_reg[7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \pixel_index_reg[11]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \pixel_index0__25_carry__1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    vga_clk_i : in STD_LOGIC;
    \ff_chain_reg[0][11]\ : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_gpu_0_0_VgaController : entity is "VgaController";
end design_1_gpu_0_0_VgaController;

architecture STRUCTURE of design_1_gpu_0_0_VgaController is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^s\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^count_o_reg[10]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal double_flop_pxl_color_n_0 : STD_LOGIC;
  signal double_flop_pxl_color_n_1 : STD_LOGIC;
  signal double_flop_pxl_color_n_10 : STD_LOGIC;
  signal double_flop_pxl_color_n_11 : STD_LOGIC;
  signal double_flop_pxl_color_n_2 : STD_LOGIC;
  signal double_flop_pxl_color_n_3 : STD_LOGIC;
  signal double_flop_pxl_color_n_4 : STD_LOGIC;
  signal double_flop_pxl_color_n_5 : STD_LOGIC;
  signal double_flop_pxl_color_n_6 : STD_LOGIC;
  signal double_flop_pxl_color_n_7 : STD_LOGIC;
  signal double_flop_pxl_color_n_8 : STD_LOGIC;
  signal double_flop_pxl_color_n_9 : STD_LOGIC;
  signal h_counter_end : STD_LOGIC;
  signal vga_v_pxl_index : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  S(3 downto 0) <= \^s\(3 downto 0);
  \count_o_reg[10]\(9 downto 0) <= \^count_o_reg[10]\(9 downto 0);
delay_pxl_count: entity work.design_1_gpu_0_0_Latency
     port map (
      D(17 downto 10) => \^count_o_reg[10]\(9 downto 2),
      D(9 downto 2) => \^q\(7 downto 0),
      D(1) => \^s\(0),
      D(0) => vga_v_pxl_index(0),
      Q(11) => double_flop_pxl_color_n_0,
      Q(10) => double_flop_pxl_color_n_1,
      Q(9) => double_flop_pxl_color_n_2,
      Q(8) => double_flop_pxl_color_n_3,
      Q(7) => double_flop_pxl_color_n_4,
      Q(6) => double_flop_pxl_color_n_5,
      Q(5) => double_flop_pxl_color_n_6,
      Q(4) => double_flop_pxl_color_n_7,
      Q(3) => double_flop_pxl_color_n_8,
      Q(2) => double_flop_pxl_color_n_9,
      Q(1) => double_flop_pxl_color_n_10,
      Q(0) => double_flop_pxl_color_n_11,
      VGA_B_o(3 downto 0) => VGA_B_o(3 downto 0),
      VGA_G_o(3 downto 0) => VGA_G_o(3 downto 0),
      VGA_HS_o => VGA_HS_o,
      VGA_R_o(3 downto 0) => VGA_R_o(3 downto 0),
      VGA_VS_o => VGA_VS_o,
      reset_i => reset_i,
      vga_clk_i => vga_clk_i
    );
double_flop_pxl_color: entity work.\design_1_gpu_0_0_Latency__parameterized0\
     port map (
      Q(11) => double_flop_pxl_color_n_0,
      Q(10) => double_flop_pxl_color_n_1,
      Q(9) => double_flop_pxl_color_n_2,
      Q(8) => double_flop_pxl_color_n_3,
      Q(7) => double_flop_pxl_color_n_4,
      Q(6) => double_flop_pxl_color_n_5,
      Q(5) => double_flop_pxl_color_n_6,
      Q(4) => double_flop_pxl_color_n_7,
      Q(3) => double_flop_pxl_color_n_8,
      Q(2) => double_flop_pxl_color_n_9,
      Q(1) => double_flop_pxl_color_n_10,
      Q(0) => double_flop_pxl_color_n_11,
      \ff_chain_reg[0][11]_0\(11 downto 0) => \ff_chain_reg[0][11]\(11 downto 0),
      reset_i => reset_i,
      vga_clk_i => vga_clk_i
    );
h_pxl_counter: entity work.design_1_gpu_0_0_Counter
     port map (
      D(12 downto 0) => D(12 downto 0),
      E(0) => h_counter_end,
      Q(9 downto 0) => \^count_o_reg[10]\(9 downto 0),
      pixel_addr(9 downto 0) => pixel_addr(9 downto 0),
      pixel_index0(12 downto 0) => pixel_index0(12 downto 0),
      \pixel_index_reg[11]\(1 downto 0) => \pixel_index_reg[11]\(1 downto 0),
      \pixel_index_reg[7]\(3 downto 0) => \pixel_index_reg[7]\(3 downto 0),
      reset_i => reset_i,
      vga_clk_i => vga_clk_i
    );
v_pxl_counter: entity work.\design_1_gpu_0_0_Counter__parameterized0\
     port map (
      E(0) => h_counter_end,
      O(3 downto 0) => O(3 downto 0),
      Q(8 downto 1) => \^q\(7 downto 0),
      Q(0) => vga_v_pxl_index(0),
      S(3 downto 0) => \^s\(3 downto 0),
      \count_o_reg[6]_0\(3 downto 0) => \count_o_reg[6]\(3 downto 0),
      \count_o_reg[7]_0\(3 downto 0) => \count_o_reg[7]\(3 downto 0),
      \count_o_reg[8]_0\(1 downto 0) => \count_o_reg[8]\(1 downto 0),
      \count_o_reg[9]_0\(1 downto 0) => \count_o_reg[9]\(1 downto 0),
      \pixel_index0__25_carry__1\(1 downto 0) => \pixel_index0__25_carry__1\(1 downto 0),
      reset_i => reset_i,
      vga_clk_i => vga_clk_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0_gpu is
  port (
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_o : out STD_LOGIC_VECTOR ( 17 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    VGA_HS_o : out STD_LOGIC;
    reset_i : in STD_LOGIC;
    vga_clk_i : in STD_LOGIC;
    gpu_clk_i : in STD_LOGIC;
    bram_dout_i : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_gpu_0_0_gpu : entity is "gpu";
end design_1_gpu_0_0_gpu;

architecture STRUCTURE of design_1_gpu_0_0_gpu is
  signal C : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal argb : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \bram_addr_o[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \bram_addr_o[7]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal pixel_addr : STD_LOGIC_VECTOR ( 17 downto 8 );
  signal pixel_index : STD_LOGIC_VECTOR ( 16 downto 4 );
  signal pixel_index0 : STD_LOGIC_VECTOR ( 16 downto 4 );
  signal \pixel_index0__25_carry__0_n_0\ : STD_LOGIC;
  signal \pixel_index0__25_carry__0_n_1\ : STD_LOGIC;
  signal \pixel_index0__25_carry__0_n_2\ : STD_LOGIC;
  signal \pixel_index0__25_carry__0_n_3\ : STD_LOGIC;
  signal \pixel_index0__25_carry__1_n_0\ : STD_LOGIC;
  signal \pixel_index0__25_carry__1_n_1\ : STD_LOGIC;
  signal \pixel_index0__25_carry__1_n_2\ : STD_LOGIC;
  signal \pixel_index0__25_carry__1_n_3\ : STD_LOGIC;
  signal \pixel_index0__25_carry__2_n_3\ : STD_LOGIC;
  signal \pixel_index0__25_carry_n_0\ : STD_LOGIC;
  signal \pixel_index0__25_carry_n_1\ : STD_LOGIC;
  signal \pixel_index0__25_carry_n_2\ : STD_LOGIC;
  signal \pixel_index0__25_carry_n_3\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_0\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_1\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_2\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_3\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_4\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_5\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_6\ : STD_LOGIC;
  signal \pixel_index0_carry__0_n_7\ : STD_LOGIC;
  signal \pixel_index0_carry__1_n_3\ : STD_LOGIC;
  signal \pixel_index0_carry__1_n_6\ : STD_LOGIC;
  signal \pixel_index0_carry__1_n_7\ : STD_LOGIC;
  signal pixel_index0_carry_n_0 : STD_LOGIC;
  signal pixel_index0_carry_n_1 : STD_LOGIC;
  signal pixel_index0_carry_n_2 : STD_LOGIC;
  signal pixel_index0_carry_n_3 : STD_LOGIC;
  signal pixel_index0_carry_n_4 : STD_LOGIC;
  signal pixel_index0_carry_n_5 : STD_LOGIC;
  signal pixel_index0_carry_n_6 : STD_LOGIC;
  signal pixel_index0_carry_n_7 : STD_LOGIC;
  signal \pixel_index[11]_i_2_n_0\ : STD_LOGIC;
  signal \pixel_index[11]_i_3_n_0\ : STD_LOGIC;
  signal vga_n_0 : STD_LOGIC;
  signal vga_n_1 : STD_LOGIC;
  signal vga_n_12 : STD_LOGIC;
  signal vga_n_13 : STD_LOGIC;
  signal vga_n_14 : STD_LOGIC;
  signal vga_n_15 : STD_LOGIC;
  signal vga_n_16 : STD_LOGIC;
  signal vga_n_17 : STD_LOGIC;
  signal vga_n_2 : STD_LOGIC;
  signal vga_n_63 : STD_LOGIC;
  signal vga_n_64 : STD_LOGIC;
  signal vga_n_65 : STD_LOGIC;
  signal vga_n_66 : STD_LOGIC;
  signal vga_n_67 : STD_LOGIC;
  signal vga_n_68 : STD_LOGIC;
  signal vga_v_pxl_index : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \NLW_pixel_index0__25_carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_pixel_index0__25_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pixel_index0__25_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_pixel_index0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pixel_index0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
\bram_addr_o[7]_INST_0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(7),
      I1 => C(7),
      O => \bram_addr_o[7]_INST_0_i_3_n_0\
    );
\bram_addr_o[7]_INST_0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(6),
      I1 => C(6),
      O => \bram_addr_o[7]_INST_0_i_4_n_0\
    );
\bram_addr_o[7]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(5),
      I1 => C(5),
      O => \bram_addr_o[7]_INST_0_i_5_n_0\
    );
\bram_addr_o[7]_INST_0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(4),
      I1 => C(4),
      O => \bram_addr_o[7]_INST_0_i_6_n_0\
    );
color_palette: entity work.design_1_gpu_0_0_Palette
     port map (
      D(12 downto 0) => pixel_index(16 downto 4),
      Q(3 downto 0) => C(3 downto 0),
      \argb_reg[11]_0\(11 downto 0) => argb(11 downto 0),
      bram_addr_o(17 downto 0) => bram_addr_o(17 downto 0),
      bram_dout_i(31 downto 0) => bram_dout_i(31 downto 0),
      gpu_clk_i => gpu_clk_i,
      pixel_addr(9 downto 0) => pixel_addr(17 downto 8),
      reset_i => reset_i
    );
\pixel_index0__25_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pixel_index0__25_carry_n_0\,
      CO(2) => \pixel_index0__25_carry_n_1\,
      CO(1) => \pixel_index0__25_carry_n_2\,
      CO(0) => \pixel_index0__25_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => vga_v_pxl_index(3 downto 1),
      DI(0) => '0',
      O(3 downto 1) => pixel_index0(6 downto 4),
      O(0) => \NLW_pixel_index0__25_carry_O_UNCONNECTED\(0),
      S(3 downto 1) => vga_v_pxl_index(3 downto 1),
      S(0) => '0'
    );
\pixel_index0__25_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index0__25_carry_n_0\,
      CO(3) => \pixel_index0__25_carry__0_n_0\,
      CO(2) => \pixel_index0__25_carry__0_n_1\,
      CO(1) => \pixel_index0__25_carry__0_n_2\,
      CO(0) => \pixel_index0__25_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => vga_v_pxl_index(7 downto 4),
      O(3 downto 0) => pixel_index0(10 downto 7),
      S(3) => vga_n_63,
      S(2) => vga_n_64,
      S(1) => vga_n_65,
      S(0) => vga_n_66
    );
\pixel_index0__25_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index0__25_carry__0_n_0\,
      CO(3) => \pixel_index0__25_carry__1_n_0\,
      CO(2) => \pixel_index0__25_carry__1_n_1\,
      CO(1) => \pixel_index0__25_carry__1_n_2\,
      CO(0) => \pixel_index0__25_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => vga_v_pxl_index(9 downto 8),
      O(3 downto 0) => pixel_index0(14 downto 11),
      S(3) => \pixel_index0_carry__0_n_4\,
      S(2) => \pixel_index0_carry__0_n_5\,
      S(1) => vga_n_67,
      S(0) => vga_n_68
    );
\pixel_index0__25_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index0__25_carry__1_n_0\,
      CO(3 downto 1) => \NLW_pixel_index0__25_carry__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pixel_index0__25_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_pixel_index0__25_carry__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => pixel_index0(16 downto 15),
      S(3 downto 2) => B"00",
      S(1) => \pixel_index0_carry__1_n_6\,
      S(0) => \pixel_index0_carry__1_n_7\
    );
pixel_index0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pixel_index0_carry_n_0,
      CO(2) => pixel_index0_carry_n_1,
      CO(1) => pixel_index0_carry_n_2,
      CO(0) => pixel_index0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => vga_v_pxl_index(2 downto 1),
      DI(1 downto 0) => B"01",
      O(3) => pixel_index0_carry_n_4,
      O(2) => pixel_index0_carry_n_5,
      O(1) => pixel_index0_carry_n_6,
      O(0) => pixel_index0_carry_n_7,
      S(3) => vga_n_0,
      S(2) => vga_n_1,
      S(1) => vga_n_2,
      S(0) => vga_v_pxl_index(1)
    );
\pixel_index0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => pixel_index0_carry_n_0,
      CO(3) => \pixel_index0_carry__0_n_0\,
      CO(2) => \pixel_index0_carry__0_n_1\,
      CO(1) => \pixel_index0_carry__0_n_2\,
      CO(0) => \pixel_index0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => vga_v_pxl_index(6 downto 3),
      O(3) => \pixel_index0_carry__0_n_4\,
      O(2) => \pixel_index0_carry__0_n_5\,
      O(1) => \pixel_index0_carry__0_n_6\,
      O(0) => \pixel_index0_carry__0_n_7\,
      S(3) => vga_n_12,
      S(2) => vga_n_13,
      S(1) => vga_n_14,
      S(0) => vga_n_15
    );
\pixel_index0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_index0_carry__0_n_0\,
      CO(3 downto 1) => \NLW_pixel_index0_carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pixel_index0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => vga_v_pxl_index(7),
      O(3 downto 2) => \NLW_pixel_index0_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \pixel_index0_carry__1_n_6\,
      O(0) => \pixel_index0_carry__1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => vga_n_16,
      S(0) => vga_n_17
    );
\pixel_index[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(9),
      I1 => C(9),
      O => \pixel_index[11]_i_2_n_0\
    );
\pixel_index[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pixel_index0(8),
      I1 => C(8),
      O => \pixel_index[11]_i_3_n_0\
    );
vga: entity work.design_1_gpu_0_0_VgaController
     port map (
      D(12 downto 0) => pixel_index(16 downto 4),
      O(3) => pixel_index0_carry_n_4,
      O(2) => pixel_index0_carry_n_5,
      O(1) => pixel_index0_carry_n_6,
      O(0) => pixel_index0_carry_n_7,
      Q(7 downto 0) => vga_v_pxl_index(9 downto 2),
      S(3) => vga_n_0,
      S(2) => vga_n_1,
      S(1) => vga_n_2,
      S(0) => vga_v_pxl_index(1),
      VGA_B_o(3 downto 0) => VGA_B_o(3 downto 0),
      VGA_G_o(3 downto 0) => VGA_G_o(3 downto 0),
      VGA_HS_o => VGA_HS_o,
      VGA_R_o(3 downto 0) => VGA_R_o(3 downto 0),
      VGA_VS_o => VGA_VS_o,
      \count_o_reg[10]\(9 downto 0) => C(9 downto 0),
      \count_o_reg[6]\(3) => vga_n_12,
      \count_o_reg[6]\(2) => vga_n_13,
      \count_o_reg[6]\(1) => vga_n_14,
      \count_o_reg[6]\(0) => vga_n_15,
      \count_o_reg[7]\(3) => vga_n_63,
      \count_o_reg[7]\(2) => vga_n_64,
      \count_o_reg[7]\(1) => vga_n_65,
      \count_o_reg[7]\(0) => vga_n_66,
      \count_o_reg[8]\(1) => vga_n_16,
      \count_o_reg[8]\(0) => vga_n_17,
      \count_o_reg[9]\(1) => vga_n_67,
      \count_o_reg[9]\(0) => vga_n_68,
      \ff_chain_reg[0][11]\(11 downto 0) => argb(11 downto 0),
      pixel_addr(9 downto 0) => pixel_addr(17 downto 8),
      pixel_index0(12 downto 0) => pixel_index0(16 downto 4),
      \pixel_index0__25_carry__1\(1) => \pixel_index0_carry__0_n_6\,
      \pixel_index0__25_carry__1\(0) => \pixel_index0_carry__0_n_7\,
      \pixel_index_reg[11]\(1) => \pixel_index[11]_i_2_n_0\,
      \pixel_index_reg[11]\(0) => \pixel_index[11]_i_3_n_0\,
      \pixel_index_reg[7]\(3) => \bram_addr_o[7]_INST_0_i_3_n_0\,
      \pixel_index_reg[7]\(2) => \bram_addr_o[7]_INST_0_i_4_n_0\,
      \pixel_index_reg[7]\(1) => \bram_addr_o[7]_INST_0_i_5_n_0\,
      \pixel_index_reg[7]\(0) => \bram_addr_o[7]_INST_0_i_6_n_0\,
      reset_i => reset_i,
      vga_clk_i => vga_clk_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_gpu_0_0 is
  port (
    gpu_clk_i : in STD_LOGIC;
    reset_i : in STD_LOGIC;
    bram_clk_o : out STD_LOGIC;
    bram_rst_o : out STD_LOGIC;
    bram_en_o : out STD_LOGIC;
    bram_addr_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_dout_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_din_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_we_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_clk_i : in STD_LOGIC;
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_HS_o : out STD_LOGIC;
    VGA_VS_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_gpu_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_gpu_0_0 : entity is "design_1_gpu_0_0,gpu,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_gpu_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_gpu_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_gpu_0_0 : entity is "gpu,Vivado 2024.2";
end design_1_gpu_0_0;

architecture STRUCTURE of design_1_gpu_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^bram_addr_o\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \^gpu_clk_i\ : STD_LOGIC;
  signal \^reset_i\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset_i : signal is "xilinx.com:signal:reset:1.0 reset_i RST";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of reset_i : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset_i : signal is "XIL_INTERFACENAME reset_i, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
begin
  \^gpu_clk_i\ <= gpu_clk_i;
  \^reset_i\ <= reset_i;
  bram_addr_o(31) <= \<const0>\;
  bram_addr_o(30) <= \<const0>\;
  bram_addr_o(29) <= \<const0>\;
  bram_addr_o(28) <= \<const0>\;
  bram_addr_o(27) <= \<const0>\;
  bram_addr_o(26) <= \<const0>\;
  bram_addr_o(25) <= \<const0>\;
  bram_addr_o(24) <= \<const0>\;
  bram_addr_o(23) <= \<const0>\;
  bram_addr_o(22) <= \<const0>\;
  bram_addr_o(21) <= \<const0>\;
  bram_addr_o(20) <= \<const0>\;
  bram_addr_o(19) <= \<const0>\;
  bram_addr_o(18) <= \<const0>\;
  bram_addr_o(17 downto 0) <= \^bram_addr_o\(17 downto 0);
  bram_clk_o <= \^gpu_clk_i\;
  bram_din_o(31) <= \<const0>\;
  bram_din_o(30) <= \<const0>\;
  bram_din_o(29) <= \<const0>\;
  bram_din_o(28) <= \<const0>\;
  bram_din_o(27) <= \<const0>\;
  bram_din_o(26) <= \<const0>\;
  bram_din_o(25) <= \<const0>\;
  bram_din_o(24) <= \<const0>\;
  bram_din_o(23) <= \<const0>\;
  bram_din_o(22) <= \<const0>\;
  bram_din_o(21) <= \<const0>\;
  bram_din_o(20) <= \<const0>\;
  bram_din_o(19) <= \<const0>\;
  bram_din_o(18) <= \<const0>\;
  bram_din_o(17) <= \<const0>\;
  bram_din_o(16) <= \<const0>\;
  bram_din_o(15) <= \<const0>\;
  bram_din_o(14) <= \<const0>\;
  bram_din_o(13) <= \<const0>\;
  bram_din_o(12) <= \<const0>\;
  bram_din_o(11) <= \<const0>\;
  bram_din_o(10) <= \<const0>\;
  bram_din_o(9) <= \<const0>\;
  bram_din_o(8) <= \<const0>\;
  bram_din_o(7) <= \<const0>\;
  bram_din_o(6) <= \<const0>\;
  bram_din_o(5) <= \<const0>\;
  bram_din_o(4) <= \<const0>\;
  bram_din_o(3) <= \<const0>\;
  bram_din_o(2) <= \<const0>\;
  bram_din_o(1) <= \<const0>\;
  bram_din_o(0) <= \<const0>\;
  bram_en_o <= \<const1>\;
  bram_rst_o <= \^reset_i\;
  bram_we_o(3) <= \<const0>\;
  bram_we_o(2) <= \<const0>\;
  bram_we_o(1) <= \<const0>\;
  bram_we_o(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.design_1_gpu_0_0_gpu
     port map (
      VGA_B_o(3 downto 0) => VGA_B_o(3 downto 0),
      VGA_G_o(3 downto 0) => VGA_G_o(3 downto 0),
      VGA_HS_o => VGA_HS_o,
      VGA_R_o(3 downto 0) => VGA_R_o(3 downto 0),
      VGA_VS_o => VGA_VS_o,
      bram_addr_o(17 downto 0) => \^bram_addr_o\(17 downto 0),
      bram_dout_i(31 downto 0) => bram_dout_i(31 downto 0),
      gpu_clk_i => \^gpu_clk_i\,
      reset_i => \^reset_i\,
      vga_clk_i => vga_clk_i
    );
end STRUCTURE;
