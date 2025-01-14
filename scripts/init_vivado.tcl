set projectName doom
set projectRoot ./vivado/$projectName

set fpgaTarget xc7a100tcsg324-1
set boardPart digilentinc.com:nexys-a7-100t:part0:1.3
set constraintsFile ./constraint/Nexys-A7-100T.xdc
set bdName design_1
set bdFile ./block_design/${bdName}.tcl

set designDir ./hdl/design
set simDir ./hdl/testbench

create_project $projectName $projectRoot -part $fpgaTarget -force
set_property board_part $boardPart [current_project]

add_files -fileset sources_1 $designDir
update_compile_order -fileset sources_1
add_files -fileset sim_1 $simDir
update_compile_order -fileset sim_1
add_files -fileset constrs_1 $constraintsFile
#
# uncomment below to deep src copy files to vivado project
#
# import_files -fileset sources_1 -force -norecurse
# import_files -fileset sim_1 -force -norecurse
# import_files -fileset constrs_1 -force -norecurse

if [file exists $bdFile] {
    source $bdFile
    update_compile_order -fileset sources_1
    make_wrapper -files [get_files $projectRoot/${projectName}.srcs/sources_1/bd/$bdName/${bdName}.bd] -top
    add_files -norecurse $projectRoot/${projectName}.gen/sources_1/bd/$bdName/hdl/${bdName}_wrapper.v
    update_compile_order -fileset sources_1
    # Disabling source management mode.  This is to allow the top design properties to be set without GUI intervention.
    set_property source_mgmt_mode None [current_project]
    set_property top ${bdName}_wrapper [current_fileset]
    # Re-enabling previously disabled source management mode.
    set_property source_mgmt_mode All [current_project]
    update_compile_order -fileset sources_1
}
puts "Initialized Vivado project!"
