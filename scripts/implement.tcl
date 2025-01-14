set projectName doom
set projectRoot ./vivado/$projectName

open_project $projectRoot/${projectName}.xpr
launch_runs impl_1 -jobs 12
wait_on_run impl_1
puts "Implementation done!"
