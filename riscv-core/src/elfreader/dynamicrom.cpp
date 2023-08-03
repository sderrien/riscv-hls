#include <stdio.h>
#include <string.h>
#include <iostream>

#include "dynamicrom.h"
#include "../riscv-iss.h"
#include "elfreader.h"

extern unsigned int memw[MEMSIZE / 4];
extern unsigned char mem0[MEMSIZE / 4];
extern unsigned char mem1[MEMSIZE / 4];
extern unsigned char mem2[MEMSIZE / 4];
extern unsigned char mem3[MEMSIZE / 4];

int loadmem(const char *pathToElfFile) {
    //loading the file
    auto file = ElfFile(pathToElfFile);

    //looking for res, the adrress of _start
    uint32_t res;
    for (const auto& symbol : file.symbols) {
        if (!symbol.name.compare("_start")) {
            res = symbol.offset;
        }
    }

    //computing the offset between the content and memory addresses
    uint32_t offset;
    unsigned char* tab[4] = {mem0, mem1, mem2, mem3};
    for (const auto& section : file.sectionTable) {
        if (!section.name.compare(".text")) {
            offset = (section.address - section.offset) / 4;
        }
            
    if(section.address != 0){
        for (unsigned i = 0; i < section.size; i++) {
            memw[(section.address + i) / 4] = memw[(section.address + i) / 4] >> 8;
            memw[(section.address + i) / 4] = memw[(section.address + i) / 4] | (file.content[section.offset + i] << 24);
            tab[i % 4][(section.address + i) / 4] = file.content[section.offset + i];
        }
        //setByte(section.address + i, elfFile.content[section.offset + i]);
    }

    }
    //checking that the data fits in the memory
    /*if (MEMSIZE < file.content.size() + offset) {
        printf("binary image does not fit memory");
    }*/

    //return _start address to set the PC
    return res;
}