import os, sys, shutil

import pyrsp.rsp
from pyrsp.rsp import AMD64

from subprocess import Popen, PIPE

def run_elf(server_path, elf_path):
   gdb_server = Popen([server_path, elf_path], stdout = PIPE)
   output = gdb_server.stdout.readline()
   while output[:9] != b"Listening" :
      output = gdb_server.stdout.readline()
   rsp = AMD64('1234', elffile=elf_path)
   rsp.vContc_all()
   while output[:7] != b"syscall" :
      if output[:7] == b"Sending" :
         printf("Error with file")
         gdb_server.kill()
         return 0
      output = gdb_server.stdout.readline()
   gdb_server.kill()
   return 1

if __name__ == "__main__" :
   repo_path = os.getcwd()
   repo_dirs = os.listdir(repo_path)

   if not("embench-iot" in repo_dirs) :
      os.chdir(repo_path)   
      clone = Popen(["git", "clone", "https://github.com/embench/embench-iot.git"])
      clone.wait()
   elif "bd" in os.listdir(repo_path + "/embench-iot"):
      shutil.rmtree(repo_path + "/embench-iot/bd")

   os.chdir(repo_path + "/embench-iot")

   build = Popen(["./build_all.py --arch riscv32 --chip generic --board ri5cyverilator --cc riscv32-unknown-elf-gcc --cflags=\"-c -O2 -ffunction-sections -march=rv32i -mabi=ilp32\" --ldflags=\"-Wl,-gc-sections\" --user-libs=\"-lgcc -lm\""], shell=True)
   build.wait()

   bench_dirs = os.listdir(repo_path + "/embench-iot/bd/src/")
   for directory in bench_dirs :
      files = os.listdir(repo_path + "/embench-iot/bd/src/" + directory)
      for file in files :
         if file[(len(file) - 2):] != ".o" :
            print(run_elf(repo_path + "/bin/gdb-server-iss", repo_path + "/embench-iot/bd/src/" + directory + "/" + file))
