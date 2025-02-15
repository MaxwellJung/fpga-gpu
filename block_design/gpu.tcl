
################################################################
# This is a generated script based on design: gpu
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source gpu_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# GpuControllerWrapper

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys-a7-100t:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name gpu

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:blk_mem_gen:8.4\
xilinx.com:ip:fifo_generator:13.2\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
GpuControllerWrapper\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set S_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {150000000} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S_AXI


  # Create ports
  set VGA_RGB [ create_bd_port -dir O -from 11 -to 0 VGA_RGB ]
  set gpu_clk_i [ create_bd_port -dir I gpu_clk_i ]
  set reset_i [ create_bd_port -dir I -type rst reset_i ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset_i
  set s_axi_aclk [ create_bd_port -dir I -type clk -freq_hz 150000000 s_axi_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXI} \
   CONFIG.ASSOCIATED_RESET {s_axi_aresetn} \
 ] $s_axi_aclk
  set s_axi_aresetn [ create_bd_port -dir I -type rst s_axi_aresetn ]
  set vga_clk_i [ create_bd_port -dir I vga_clk_i ]
  set VGA_HS [ create_bd_port -dir O VGA_HS ]
  set VGA_VS [ create_bd_port -dir O VGA_VS ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property CONFIG.SINGLE_PORT_BRAM {1} $axi_bram_ctrl_0


  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [list \
    CONFIG.Enable_32bit_Address {true} \
    CONFIG.Memory_Type {True_Dual_Port_RAM} \
    CONFIG.use_bram_block {BRAM_Controller} \
  ] $blk_mem_gen_0


  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 ]
  set_property -dict [list \
    CONFIG.Almost_Empty_Flag {true} \
    CONFIG.Almost_Full_Flag {true} \
    CONFIG.Empty_Threshold_Assert_Value {5} \
    CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM} \
    CONFIG.Full_Threshold_Assert_Value {252} \
    CONFIG.Input_Data_Width {8} \
    CONFIG.Input_Depth {256} \
    CONFIG.Programmable_Empty_Type {Single_Programmable_Empty_Threshold_Constant} \
    CONFIG.Programmable_Full_Type {Single_Programmable_Full_Threshold_Constant} \
  ] $fifo_generator_0


  # Create instance: GpuControllerWrapper_0, and set properties
  set block_name GpuControllerWrapper
  set block_cell_name GpuControllerWrapper_0
  if { [catch {set GpuControllerWrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $GpuControllerWrapper_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_riscv_0_axi_periph_M05_AXI [get_bd_intf_ports S_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]

  # Create port connections
  connect_bd_net -net GpuControllerWrapper_0_VGA_HS  [get_bd_pins GpuControllerWrapper_0/VGA_HS] \
  [get_bd_ports VGA_HS]
  connect_bd_net -net GpuControllerWrapper_0_VGA_RGB  [get_bd_pins GpuControllerWrapper_0/VGA_RGB] \
  [get_bd_ports VGA_RGB]
  connect_bd_net -net GpuControllerWrapper_0_VGA_VS  [get_bd_pins GpuControllerWrapper_0/VGA_VS] \
  [get_bd_ports VGA_VS]
  connect_bd_net -net GpuControllerWrapper_0_bram_addr_o  [get_bd_pins GpuControllerWrapper_0/bram_addr_o] \
  [get_bd_pins blk_mem_gen_0/addrb]
  connect_bd_net -net GpuControllerWrapper_0_bram_clk_o  [get_bd_pins GpuControllerWrapper_0/bram_clk_o] \
  [get_bd_pins blk_mem_gen_0/clkb]
  connect_bd_net -net GpuControllerWrapper_0_bram_din_o  [get_bd_pins GpuControllerWrapper_0/bram_din_o] \
  [get_bd_pins blk_mem_gen_0/dinb]
  connect_bd_net -net GpuControllerWrapper_0_bram_en_o  [get_bd_pins GpuControllerWrapper_0/bram_en_o] \
  [get_bd_pins blk_mem_gen_0/enb]
  connect_bd_net -net GpuControllerWrapper_0_bram_rst_o  [get_bd_pins GpuControllerWrapper_0/bram_rst_o] \
  [get_bd_pins blk_mem_gen_0/rstb]
  connect_bd_net -net GpuControllerWrapper_0_bram_we_o  [get_bd_pins GpuControllerWrapper_0/bram_we_o] \
  [get_bd_pins blk_mem_gen_0/web]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_rd_clk_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_rd_clk_o] \
  [get_bd_pins fifo_generator_0/rd_clk]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_rd_en_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_rd_en_o] \
  [get_bd_pins fifo_generator_0/rd_en]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_reset_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_reset_o] \
  [get_bd_pins fifo_generator_0/rst]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_wr_clk_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_wr_clk_o] \
  [get_bd_pins fifo_generator_0/wr_clk]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_wr_en_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_wr_en_o] \
  [get_bd_pins fifo_generator_0/wr_en]
  connect_bd_net -net GpuControllerWrapper_0_pxl_fifo_write_data_o  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_write_data_o] \
  [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net blk_mem_gen_0_doutb  [get_bd_pins blk_mem_gen_0/doutb] \
  [get_bd_pins GpuControllerWrapper_0/bram_dout_i]
  connect_bd_net -net clk_wiz_0_vga_clk  [get_bd_ports vga_clk_i] \
  [get_bd_pins GpuControllerWrapper_0/vga_clk_i]
  connect_bd_net -net fifo_generator_0_almost_empty  [get_bd_pins fifo_generator_0/almost_empty] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_almost_empty_i]
  connect_bd_net -net fifo_generator_0_almost_full  [get_bd_pins fifo_generator_0/almost_full] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_almost_full_i]
  connect_bd_net -net fifo_generator_0_dout  [get_bd_pins fifo_generator_0/dout] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_read_data_i]
  connect_bd_net -net fifo_generator_0_empty  [get_bd_pins fifo_generator_0/empty] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_empty_i]
  connect_bd_net -net fifo_generator_0_full  [get_bd_pins fifo_generator_0/full] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_full_i]
  connect_bd_net -net fifo_generator_0_prog_empty  [get_bd_pins fifo_generator_0/prog_empty] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_prog_empty_i]
  connect_bd_net -net fifo_generator_0_prog_full  [get_bd_pins fifo_generator_0/prog_full] \
  [get_bd_pins GpuControllerWrapper_0/pxl_fifo_prog_full_i]
  connect_bd_net -net gpu_clk_i_1  [get_bd_ports gpu_clk_i] \
  [get_bd_pins GpuControllerWrapper_0/gpu_clk_i]
  connect_bd_net -net microblaze_riscv_0_Clk  [get_bd_ports s_axi_aclk] \
  [get_bd_pins axi_bram_ctrl_0/s_axi_aclk]
  connect_bd_net -net reset_i_1  [get_bd_ports reset_i] \
  [get_bd_pins GpuControllerWrapper_0/reset_i]
  connect_bd_net -net rst_clk_wiz_0_200M_peripheral_aresetn  [get_bd_ports s_axi_aresetn] \
  [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn]

  # Create address segments
  assign_bd_address -offset 0xC0000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces S_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


