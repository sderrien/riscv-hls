
create_project -force nexys4-ddr ./test -part xc7a100tcsg324-1
make_wrapper -files [get_files ./src/toplevel.bd] -top
# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "digilentinc.com:nexys4_ddr:part0:1.1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "platform.board_id" -value "nexys4_ddr" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj



create_fileset -force -srcset sources_1

add_files ./sources/toplevel.bd
add_files ./sources/debug_if.vhd
add_files ./sources/io.xdc

set_property "ip_repo_paths" "[file normalize /home/sderrien/ip_repository"]" $obj
update_ip_catalog -rebuild

open_bd_design {./toplevel.bd}
make_wrapper -files [get_files ./toplevel.bd] -top


# Set 'sources_1' fileset file properties for local files
set file "debug_if.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "hdl/toplevel_wrapper.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

upgrade_ip [get_bd_cells *]
assign_bd_address
save_bd_design 


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "toplevel_wrapper" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}


# Add/Import constrs file and set constrs file properties
set file "./io.xdc"
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj





