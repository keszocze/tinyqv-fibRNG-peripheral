<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

The peripheral index is the number TinyQV will use to select your peripheral.  You will pick a free
slot when raising the pull request against the main TinyQV repository, and can fill this in then.  You
also need to set this value as the PERIPHERAL_NUM in your test script.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# FibRNG

Author: Oliver Keszocze

Peripheral index: nn

## What it does: Generating Random Numbers

*FibRNG* is a reconfigurable Random Number Generator (RNG) that generates random bits by via a Fibonacci Linear-Feebdack Shift Registers (LFSR) (see [Wikipedia](https://en.wikipedia.org/wiki/Linear-feedback_shift_register) for a detailed description). For this, it stores two bit-vectors. The first one ($r$) stores the random bit string and the other one ($t$) stores the *taps*, i.e., the bit indices in $r$ that are using to compute the next bit. In each step, this new random bit $b$ is determined by computing
$$b=\bigoplus\limits_{i=1}^{n} r_i \wedge t_i.$$
The vector $r$ is then updated by shifting in the new bit $b$ from the left, dropping the last bit to the right.

**Note:** The description of this document follows [Wikipedia](https://en.wikipedia.org/wiki/Linear-feedback_shift_register). This means that the indicies into the bit-vector start with $1$ and increase from left to right, instead of starting from $0$ and increase to the left.

### Example
Figure 1 shows an Fibonaccy LFSR made from $16$ bits that uses the taps $1, 11, 13,14$ and $16$. The bit-vector $t=\langle 10000000 00101101\rangle$ is only shown implicitly as the numbers  above the bit-vector $r$.

![A $16$-bit Fibonacci LFSR using the taps $1, 11, 13,14$ and $16$. (Taken from [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:LFSR-F16.svg), Author: KCAuXy4p)](LFSR-F16.svg)

The current vector $r$ is given by $r=\langle 10101100\, 11100001 \rangle$. The next bit is computed as $$b=r_1 \oplus r_{11} \oplus r_{13} \oplus r_{14} \oplus r_{16} = 1 \oplus 1 \oplus 0 \oplus 0 \oplus 1 = 0$$
and $r$ is then  updated to $$r=\langle 01010110\, 01110000 \rangle.$$ The update rule can also be written as $$r' = \left\langle \left(\bigoplus_{i=1}^n r_i \wedge t_i\right) ~ r[1:31]\right\rangle.$$

The random number is obtained by reading the rightmost bit after each iteration.



**Hier dann noch über maximal lange Cyclen reden**


## How it is implemented

To match the interface of the [Tiny Tapout RISC-V Peripheral Competition](https://tinytapeout.com/competitions/risc-v-peripheral/), the Fibonacci LSFR is implemented as follows. The vectors $r$ and $t$ consist of $4$ words of $8$-bit length, i.e. are of total length of $32$:

$$ r=\langle \underbrace{r_1 .. r_8}_{{FIBREG1}} ~ \underbrace{r_9 .. r_{16}}_{{FIBREG2}} ~ {r_{17} .. r_{24}}_{{FIBREG3}} ~ \underbrace{r_{25} .. r_{32}}_{{FIBREG4}}\rangle = \langle {FIBREG1} ~ {FIBREG2} ~ {FIBREG3} ~ {FIBREG4}\rangle $$
$$t=\langle \underbrace{t_1 .. t_8}_{{TAPS1}} ~ \underbrace{t_9 .. t_{16}}_{{TAPS2}} ~ \underbrace{t_{17} .. t_{24}}_{{TAPS3}} ~ \underbrace{t_{25} .. t_{32}}_{{TAPS4}}\rangle = \langle {TAPS1} ~ {TAPS2} ~ {TAPS3} ~ {TAPS4}\rangle $$

Reading the new random bit (i.e., $r_{32}$) is done as follows using cocotb (it should be straight-forward to translate this to a `C++` program):

```python
    # Get the last (i.e., fourth) word
    # (see the 'Register Map' section of the documentation for details)
    fibReg4 = await tqv.read_reg(FIBREG4)

    # AND'ing with the lowest bit to extract the new random bit r_32
    # (the last bit in the last word)
    randomBit = fibReg4 & 1
```

Furhtermore, FibRNG can be in one of the following modes of operation: 

* `Stopped`
* `Running`
* `Explicit`

When `Stopped`, the RNG does not compute new random bits. Use this mode when configuring FibRNG (see the next section).

When `Running`, each clock cycle, a new random bit is computed and shifted into $r$. Note that clock cycles are not identical to read/write transactions. That means that having FibRNG in this mode does not allow to read consecutive random numbers.

When in `Explicit` mode, the next random bit $b$ (and, hence, $r'$) is only computed after having received the `Advance` command; see the configuration section below. Most likely, this is the mode you want to use when using FibRNG as a TTQV peripheral.



## Commands

FibRNG can execute the commands from the following table.  To execute them,  write the corresponding value to the `CMDREG` (`0b1111`) register.

| Command    | Value         | Description                                                          |
|------------|---------------|----------------------------------------------------------------------|
| `Stop`     | `0b00000000`  | Set mode to `Stopped`; stops the random number generation            |
| `Run`      | `0b00000001`  | Set mode to `Running`; starts generating a new $r$ every clock cycle |
| `Explicit` | `0b00000010`  | Set mode to `Explicit`; generate a new $r$ on `Advance` command only |
|            |               |                                                                      |
| `Advance`  | `0b00000011`  | Compute the next random bit / $r$                                    |
| `NOP`      | others        | Does not do anything                                                 |

**Note:** The register addresses are shown in binary, *not*, hex!

## Configuration

To configure either the shift register $r$ or the taps $t$, set the operation mode to `Stopped` (or `Explicit` and then do not issue an `Advance` command while setting the new values) and then write to the registers corresponding to the individual words. Note that you *can* write to `FIBREG`$n$/`TAPS`$n$ in any mode but be aware that $r$ might be updated while your are writing the new values.


### Example
As an example, we configure `FibgRNG` to be used as the RNG shown in Figure 1, i.e., $n=16$, $r=\langle 10101100 ~ 11100001 \rangle$ and $t=\langle 10000000 ~ 00101101\rangle$. The following [cocotb code]() 

```python
    await tqv.write_reg(CMD_REG, CMD_STOP)

    await tqv.write_reg(FIBREG1, int('10101100',2))
    await tqv.write_reg(FIBREG2, int('11100001',2))
    # FibReg3 and FibReg4 do not need to be set to zero

    await tqv.write_reg(TAPS1, int('10000000',2))
    await tqv.write_reg(TAPS2, int('00101101',2))
    # you *need* to clear the upper tap bits!
    await tqv.write_reg(TAPS3, 0)
    await tqv.write_reg(TAPS4, 0)

    await tqv.write_reg(CMD_REG, CMD_EXPLICIT)
```

It is important to set `TAPS3` and `TAPS4`to $\langle 0000000\rangle$ as *FibRNG* will 
always compute $\bigoplus\limits_{i=1}^{32} r_i \wedge t_i$ (i.e., up to $32$ bits). The 
taps having an index greater than $n$ ($16$ in this example) need to be zeroed as otherwise
these upper bits are used in the computation of $b$. Entries $r_{i}$ with $i > n$ can have 
arbitrary values as they will not be taken into account as we have $r_i \wedge t_i = r_i \wedge 0 = 0$ for 
all $i > n$.

This example can be directly transalted into a `C++` program.

## Register map


Reading from any address not specified in the table below will return the word `0b00000000`.

**Note:** The register addresses are shown in binary, *not*, hex!

**Note:** While the words start being counted by $1$, the concrete addresses sent to FibRng do start with $0$ internally.

| Address   | Name      | Access | Description                                       |
|-----------|-----------|:------:|---------------------------------------------------|
| `0b0000`  | `FIBREG1` | R/W    | $r[1:8]$, i.e., the first word of $r$             |
| `0b0001`  | `FIBREG2` | R/W    | $r[9:16]$, i.e., the second word of $r$           |
| `0b0010`  | `FIBREG3` | R/W    | $r[17:24]$, i.e., the third word of $r$           |
| `0b0011`  | `FIBREG4` | R/W    | $r[25:32]$, i.e., the fourth word of $r$          |
|           |           |        |                                                   |
| `0b0100`  | `TAPS1`   | R/W    | $t[1:8]$, i.e., the first word of $t$             |
| `0b0101`  | `TAPS2`   | R/W    | $t[9:16]$, i.e., the second word of $t$           |
| `0b0110`  | `TAPS3`   | R/W    | $t[17:24]$, i.e., the third word of $t$           |
| `0b0111`  | `TAPS4`   | R/W    | $t[25:32]$, i.e., the fourth word of $t$          |
|           |           |        |                                                   |
| `0b1111`  | `CMDREG`  | R/W    | Write: configure FibRNG                           |
|           |           |        | Read: read the current mode of operation          |

## How to test

The following cocotb code configures *FibRNG* to use a $3$-bit Fibonacci LFSR having the maximum length sequence of $2^3-1=7$.

```python

    await tqv.write_reg(ADDR_CMD, CMD_STOP)

    await tqv.write_reg(FIBREG1, int('11110000',2))
    # FibReg2, FibReg3 and FibReg4 do not need to be set to zero

    await tqv.write_reg(TAPS1, int('01100000',2))
    # you *need* to clear the upper tap bits!
    await tqv.write_reg(TAPS2, 0)
    await tqv.write_reg(TAPS3, 0)
    await tqv.write_reg(TAPS4, 0)

    await tqv.write_reg(CMD_REG, CMD_EXPLICIT)

    await tqv.write_reg(CMD_REG, CMD_ADVANCE)
    for i in range(8):
        await val = tqv.read_reg(FibReg1)

        # extract the upper bits
        v = f"{val:=08b}"[0:4]
        print(f"{i:=2}: {v})

    # das hier war falsch
    print(bin(val & int('11110000',2)))
```

## External hardware

No external hardware is used.

## References

* ["Linear-feedback shift register"](https://en.wikipedia.org/wiki/Linear-feedback_shift_register) -- Wikipedia 
* ["Maximum length sequence"](https://en.wikipedia.org/wiki/Maximum_length_sequence) -- Wikipedia 
* P. Alfke, “Efficient Shift Registers, LFSR Counters, and Long Pseudo-Random Sequence Generators,” Xilinx, Application Note XAPP 052, July 1996. [Available online](http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf)
