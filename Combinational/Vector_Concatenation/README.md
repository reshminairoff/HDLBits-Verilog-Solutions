# Vector Concatenation — Verilog HDL

## 📌 Overview
This module demonstrates **bit-vector concatenation and re-slicing**, combining fragments of six 5-bit input vectors (`a` through `f`) into four new 8-bit output vectors (`w`, `x`, `y`, `z`) using Verilog's concatenation operator `{}`. It's a practical exercise in reassembling non-aligned bit fields — a skill regularly needed when interfacing buses or registers of differing widths.

```verilog
input  [4:0] a, b, c, d, e, f;
output [7:0] w, x, y, z;

assign w = {a, b[4:2]};
assign x = {b[1:0], c, d[4]};
assign y = {d[3:0], e[4:1]};
assign z = {e[0], f, 2'b11};
```

## ⚙️ How It Works
Each output is built by concatenating selected bit-slices from different input vectors, in order from MSB to LSB:

| Output | Composition | Bit Width |
|---|---|---|
| `w` | `a` (5 bits) + `b[4:2]` (3 bits) | 8 bits |
| `x` | `b[1:0]` (2 bits) + `c` (5 bits) + `d[4]` (1 bit) | 8 bits |
| `y` | `d[3:0]` (4 bits) + `e[4:1]` (4 bits) | 8 bits |
| `z` | `e[0]` (1 bit) + `f` (5 bits) + `2'b11` (constant) | 8 bits |

Each input bit is reused across exactly two output fields (e.g., `b` contributes to both `w` and `x`), and `z` always ends in a fixed `11` suffix — making this a good exercise in tracking bit reuse and constant padding within concatenation expressions.

## ✅ Conditions Covered in Testbench
The testbench (`tb_vector_concatenation.v`) uses a reusable `check` task for automated pass/fail comparison, alongside manual-inspection tests for more complex cases:

- **All-zero inputs** — baseline check, confirms `z` correctly ends in the fixed `11` suffix even when all data bits are zero
- **All-one inputs** — upper boundary check across all six inputs simultaneously
- **Incremental input values** — distinct values per input to verify correct bit-slice placement and ordering within each concatenation
- **Alternating bit pattern** (`10101`/`01010`) — stresses bit-position accuracy by using maximally distinguishable patterns
- **Constant suffix verification** — dedicated check confirming `z[1:0]` always equals `11` regardless of input values, validating the fixed-bit concatenation

This combination of automated checks and manual waveform-reviewed cases reflects a practical, real-world verification approach for bit-manipulation logic.

## 🧪 Simulation
Verified using Icarus Verilog / EDA Playground.
🔗 **Live simulation:** [EDA Playground Link](https://www.edaplayground.com/x/fPUs)

📂 **Source reference:** Original design exercise

## 🌍 Where Is This Used?
Vector concatenation and bit-field reassembly are everyday operations in digital hardware design, used in:

- **Bus Width Adaptation** — combining or repacking narrower signals into wider buses (or vice versa) when interfacing mismatched components
- **Packet/Frame Construction** — assembling header and payload fields from multiple source registers in communication protocols
- **Instruction Decoding** — reconstructing opcode/operand fields from scattered bit positions in instruction words
- **Register Mapping** — packing multiple control/status fields into a single register, or unpacking them back out

## 💡 Why This Matters
This project demonstrates command of:
- Verilog's **concatenation operator** `{}` and precise bit-slice selection (`vec[msb:lsb]`)
- Careful tracking of **bit reuse across multiple outputs** — a common source of off-by-one errors in real designs
- Mixing **constant values** with dynamic signals within a single concatenation expression
- A blended verification strategy combining **automated self-checking** and **targeted manual inspection**, mirroring how verification is often approached for non-trivial bit-manipulation logic
