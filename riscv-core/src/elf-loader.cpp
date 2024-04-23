#include "elf-loader.h"
#include "riscv-nano-config.h"

#include <assert.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//===----------------------------------------------------------------------===//
// Simplified ELF specification

#define ELF_IDENT_SIZE 16

#define ELF_MAG0 0x7f
#define ELF_MAG1 'E'
#define ELF_MAG2 'L'
#define ELF_MAG3 'F'

typedef uint32_t elf32_addr;
typedef uint32_t elf32_off;
typedef uint16_t elf32_half;
typedef uint32_t elf32_word;
typedef int32_t elf32_sword;

/*
 ** ELF identification indices
 */
enum {
	ELF_IDENT_MAG0 = 0,
	ELF_IDENT_MAG1 = 1,
	ELF_IDENT_MAG2 = 2,
	ELF_IDENT_MAG3 = 3,
	ELF_IDENT_CLASS = 4,
	ELF_IDENT_DATA = 5,
	ELF_IDENT_VERSION = 6,
	ELF_IDENT_OSABI = 7,
	ELF_IDENT_ABIVERSION = 8,
	ELF_IDENT_PADDING_START = 9,
};

/*
 ** ELF file type
 */
enum {
	ELF_TYPE_NONE = 0,
	ELF_TYPE_RELOCATABLE = 1,
	ELF_TYPE_EXECUTABLE = 2,
	ELF_TYPE_SHARED = 3,
	ELF_TYPE_CORE = 4,
};

/*
 ** ELF required architecture
 */
enum {
	ELF_MACHINE_RISCV = 243,
};

/*
 ** ELF version
 */
enum {
	ELF_VERSION_NONE = 0, ELF_VERSION_CURRENT = 1,
};

/*
 ** ELF file class
 */
enum {
	ELF_CLASS_NONE = 0, ELF_CLASS_32 = 1, ELF_CLASS_64 = 2,
};

/*
 ** ELF data encoding order
 */
enum {
	ELF_DATA_NONE = 0, ELF_DATA_LITTLE_ENDIAN = 1, ELF_DATA_BIG_ENDIAN = 2,
};

/*
 ** ELF operating system ABI
 */
enum {
	ELF_OSABI_NONE = 0, ELF_OSABI_GNU = 3,
};

/*
 ** ELF segment types
 */
enum {
	ELF_SEGMENT_TYPE_NULL = 0, ELF_SEGMENT_TYPE_LOAD = 1,
};

typedef struct {
	uint8_t ident[ELF_IDENT_SIZE];
	elf32_half type;
	elf32_half machine;
	elf32_word version;
	elf32_addr entry_point;
	elf32_off program_header_offset;
	elf32_off section_header_offset;
	elf32_word flags;
	elf32_half header_size;
	elf32_half program_header_entry_size;
	elf32_half num_program_headers;
	elf32_half section_header_entry_size;
	elf32_half num_section_headers;
	elf32_half section_name_table_offset;
} elf32_header;

typedef struct {
	elf32_word type;
	elf32_off offset;
	elf32_addr vaddr;
	elf32_addr paddr;
	elf32_word filesz;
	elf32_word memsz;
	elf32_word flags;
	elf32_word align;
} elf32_program_header;

//===----------------------------------------------------------------------===//

void write_byte(uint32_t addr, uint8_t value, uint32_t *memw, uint8_t *mem0,
		uint8_t *mem1, uint8_t *mem2, uint8_t *mem3) {
	int mod = addr % 4;
	addr >>= 2;

	switch (mod) {
	case 0:
		mem0[addr] = value;
		break;
	case 1:
		mem1[addr] = value;
		break;
	case 2:
		mem2[addr] = value;
		break;
	case 3:
		mem3[addr] = value;
		break;
	}

	uint32_t mask = 0xff << (mod * 8);
	uint32_t prev = memw[addr] & ~mask;
	memw[addr] = prev | (value << (mod * 8));
}

bool elf32_load(const char *filename, uint32_t *memw, uint8_t *mem0,
		uint8_t *mem1, uint8_t *mem2, uint8_t *mem3, uint32_t *entry) {
	printf("Loading ELF file %s\n", filename);

	void *data = 0;
	FILE *file = fopen(filename, "rb");
	if (!file) {
		fprintf(stderr, "Failed to open file: %s\n", strerror(errno));
		return false;
	}

	int file_size = -1;
	if (fseek(file, 0, SEEK_END) == 0)
		file_size = ftell(file);

	if (file_size == -1) {
		fprintf(stderr, "Failed to get ELF file size: %s\n", strerror(errno));
		fclose(file);
		return false;
	}

	if (file_size > MEMSIZE) {
		fprintf(stderr,
				"Input file is too big to fit into device memory (%d bytes available, %d bytes requested)\n",
				MEMSIZE, file_size);
		fclose(file);
		return false;
	}

	rewind(file);

	data = malloc(file_size);
	if (!data) {
		fprintf(stderr, "Memory allocation failed\n");
		fclose(file);
		return false;
	}

	if (fread(data, 1, file_size, file) != (size_t) file_size) {
		fprintf(stderr, "Failed to read ELF file data\n");
		free(data);
		fclose(file);
		return false;
	}
	fclose(file);

	const elf32_header *header = (elf32_header*) data;

	int phdr_offset = header->program_header_offset;
	int num_phdrs = header->num_program_headers;

	const unsigned char *current = (unsigned char*) data + phdr_offset;
	for (int i = 0; i < num_phdrs;
			current += header->program_header_entry_size, ++i) {
		const elf32_program_header *phdr = (const elf32_program_header*) current;
		if (phdr->type != ELF_SEGMENT_TYPE_LOAD)
			continue;
		printf("Loading program segment @ 0x%08x - 0x%08x\n", phdr->vaddr, phdr->vaddr + phdr->memsz);

		int j = 0;
		const unsigned char *segment_base = (unsigned char*) data
				+ phdr->offset;
		for (; j < phdr->filesz; ++j)
			write_byte(phdr->vaddr + j, segment_base[j], memw, mem0, mem1, mem2,
					mem3);
		for (; j < phdr->filesz; ++j)
			write_byte(phdr->vaddr + j, 0, memw, mem0, mem1, mem2, mem3);
	}

	*entry = header->entry_point;
	printf("Setting initial PC to 0x%08x\n", header->entry_point);

	free(data);
	return true;
}

