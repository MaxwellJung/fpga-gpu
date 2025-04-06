
################################################################
# This is a generated script based on design: AxiGpuHWTest
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
# source AxiGpuHWTest_script.tcl


# The design that will be created by this Tcl script contains the following 
# block design container source references:
# AxiGpu

# Please add the sources before sourcing this Tcl script.

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
set design_name AxiGpuHWTest

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
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:jtag_axi:1.2\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:proc_sys_reset:5.0\
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
# CHECK Block Design Container Sources
##################################################################
set bCheckSources 1
set list_bdc_active "AxiGpu"

array set map_bdc_missing {}
set map_bdc_missing(ACTIVE) ""
set map_bdc_missing(BDC) ""

if { $bCheckSources == 1 } {
   set list_check_srcs "\ 
AxiGpu \
"

   common::send_gid_msg -ssname BD::TCL -id 2056 -severity "INFO" "Checking if the following sources for block design container exist in the project: $list_check_srcs .\n\n"

   foreach src $list_check_srcs {
      if { [can_resolve_reference $src] == 0 } {
         if { [lsearch $list_bdc_active $src] != -1 } {
            set map_bdc_missing(ACTIVE) "$map_bdc_missing(ACTIVE) $src"
         } else {
            set map_bdc_missing(BDC) "$map_bdc_missing(BDC) $src"
         }
      }
   }

   if { [llength $map_bdc_missing(ACTIVE)] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2057 -severity "ERROR" "The following source(s) of Active variants are not found in the project: $map_bdc_missing(ACTIVE)" }
      common::send_gid_msg -ssname BD::TCL -id 2060 -severity "INFO" "Please add source files for the missing source(s) above."
      set bCheckIPsPassed 0
   }
   if { [llength $map_bdc_missing(BDC)] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2059 -severity "WARNING" "The following source(s) of variants are not found in the project: $map_bdc_missing(BDC)" }
      common::send_gid_msg -ssname BD::TCL -id 2060 -severity "INFO" "Please add source files for the missing source(s) above."
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

  # Create ports
  set CLK100MHZ [ create_bd_port -dir I -type clk -freq_hz 100000000 CLK100MHZ ]
  set_property -dict [ list \
   CONFIG.PHASE {0.0} \
 ] $CLK100MHZ
  set CPU_RESETN [ create_bd_port -dir I -type rst CPU_RESETN ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $CPU_RESETN
  set VGA_B [ create_bd_port -dir O -from 3 -to 0 VGA_B ]
  set VGA_G [ create_bd_port -dir O -from 3 -to 0 VGA_G ]
  set VGA_HS [ create_bd_port -dir O VGA_HS ]
  set VGA_R [ create_bd_port -dir O -from 3 -to 0 VGA_R ]
  set VGA_VS [ create_bd_port -dir O VGA_VS ]

  # Create instance: AxiGpu_0, and set properties
  set AxiGpu_0 [ create_bd_cell -type container -reference AxiGpu AxiGpu_0 ]
  set_property -dict [list \
    CONFIG.ACTIVE_SIM_BD {AxiGpu.bd} \
    CONFIG.ACTIVE_SYNTH_BD {AxiGpu.bd} \
    CONFIG.ENABLE_DFX {0} \
    CONFIG.LIST_SIM_BD {AxiGpu.bd} \
    CONFIG.LIST_SYNTH_BD {AxiGpu.bd} \
    CONFIG.LOCK_PROPAGATE {0} \
  ] $AxiGpu_0


  set_property SELECTED_SIM_MODEL rtl  $AxiGpu_0
  set_property APERTURES {{0x0 32K}} [get_bd_intf_pins /AxiGpu_0/S_AXI]

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property CONFIG.NUM_SI {1} $axi_smc


  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {130.958} \
    CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100} \
    CONFIG.CLKOUT2_JITTER {130.958} \
    CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT3_JITTER {159.371} \
    CONFIG.CLKOUT3_PHASE_ERROR {98.575} \
    CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {40} \
    CONFIG.CLKOUT3_USED {true} \
    CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
    CONFIG.CLK_OUT1_PORT {cpu_clk} \
    CONFIG.CLK_OUT2_PORT {gpu_clk} \
    CONFIG.CLK_OUT3_PORT {vga_clk} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {10.000} \
    CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
    CONFIG.MMCM_CLKOUT2_DIVIDE {25} \
    CONFIG.NUM_OUT_CLKS {3} \
    CONFIG.RESET_BOARD_INTERFACE {reset} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $clk_wiz


  # Create instance: jtag_axi_0, and set properties
  set jtag_axi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 jtag_axi_0 ]

  # Create instance: reset_inv_0, and set properties
  set reset_inv_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 reset_inv_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $reset_inv_0


  # Create instance: rst_clk_wiz_100M, and set properties
  set rst_clk_wiz_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins AxiGpu_0/S_AXI]
  connect_bd_intf_net -intf_net jtag_axi_0_M_AXI [get_bd_intf_pins jtag_axi_0/M_AXI] [get_bd_intf_pins axi_smc/S00_AXI]

  # Create port connections
  connect_bd_net -net AxiGpu_0_VGA_B  [get_bd_pins AxiGpu_0/VGA_B] \
  [get_bd_ports VGA_B]
  connect_bd_net -net AxiGpu_0_VGA_G  [get_bd_pins AxiGpu_0/VGA_G] \
  [get_bd_ports VGA_G]
  connect_bd_net -net AxiGpu_0_VGA_HS  [get_bd_pins AxiGpu_0/VGA_HS] \
  [get_bd_ports VGA_HS]
  connect_bd_net -net AxiGpu_0_VGA_R  [get_bd_pins AxiGpu_0/VGA_R] \
  [get_bd_ports VGA_R]
  connect_bd_net -net AxiGpu_0_VGA_VS  [get_bd_pins AxiGpu_0/VGA_VS] \
  [get_bd_ports VGA_VS]
  connect_bd_net -net clk_wiz_clk_out1  [get_bd_pins clk_wiz/cpu_clk] \
  [get_bd_pins jtag_axi_0/aclk] \
  [get_bd_pins axi_smc/aclk] \
  [get_bd_pins rst_clk_wiz_100M/slowest_sync_clk] \
  [get_bd_pins AxiGpu_0/s_axi_aclk]
  connect_bd_net -net clk_wiz_gpu_clk  [get_bd_pins clk_wiz/gpu_clk] \
  [get_bd_pins AxiGpu_0/gpu_clk]
  connect_bd_net -net clk_wiz_locked  [get_bd_pins clk_wiz/locked] \
  [get_bd_pins rst_clk_wiz_100M/dcm_locked] \
  [get_bd_pins rst_clk_wiz_100M/ext_reset_in]
  connect_bd_net -net clk_wiz_vga_clk  [get_bd_pins clk_wiz/vga_clk] \
  [get_bd_pins AxiGpu_0/vga_clk]
  connect_bd_net -net reset_1  [get_bd_ports CPU_RESETN] \
  [get_bd_pins reset_inv_0/Op1]
  connect_bd_net -net reset_inv_0_Res  [get_bd_pins reset_inv_0/Res] \
  [get_bd_pins clk_wiz/reset]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn  [get_bd_pins rst_clk_wiz_100M/peripheral_aresetn] \
  [get_bd_pins jtag_axi_0/aresetn] \
  [get_bd_pins axi_smc/aresetn]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_reset  [get_bd_pins rst_clk_wiz_100M/peripheral_reset] \
  [get_bd_pins AxiGpu_0/reset]
  connect_bd_net -net sys_clock_1  [get_bd_ports CLK100MHZ] \
  [get_bd_pins clk_wiz/clk_in1]

  # Create address segments


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


