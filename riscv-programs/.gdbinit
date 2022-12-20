define init_riscv
	file $arg0
    target remote :1234
end

define load_elf
	file $arg0
    load $arg0
    break main
end
