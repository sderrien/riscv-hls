#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iterator>
#include <string>
#include <vector>

#include "elfreader.h"

void checkElf(const std::vector<uint8_t>& content)
{
  if (!std::equal(std::begin(ELF_MAGIC), std::end(ELF_MAGIC), content.begin())) {
    fprintf(stderr, "Error: Not a valid ELF file\n");
    exit(-1);
  }
  if (content[EI_CLASS] != ELFCLASS32) {
    fprintf(stderr, "Error reading ELF file header: unknown EI_CLASS, expected %d (ELFCLASS32)\n", ELFCLASS32);
    exit(-1);
  }
  if (content[EI_DATA] != 1) {
    fprintf(stderr, "Error reading ELF file header: EI_DATA is not little-endian\n");
    exit(-1);
  }
}

void ElfFile::fillNameTable()
{
  const auto nameTableIndex  = little_endian<2>(&content[E_SHSTRNDX]);
  const auto nameTableOffset = sectionTable[nameTableIndex].offset;
  const char* names          = reinterpret_cast<const char*>(&content[nameTableOffset]);
  for (auto& section : sectionTable)
    section.name = std::string(&names[section.nameIndex]);
}

void ElfFile::fillSymbolsName()
{
  const auto sec = find_by_name(sectionTable, ".strtab");
  auto names     = reinterpret_cast<const char*>(&content[sec.offset]);
  for (auto& symbol : symbols)
    symbol.name = std::string(&names[symbol.nameIndex]);
}

ElfFile::ElfFile(const char* pathToElfFile)
{
  std::ifstream elfFile(pathToElfFile, std::ios::binary);
  if (!elfFile) {
    fprintf(stderr, "Error cannot open file %s\n", pathToElfFile);
    exit(-1);
  }

  content.assign(std::istreambuf_iterator<char>(elfFile), {});
  checkElf(content);
  fillSectionTable<Elf32_Shdr>();
  fillNameTable();
  readSymbolTable<Elf32_Sym>();
  fillSymbolsName();
}
