open_project ./nexys4-ddr/nexys4-ddr.xpr
update_ip_catalog -rebuild -scan_changes
upgrade_ip -vlnv xilinx.com:hls:uart_master:2.0 [get_ips  toplevel_uart_master_0_0] -log ip_upgrade.log
report_ip_status -name ip_status
update_compile_order -fileset sources_1

export_ip_user_files -of_objects [get_ips toplevel_uart_master_0_0] -no_script -sync -force -quiet
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
source program.tcl
exit
