

#ifndef __ELFFILE
#define __ELFFILE

#include <cstdio>
#include <string>
#include <vector>

#include "elf.h"

static constexpr uint8_t ELF_MAGIC[] = {ELFMAG0, ELFMAG1, ELFMAG2, ELFMAG3};

static constexpr size_t E_SHOFF     = 0x20;
static constexpr size_t E_SHENTSIZE = 0x2E;
static constexpr size_t E_SHNUM     = 0x30;
static constexpr size_t E_SHSTRNDX  = 0x32;

template<unsigned N> constexpr size_t little_endian(const uint8_t *bytes){
    return (bytes[N-1] << 8 * (N-1)) | little_endian<N-1>(bytes);
}

template<> constexpr size_t little_endian<0>(const uint8_t *bytes){
    return 0;
}

template<unsigned N> constexpr size_t big_endian(const unsigned char *bytes){
    return (bytes[0] << 8 * (N-1)) | big_endian<N-1>(bytes+1);
}

template<> constexpr size_t big_endian<0>(const unsigned char *bytes){
    return 0;
}

// Function used to lookup Sections or Symbols by name
template <typename T> const T find_by_name(const std::vector<T> v, const std::string name)
{
  for(const auto &s : v){
      if (s.name == name)
        return s;
  }
  fprintf(stderr, "Error: \"%s\" name not found\n", name.c_str());
  exit(-1);
}

struct ElfSection {
  unsigned int size;
  unsigned int offset;
  unsigned int nameIndex;
  unsigned int address;
  unsigned int type;
  unsigned int info;

  std::string name;

  template <typename ElfShdr> ElfSection(const ElfShdr);
};

struct ElfSymbol {
  unsigned int nameIndex;
  unsigned int type;
  unsigned int offset;
  unsigned int size;
  unsigned int section;
  unsigned int value;

  std::string name;

  template <typename ElfSymT> ElfSymbol(const ElfSymT);
};

class ElfFile {
public:
  std::vector<ElfSection> sectionTable;
  std::vector<ElfSymbol> symbols;
  std::vector<uint8_t> content;

  ElfFile(const char* pathToElfFile);
  ~ElfFile() = default;

private:
  template <typename ElfSymT> void readSymbolTable();
  template <typename ElfShdrT> void fillSectionTable();

  void fillNameTable();
  void fillSymbolsName();
};

template <typename ElfSymT> void ElfFile::readSymbolTable()
{
  for (const auto& section : sectionTable) {
    if (section.type == SHT_SYMTAB) {
      const auto* rawSymbols = reinterpret_cast<ElfSymT*>(&content[section.offset]);
      const auto N           = section.size / sizeof(ElfSymT);
      for (int i = 0; i < N; i++)
        symbols.push_back(ElfSymbol(rawSymbols[i]));
    }
  }
}

template <typename ElfShdrT> void ElfFile::fillSectionTable()
{
  const auto tableOffset  = little_endian<4>(&content[E_SHOFF]);
  const auto tableSize    = little_endian<2>(&content[E_SHNUM]);
  const auto* rawSections = reinterpret_cast<ElfShdrT*>(&content[tableOffset]);

  sectionTable.reserve(tableSize);
  for (int i = 0; i < tableSize; i++)
    sectionTable.push_back(ElfSection(rawSections[i]));
}

template <typename ElfShdrT> ElfSection::ElfSection(const ElfShdrT header)
{
  offset    = (header.sh_offset);
  size      = (header.sh_size);
  nameIndex = (header.sh_name);
  address   = (header.sh_addr);
  type      = (header.sh_type);
  info      = (header.sh_info);
}

template <typename ElfSymT> ElfSymbol::ElfSymbol(const ElfSymT sym)
{
  offset    = sym.st_value;
  type      = ELF32_ST_TYPE(sym.st_info); // TODO: make this generic
  section   = sym.st_shndx;
  size      = sym.st_size;
  nameIndex = sym.st_name;
}

#endif
