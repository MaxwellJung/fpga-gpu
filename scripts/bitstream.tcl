set projectName doom
set projectRoot ./vivado/$projectName

open_project $projectRoot/${projectName}.xpr
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
puts "Bitstream generation done!"
# file copy -force $projectRoot/gpu.runs/impl_1/design_1_wrapper.bit ./build/test.bit
