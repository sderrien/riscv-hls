onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+toplevel -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.toplevel xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {toplevel.udo}

run -all

endsim

quit -force
