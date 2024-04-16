#ifndef ELF_LOADER_H_INCLUDED
#define ELF_LOADER_H_INCLUDED

#include <stdint.h>
#include <stdbool.h>

bool elf32_load(const char *filename, uint32_t *memw, uint8_t *mem0,
		uint8_t *mem1, uint8_t *mem2, uint8_t *mem3, uint32_t *entry);

#endif // ELF_LOADER_H_INCLUDED
