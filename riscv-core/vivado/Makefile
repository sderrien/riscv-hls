all:
	echo target : download bitstream
	
program:
	vivado -mode batch -source program.tcl 

bitstream:
	vivado -mode batch -source rebuild.tcl 
	