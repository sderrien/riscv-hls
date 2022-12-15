
#include "asm.h"
#include "rvi32.h"

#include <stdio.h>
#include <string.h>
#include <string.h>




struct decode_info decode(unsigned int ir) {
#pragma PURE
#pragma CONTROL_NODE
	{
	struct decode_info res = { };
	res.opcode = (ir & 0x7f);
	res.rd = (ir >> 7) & 0x1f;
	res.funct3 = (ir >> 12) & 0x07;
	res.rs1 = (ir >> 15) & 0x1f;
	res.rs2 = (ir >> 20) & 0x1f;
	res.funct7 = (ir >> 25) & 0x7f;
	res.imm_I = (ir >> 20) & 0xfff;
	res.funct12 = res.imm_I;
	res.simm_I = (res.imm_I >= (1 << 11)) ? res.imm_I - (1 << 12) : res.imm_I;
	res.imm_S = ((ir >> 7) & 0x0f) | ((ir >> 20) & 0xfe0);
	res.simm_S = (res.imm_S >= (1 << 11)) ? res.imm_S - (1 << 12) : res.imm_S;
	res.imm_U = (ir & 0xfffff000);
	res.shamt = (ir >> 20) & 0x0f;
	res.imm_J = ((ir >> 20) & 0x7fe) | ((ir >> 9) & 0x800) | (ir & 0xff000)
			| ((ir >> 11) & 0x100000);
	res.simm_J = (res.imm_J >= (1 << 20)) ? (res.imm_J - (1 << 21)) : res.imm_J;
	res.br_uoffset = ((ir >> 7) & 0x1e) | ((ir >> 20) & 0x7e0)
			| ((ir << 4) & 0x800) | ((ir >> 19) & 0x1000);
	res.br_offset =
			(res.br_uoffset >= 4096) ? res.br_uoffset - 8192 : res.br_uoffset;
	return res;
	}
}

#ifndef SYNTHESIS
char buffer[256];

char* regnames[32] = {
		"zero","ra","sp","gp","tp","t0","t1","t2",
		"s0/fp","s1","a0","a1","a2","a3","a4","a5",
		"a6","a7","s2","s3","s4","s5","s6","s7",
		"s8","s9","s10","s11","t3","t4","t5","t6"
};



const char* optypes[8] ={"add","sll","slt","sltu","xor","sr","or","and"};
const char* immtypes[8]={"addi","slli","slti","sltiu","xori","sri","ori","andi"};
const char* brtypes[8] ={"beq","bne","?","?","blt","bge","bltu","bgeu"};
const char* ldtypes[8] ={"lb","lh","lw","?","lbu","lhu", "?",  "?"};
const char* sttypes[8] ={"sb","sh","sw","?","?","?","?","?"};

char* rname(unsigned int ir) {
	return regnames[ir];
}

char csrbuffer[128];
char* csrname(unsigned int csrid) {
	switch (csrid) {
		case RISCV_CSR_MCYCLE: return "mcycle";
		case RISCV_CSR_MINSTRET: return "minstret";
		case RISCV_CSR_MHARTID: return "mhartid";
		default: {
			sprintf(csrbuffer,"csr[%d]",csrid);
			return csrbuffer;
		}
	}
}

char* mnemonic(unsigned int ir) {

	char *rs1, *rs2, *rd, *csr;
	unsigned int simm_I;
	struct decode_info dc;
	dc = decode(ir);
	rd = regnames[dc.rd];
	rs1 = regnames[dc.rs1];
	rs2 = regnames[dc.rs2];
	csr = csrname(dc.rs2);
	simm_I = dc.simm_I;

	switch (dc.opcode) {
		case RISCV_LUI: {
			sprintf(buffer, "lui %s,%08X",rd,dc.imm_U);
			break;
		}
		case RISCV_AUIPC: {
			sprintf(buffer, "aui %s,pc+%08X",rd,dc.imm_U);
			break;
		}
		case RISCV_OPI: {
			sprintf(buffer, "%s %s,%s,%08X",immtypes[dc.funct3],rd,rs1,dc.simm_I);
			break;
		}
		case RISCV_OP: {
			sprintf(buffer, "%s %s,%s,%s",optypes[dc.funct3],rd,rs1,rs2);
			if (dc.funct3==RISCV_OP_SR) {
				if (dc.funct7==RISCV_OP_SR_SRA) {
					sprintf(buffer, "sra %s,%s,%s",rd,rs1,rs2);
				} else {
					sprintf(buffer, "srl %s,%s,%s",rd,rs1,rs2);
				}
			}
			break;
		}
		case RISCV_BR: {
			sprintf(buffer, "%s %s,%s,%08X",brtypes[dc.funct3],rs1,rs2,(dc.br_offset));
			break;
		}
		case RISCV_ST: {
			sprintf(buffer, "%s %s,%s(%08X)",sttypes[dc.funct3],rs2,rs1,dc.simm_S);
			break;
		}
		case RISCV_LD: {
			sprintf(buffer, "%s %s,%s(%08X)",ldtypes[dc.funct3],rd,rs1,simm_I);
			break;
		}
		case RISCV_JAL: {
			if (dc.rd==0) {
				sprintf(buffer, "j %d",dc.simm_I);
			} else {
				sprintf(buffer, "jal %s, %d",rd,dc.simm_I);
			}
			break;
		}
		case RISCV_JALR: {
			sprintf(buffer, "jalr %s,%s,%d",rd,rs1,dc.simm_I);
			break;
		}
		case RISCV_SYS: {

			switch (dc.funct3) {
			case RISCV_SYS_ECALL_EBREAK:
				switch(dc.imm_I) {
					case RISCV_SYS_ECALL:{
						sprintf(buffer, "ecall");
						break;
					}
					case RISCV_SYS_EBREAK:{
						sprintf(buffer, "ebreak");
						break;
					}
				}
				break;
			}
			break;
		}
		default: {
			sprintf(buffer, "UNKNOWN INSTRUCTION OPCODE=%02X",dc.opcode);
			break;
		}
	}
	return buffer;


}
#endif
