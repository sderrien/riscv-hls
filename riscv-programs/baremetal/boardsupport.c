/* Copyright (C) 2017 Embecosm Limited and University of Bristol

   Contributor Graham Markall <graham.markall@embecosm.com>

   This file is part of Embench and was formerly part of the Bristol/Embecosm
   Embedded Benchmark Suite.

   SPDX-License-Identifier: GPL-3.0-or-later */

//#include <support.h>

unsigned long long mcycle_s = 0;
unsigned long long minsn_s = 0;
unsigned long long mcycle_e = 0;
unsigned long long minsn_e = 0;



void
initialise_board ()
{
  __asm__ volatile ("li a0, 0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
start_trigger ()
{
  //__asm__ volatile ("li a0, 0" : : : "memory");
  //mcycle = 0;
  //minsn = 0;
  __asm__ volatile ("csrr %0, mcycle" : "=r" (mcycle_s) : : "memory");
  __asm__ volatile ("csrr %0, minstret" : "=r" (minsn_s) : : "memory");   
  //__asm__ volatile ("csrw	mcycle, x0" : : : "memory");
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
stop_trigger ()
{
  //__asm__ volatile ("li a0, 0" : : : "memory");
  __asm__ volatile ("csrr %0, mcycle" : "=r" (mcycle_e) : : "memory");
  __asm__ volatile ("csrr %0, minstret" : "=r" (minsn_e) : : "memory");
}
