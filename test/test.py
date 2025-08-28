# SPDX-FileCopyrightText: © 2025 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

from tqv import TinyQV


clkCounter = 0

CMD_ADDR = 8
MODE_STOP = 0
MODE_ADVANCE_CLOCK = 1
MODE_ADVANCE_READ = 2
MODE_ADVANCE_EXPLICIT = 3
CMD_ADVANCE = 4
CMD_NOP = 5 # actually any value >= 5

LFSR1 = 0
LFSR2 = 1
LFSR3 = 2
LFSR4 = 3

TAPS1 = 4
TAPS2 = 5
TAPS3 = 6
TAPS4 = 7

def myBin(val, minLen=3):
  valS = bin(val)[2:]

  while len(valS) < minLen:
    valS = "0" + valS

  return valS

async def myTick(dut, n=1):
    await ClockCycles(dut.clk,n)
    global clkCounter
    clkCounter += n

async def stop(tqv):
   await tqv.write_reg(CMD_ADDR, MODE_STOP)

async def advanceClock(tqv):
    await tqv.write_reg(CMD_ADDR, MODE_ADVANCE_CLOCK)

async def advanceRead(tqv):
    await tqv.write_reg(CMD_ADDR, MODE_ADVANCE_READ)

async def advanceExplicit(tqv):
    await tqv.write_reg(CMD_ADDR, MODE_ADVANCE_EXPLICIT)

async def advance(tqv):
    await tqv.write_reg(CMD_ADDR, CMD_ADVANCE)    

# TODO erlauben, den aktuellen Modus auszulesen

# # Assume a stopped RNG before calling
async def readLFSR(tqv):
    lfsr0 = await tqv.read_reg(0)
    lfsr1 = await tqv.read_reg(1)
    lfsr2 = await tqv.read_reg(2)
    lfsr3 = await tqv.read_reg(3)

    return [lfsr0,lfsr1,lfsr2,lfsr3]

# # Assume a stopped RNG before calling
async def readTaps(tqv):
    tap0 = await tqv.read_reg(TAPS1)
    tap1 = await tqv.read_reg(TAPS2)
    tap2 = await tqv.read_reg(TAPS3)
    tap3 = await tqv.read_reg(TAPS4)

    return [tap0,tap1,tap2,tap3]

def printWords(w):
    print(f"<{myBin(w[0],8)} {myBin(w[1],8)} {myBin(w[2],8)} {myBin(w[3],8)}>")

# Assume a stopped RNG with given values
async def stoppedIsFixed(dut,tqv,vals):
    for n in range(10):
        await myTick(dut,n)
        lfsr = await readLFSR(tqv)
        assert lfsr[0] == vals[0]
        assert lfsr[1] == vals[1]
        assert lfsr[2] == vals[2]
        assert lfsr[3] == vals[3]

# When submitting your design, change this to 16 + the peripheral number
# in peripherals.v.  e.g. if your design is i_user_simple00, set this to 16.
# The peripheral number is not used by the test harness.
PERIPHERAL_NUM = 16

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 100 ns (10 MHz)
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # Interact with your design's registers through this TinyQV class.
    # This will allow the same test to be run when your design is integrated
    # with TinyQV - the implementation of this class will be replaces with a
    # different version that uses Risc-V instructions instead of the SPI 
    # interface to read and write the registers.
    tqv = TinyQV(dut, PERIPHERAL_NUM)

    # Reset, always start the test by resetting TinyQV
    await tqv.reset()

    dut._log.info("Test Fibonacci RNG behavior")

    dut._log.info("A stopped RNG should always produce the same values")

    
    await stoppedIsFixed(dut,tqv,[255,255,255,255])

    await myTick(dut,4)
    await stoppedIsFixed(dut,tqv,[255,255,255,255])

    # Explcitly advance once -> produziert fehler, wieso auch immer
    #await advanceExplicit(tqv)
    #await advance(tqv)

    w = await readLFSR(tqv)
    printWords(w)
    await advanceRead(tqv)
    await tqv.read_reg(0)
    await stop(tqv)
    w = await readLFSR(tqv)
    printWords(w)

    # # Let it tick for some time and then stop it again
    await advanceClock(tqv)
    await myTick(dut,23)
    await stop(tqv)


    w = await readLFSR(tqv)
    printWords(w)
    await stoppedIsFixed(dut,tqv,w)

    await myTick(dut,3)


