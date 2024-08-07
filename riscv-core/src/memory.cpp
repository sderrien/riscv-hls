#include "riscv-nano-config.h"
#if MEMSIZE<0x00000070 
#error binary image does not fit memory 
#endif
unsigned int memw[MEMSIZE/4]= {
	0x00100093, // 00000000: addi ra,zero,00000001,
	0x00009A63, // 00000004: bne ra,zero,00000014,
	0x00009063, // 00000008: bne ra,zero,00000000,
	0x00009063, // 0000000C: bne ra,zero,00000000,
	0x00009063, // 00000010: bne ra,zero,00000000,
	0x00009063, // 00000014: bne ra,zero,00000000,
	0x00100093, // 00000018: addi ra,zero,00000001,
	0x01F08113, // 0000001C: addi sp,ra,0000001F,
	0xFFF10193, // 00000020: addi gp,sp,FFFFFFFF,
	0x01F1C213, // 00000024: xori tp,gp,0000001F,
	0xFE0212E3, // 00000028: bne tp,zero,FFFFFFE4,
	0x001082B3, // 0000002C: add t0,ra,ra,
	0x40128333, // 00000030: add t1,t0,ra,
	0x0062C3B3, // 00000034: xor t2,t0,t1,
	0x00300413, // 00000038: addi s0/fp,zero,00000003,
	0xFC741AE3, // 0000003C: bne s0/fp,t2,FFFFFFD4,
	0x06000493, // 00000040: addi s1,zero,00000060,
	0x0004A503, // 00000044: lw a0,s1(0:0),
	0x1FF57593, // 00000048: andi a1,a0,000001FF,
	0x1EF00613, // 0000004C: addi a2,zero,000001EF,
	0xFCB612E3, // 00000050: bne a2,a1,FFFFFFC4,
	0x00009063, // 00000054: bne ra,zero,00000000,
	0x00000000, // 00000058: UNKNOWN INSTRUCTION OPCODE=00,
	0x00000000, // 0000005C: UNKNOWN INSTRUCTION OPCODE=00,
	0xDEADBEEF, // 00000060: jal t4, -534,
	0xBABEFACE, // 00000064: UNKNOWN INSTRUCTION OPCODE=4E,
	0x1BADCAFE, // 00000068: UNKNOWN INSTRUCTION OPCODE=7E,
	0x1BADCAFE, // 0000006C: UNKNOWN INSTRUCTION OPCODE=7E
};
unsigned char mem0[MEMSIZE/4]= {
	0x93 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x63 ,
	0x93 ,
	0x13 ,
	0x93 ,
	0x13 ,
	0xE3 ,
	0xB3 ,
	0x33 ,
	0xB3 ,
	0x13 ,
	0xE3 ,
	0x93 ,
	0x03 ,
	0x93 ,
	0x13 ,
	0xE3 ,
	0x63 ,
	0x00 ,
	0x00 ,
	0xEF ,
	0xCE ,
	0xFE ,
	0xFE 
};
unsigned char mem1[MEMSIZE/4]= {
	0x00 ,
	0x9A ,
	0x90 ,
	0x90 ,
	0x90 ,
	0x90 ,
	0x00 ,
	0x81 ,
	0x01 ,
	0xC2 ,
	0x12 ,
	0x82 ,
	0x83 ,
	0xC3 ,
	0x04 ,
	0x1A ,
	0x04 ,
	0xA5 ,
	0x75 ,
	0x06 ,
	0x12 ,
	0x90 ,
	0x00 ,
	0x00 ,
	0xBE ,
	0xFA ,
	0xCA ,
	0xCA 
};
unsigned char mem2[MEMSIZE/4]= {
	0x10 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x10 ,
	0xF0 ,
	0xF1 ,
	0xF1 ,
	0x02 ,
	0x10 ,
	0x12 ,
	0x62 ,
	0x30 ,
	0x74 ,
	0x00 ,
	0x04 ,
	0xF5 ,
	0xF0 ,
	0xB6 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0xAD ,
	0xBE ,
	0xAD ,
	0xAD 
};
unsigned char mem3[MEMSIZE/4]= {
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x01 ,
	0xFF ,
	0x01 ,
	0xFE ,
	0x00 ,
	0x40 ,
	0x00 ,
	0x00 ,
	0xFC ,
	0x06 ,
	0x00 ,
	0x1F ,
	0x1E ,
	0xFC ,
	0x00 ,
	0x00 ,
	0x00 ,
	0xDE ,
	0xBA ,
	0x1B ,
	0x1B 
};
