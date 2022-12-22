#if MEMSIZE<0x000000CC 
#error binary image does not fit memory 
#endif
unsigned int memw[MEMSIZE/4]= {
	0x00000033, // 00000000: add zero,zero,zero,
	0x30509073, // 00000004: csrrw csr[305],ra,
	0x00000097, // 00000008: aui ra,pc+00000000,
	0x03008093, // 0000000C: addi ra,ra,00000030,
	0x00010137, // 00000010: lui sp,00010000,
	0xFFC10113, // 00000014: addi sp,sp,FFFFFFFC,
	0x10000513, // 00000018: addi a0,zero,00000100,
	0xDEADC5B7, // 0000001C: lui a1,DEADC000,
	0xEEF58593, // 00000020: addi a1,a1,FFFFFEEF,
	0x00B52023, // 00000024: sw a1,a0(00000000),
	0x00052603, // 00000028: lw a2,a0(00000000),
	0x014000EF, // 0000002C: jal ra, 20,
	0x00000033, // 00000030: add zero,zero,zero,
	0x00100073, // 00000034: ebreak,
	0x34202573, // 00000038: csrrs csr[342],zero,
	0x0000006F, // 0000003C: j 0,
	0xFE010113, // 00000040: addi sp,sp,FFFFFFE0,
	0x00812E23, // 00000044: sw s0/fp,sp(0000000C),
	0x02010413, // 00000048: addi s0/fp,sp,00000020,
	0x01E00793, // 0000004C: addi a5,zero,0000001E,
	0xFEF42423, // 00000050: sw a5,s0/fp(FFFFFFE8),
	0xFE042623, // 00000054: sw zero,s0/fp(FFFFFFEC),
	0x02C0006F, // 00000058: j 44,
	0x0A400713, // 0000005C: addi a4,zero,000000A4,
	0xFEC42783, // 00000060: lw a5,s0/fp(FFFFFFEC),
	0x00F707B3, // 00000064: add a5,a4,a5,
	0x0007C703, // 00000068: lbu a4,a5(00000000),
	0x0C402783, // 0000006C: lw a5,zero(000000C4),
	0x00478793, // 00000070: addi a5,a5,00000004,
	0x00E7A023, // 00000074: sw a4,a5(00000000),
	0xFEC42783, // 00000078: lw a5,s0/fp(FFFFFFEC),
	0x00178793, // 0000007C: addi a5,a5,00000001,
	0xFEF42623, // 00000080: sw a5,s0/fp(FFFFFFEC),
	0xFEC42703, // 00000084: lw a4,s0/fp(FFFFFFEC),
	0xFE842783, // 00000088: lw a5,s0/fp(FFFFFFE8),
	0xFCF748E3, // 0000008C: blt a4,a5,FFFFFFD0,
	0x00000013, // 00000090: addi zero,zero,00000000,
	0x00000013, // 00000094: addi zero,zero,00000000,
	0x01C12403, // 00000098: lw s0/fp,sp(0000001C),
	0x02010113, // 0000009C: addi sp,sp,00000020,
	0x00008067, // 000000A0: jalr zero,ra,0,
	0x6C6C6548, // 000000A4: UNKNOWN INSTRUCTION OPCODE=48,
	0x6F77206F, // 000000A8: j 1783,
	0x20646C72, // 000000AC: UNKNOWN INSTRUCTION OPCODE=72,
	0x6D6F7266, // 000000B0: UNKNOWN INSTRUCTION OPCODE=66,
	0x53495220, // 000000B4: UNKNOWN INSTRUCTION OPCODE=20,
	0x20562D43, // 000000B8: UNKNOWN INSTRUCTION OPCODE=43,
	0x0D534C48, // 000000BC: UNKNOWN INSTRUCTION OPCODE=48,
	0x0000000A, // 000000C0: UNKNOWN INSTRUCTION OPCODE=0A,
	0x80000000, // 000000C4: UNKNOWN INSTRUCTION OPCODE=00,
	0x80000000, // 000000C8: UNKNOWN INSTRUCTION OPCODE=00
};
unsigned char mem0[MEMSIZE/4]= {
	0x33 ,
	0x73 ,
	0x97 ,
	0x93 ,
	0x37 ,
	0x13 ,
	0x13 ,
	0xB7 ,
	0x93 ,
	0x23 ,
	0x03 ,
	0xEF ,
	0x33 ,
	0x73 ,
	0x73 ,
	0x6F ,
	0x13 ,
	0x23 ,
	0x13 ,
	0x93 ,
	0x23 ,
	0x23 ,
	0x6F ,
	0x13 ,
	0x83 ,
	0xB3 ,
	0x03 ,
	0x83 ,
	0x93 ,
	0x23 ,
	0x83 ,
	0x93 ,
	0x23 ,
	0x03 ,
	0x83 ,
	0xE3 ,
	0x13 ,
	0x13 ,
	0x03 ,
	0x13 ,
	0x67 ,
	0x48 ,
	0x6F ,
	0x72 ,
	0x66 ,
	0x20 ,
	0x43 ,
	0x48 ,
	0x0A ,
	0x00 ,
	0x00 
};
unsigned char mem1[MEMSIZE/4]= {
	0x00 ,
	0x90 ,
	0x00 ,
	0x80 ,
	0x01 ,
	0x01 ,
	0x05 ,
	0xC5 ,
	0x85 ,
	0x20 ,
	0x26 ,
	0x00 ,
	0x00 ,
	0x00 ,
	0x25 ,
	0x00 ,
	0x01 ,
	0x2E ,
	0x04 ,
	0x07 ,
	0x24 ,
	0x26 ,
	0x00 ,
	0x07 ,
	0x27 ,
	0x07 ,
	0xC7 ,
	0x27 ,
	0x87 ,
	0xA0 ,
	0x27 ,
	0x87 ,
	0x26 ,
	0x27 ,
	0x27 ,
	0x48 ,
	0x00 ,
	0x00 ,
	0x24 ,
	0x01 ,
	0x80 ,
	0x65 ,
	0x20 ,
	0x6C ,
	0x72 ,
	0x52 ,
	0x2D ,
	0x4C ,
	0x00 ,
	0x00 ,
	0x00 
};
unsigned char mem2[MEMSIZE/4]= {
	0x00 ,
	0x50 ,
	0x00 ,
	0x00 ,
	0x01 ,
	0xC1 ,
	0x00 ,
	0xAD ,
	0xF5 ,
	0xB5 ,
	0x05 ,
	0x40 ,
	0x00 ,
	0x10 ,
	0x20 ,
	0x00 ,
	0x01 ,
	0x81 ,
	0x01 ,
	0xE0 ,
	0xF4 ,
	0x04 ,
	0xC0 ,
	0x40 ,
	0xC4 ,
	0xF7 ,
	0x07 ,
	0x40 ,
	0x47 ,
	0xE7 ,
	0xC4 ,
	0x17 ,
	0xF4 ,
	0xC4 ,
	0x84 ,
	0xF7 ,
	0x00 ,
	0x00 ,
	0xC1 ,
	0x01 ,
	0x00 ,
	0x6C ,
	0x77 ,
	0x64 ,
	0x6F ,
	0x49 ,
	0x56 ,
	0x53 ,
	0x00 ,
	0x00 ,
	0x00 
};
unsigned char mem3[MEMSIZE/4]= {
	0x00 ,
	0x30 ,
	0x00 ,
	0x03 ,
	0x00 ,
	0xFF ,
	0x10 ,
	0xDE ,
	0xEE ,
	0x00 ,
	0x00 ,
	0x01 ,
	0x00 ,
	0x00 ,
	0x34 ,
	0x00 ,
	0xFE ,
	0x00 ,
	0x02 ,
	0x01 ,
	0xFE ,
	0xFE ,
	0x02 ,
	0x0A ,
	0xFE ,
	0x00 ,
	0x00 ,
	0x0C ,
	0x00 ,
	0x00 ,
	0xFE ,
	0x00 ,
	0xFE ,
	0xFE ,
	0xFE ,
	0xFC ,
	0x00 ,
	0x00 ,
	0x01 ,
	0x02 ,
	0x00 ,
	0x6C ,
	0x6F ,
	0x20 ,
	0x6D ,
	0x53 ,
	0x20 ,
	0x0D ,
	0x00 ,
	0x80 ,
	0x80 
};
