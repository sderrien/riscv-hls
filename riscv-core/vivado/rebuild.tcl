
#
if {$argc > 0} {
	set target [lindex $argv 0]
	puts "Target Project : $target"
	open_project ./nexys4-ddr/nexys4-ddr.xpr
	
	open_bd_design {/home/sderrien/nexy4-ddr/MicroBlaze_Hello_World/Hello_World/uBlaze_N4/uBlaze_N4.srcs/sources_1/bd/toplevel/toplevel.bd}
	update_ip_catalog -rebuild -scan_changes
	upgrade_ip [get_bd_cells *]
	report_ip_status -name ip_status
	reset_run synth_1
	launch_runs impl_1 -to_step write_bitstream
	
	set_property  ip_repo_paths  { /home/sderrien/nexys4-ddr/uart_master } [current_project]
	update_ip_catalog -rebuild -scan_changes
	export_ip_user_files -of_objects [get_ips *] -no_script -sync -force -quiet
	
	file copy -force template.bd ./bd/system/system.bd
	open_bd_design {./bd/system/system.bd}
	upgrade_ip [get_bd_cells *]
	assign_bd_address
	regenerate_bd_layout
	save_bd_design 
} else {  
	#puts "No arguments (project name expected)" 
	open_project ./nexys4-ddr/nexys4-ddr.xpr
	update_ip_catalog -rebuild -scan_changes
	upgrade_ip -vlnv xilinx.com:hls:uart_master:2.0 [get_ips  toplevel_uart_master_0_0] -log ip_upgrade.log
	report_ip_status -name ip_status

	export_ip_user_files -of_objects [get_ips toplevel_uart_master_0_0] -no_script -sync -force -quiet
	reset_run synth_1
	launch_runs impl_1 -to_step write_bitstream
	wait_on_run impl_1
	source program.tcl
	exit
}
