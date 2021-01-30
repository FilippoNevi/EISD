cd ip
foreach script [glob */script.tcl] { exec vivado_hls -f $script }

cd ../overlays
source design_adder.tcl
add_files -norecurse [make_wrapper -files [get_files "[current_bd_design].bd"] -top]
update_compile_order -fileset sources_1
set_property top design_adder_wrapper [current_fileset]
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
file copy -force design_adder/design_adder.runs/impl_1/design_adder_wrapper.bit design_adder.bit
file copy -force design_adder/design_adder.srcs/sources_1/bd/design_adder/hw_handoff/design_adder.hwh design_adder.hwh
