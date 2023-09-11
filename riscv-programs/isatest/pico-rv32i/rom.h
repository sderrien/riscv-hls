#if MEMSIZE<0x0000000C 
#error binary image does not fit memory 
#endif
unsigned int memw[MEMSIZE/4]= {
	0x01000393, // 00000000: addi t2,zero,00000010,
	0x00741063, // 00000004: bne s0/fp,t2,00000000,
	0x00741063, // 00000008: bne s0/fp,t2,00000000
};
unsigned char mem0[MEMSIZE/4]= {
	0x93 ,
	0x63 ,
	0x63 
};
unsigned char mem1[MEMSIZE/4]= {
	0x03 ,
	0x10 ,
	0x10 
};
unsigned char mem2[MEMSIZE/4]= {
	0x00 ,
	0x74 ,
	0x74 
};
unsigned char mem3[MEMSIZE/4]= {
	0x01 ,
	0x00 ,
	0x00 
};
