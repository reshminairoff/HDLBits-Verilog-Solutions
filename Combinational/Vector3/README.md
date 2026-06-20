# Vector3 — 3-bit Vector Split — Verilog HDL

## 📌 Overview
This module takes a **3-bit input vector** and produces two things simultaneously: the same vector passed through unchanged, and each of its three bits broken out into individual 1-bit outputs. It demonstrates how a bus signal can be both preserved as a whole and decomposed into its constituent bits within the same module.

```verilog
input  wire [2:0] vec;
output wire [2:0] outv;
output wire o2, o1, o0;

assign outv = vec;
assign o0 = vec[0];
assign o1 = vec[1];
assign o2 = vec[2];
```

## ⚙️ How It Works
The module performs two parallel operations on the same input vector:

| Output | Source | Description |
|---|---|---|
| `outv` | `vec` | Full 3-bit vector passed through unchanged |
| `o0` | `vec[0]` | Least significant bit (LSB) |
| `o1` | `vec[1]` | Middle bit |
| `o2` | `vec[2]` | Most significant bit (MSB) |

**Example:**
```
Input  : vec = 3'b101
Output : outv = 3'b101, o2 = 1, o1 = 0, o0 = 1
```

## ✅ Conditions Covered in Testbench
The testbench (`tb_vector3.v`) exhaustively applies **all 8 possible combinations** of the 3-bit input (`000` through `111`), giving **100% input coverage** for this design. For each combination, it prints the full vector alongside each individual bit output, allowing direct visual verification that:

- The vector passthrough (`outv`) always matches the input exactly
- Each bit output (`o2`, `o1`, `o0`) correctly reflects its corresponding bit position
- Bit ordering and indexing remain consistent across every possible input state

Since the input space is small, exhaustive testing is both practical and the most rigorous verification approach possible for this module.

## 🧪 Simulation
Verified using Icarus Verilog / EDA Playground.
🔗 **Live simulation:** [EDA Playground Link](https://www.edaplayground.com/x/L7G2)

📂 **Source reference:** Original design exercise

## 🌍 Where Is This Used?
Vector-to-bit decomposition (and the reverse, bit-to-vector composition) is a routine operation in digital systems, commonly seen in:

- **Bus Monitoring & Debugging** — exposing individual bits of a status or control register for observation on FPGA debug pins or logic analyzers
- **Control & Status Registers (CSRs)** — where individual flag bits within a register need independent access (e.g., enable, interrupt, ready flags)
- **GPIO Interfaces** — mapping a multi-bit port to individual physical pins
- **Test & Verification Infrastructure** — breaking down bus signals for waveform inspection or assertion checking during simulation

## 💡 Why This Matters
Although minimal, this module demonstrates clear understanding of:
- **Bit-indexing and vector handling** in Verilog — a foundational RTL skill
- The distinction between a **bus signal** and its **individual bit components**, and how to expose both cleanly in a module interface
- Writing **exhaustive testbenches** for small input spaces — a best practice that guarantees complete functional coverage rather than relying on a handful of sample cases
