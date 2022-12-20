onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib toplevel_opt

do {wave.do}

view wave
view structure
view signals

do {toplevel.udo}

run -all

quit -force
