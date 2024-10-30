set projectName gpu
set projectRoot ./build/vivado/$projectName

open_project $projectRoot/${projectName}.xpr
launch_runs impl_1 -jobs 4
wait_on_run impl_1
puts "Implementation done!"
