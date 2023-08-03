import os, sys, shutil

from subprocess import Popen, PIPE

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