struct decode_info {
  unsigned char opcode;
  unsigned char rd;
  unsigned char funct3;
  unsigned char rs1;
  unsigned char rs2;
  unsigned char funct7;
  unsigned short imm_I;
  unsigned short funct12;
  short simm_I;
  unsigned short imm_S;
  short simm_S;
  unsigned int imm_U;
  unsigned char shamt;
  unsigned int imm_J;
  int simm_J;
  unsigned short br_uoffset;
  short br_offset;
};

extern struct decode_info decode(unsigned int ir);
extern char *mnemonic(unsigned int ir);
char *rname(unsigned int ir);
