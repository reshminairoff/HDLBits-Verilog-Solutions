# 7458 Chip Implementation — Verilog HDL

## 📌 Overview
This project implements the **74LS58 chip**, a classic TTL logic IC consisting of **four AND gates and two OR gates**, arranged to form two independent AND-OR logic functions. The design takes **10 inputs** and produces **2 outputs**, replicating the real-world pinout and behavior of the physical chip.

Two implementation styles are provided to demonstrate different RTL design approaches to the same problem.

## ⚙️ How It Works

The chip is logically divided into two sections:

**Section 1 (6 inputs → 1 output):**
```
p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f)
```

**Section 2 (4 inputs → 1 output):**
```
p2y = (p2a & p2b) | (p2c & p2d)
```

### 🔀 Two Design Approaches

| Approach | Description |
|---|---|
| **Way 1 — Direct Assign** | Combinational logic written in a single `assign` statement per output, with no intermediate wires. Compact and minimal. |
| **Way 2 — Intermediate Wires** | Each AND gate output is captured in its own wire before being combined with OR gates. Mirrors the actual internal gate-level structure of the physical chip. |

Both implementations are functionally equivalent — the project explores **two valid coding styles** for the same hardware behavior, a useful comparison for understanding RTL readability versus structural accuracy.

## ✅ Conditions Covered in Testbench
The testbench (`tb_chip_7458.v`) verifies gate-level logic correctness across the following cases:

- **All-zero inputs** — baseline output check
- **Section 1 partial activation** — only the first AND branch (`p1a, p1b, p1c`) driven high
- **Section 1 alternate branch** — only the second AND branch (`p1d, p1e, p1f`) driven high
- **Section 2 partial activation** — only the first AND branch (`p2a, p2b`) driven high
- **Section 2 alternate branch** — only the second AND branch (`p2c, p2d`) driven high
- **All-one inputs** — full activation across both sections to confirm maximum logic output

Each test prints the resulting `p1y` and `p2y` values for manual or scripted verification.

## 🧪 Simulation
Verified using Icarus Verilog / EDA Playground.
🔗 **Live simulation:** [EDA Playground Link](https://www.edaplayground.com/x/g65J)

📂 **Source reference:** HDLBits Practice

## 🌍 Where Is This Used?
The 7458 is a real, widely used **TTL logic IC**, and AND-OR gate structures like this form the backbone of digital hardware design. This pattern appears in:

- **Combinational Logic Design** — building block for control logic, decoders, and multiplexers
- **Digital Circuit Education** — standard reference IC used in logic design courses and labs
- **ASIC/FPGA Gate-Level Modeling** — practicing structural vs. behavioral RTL coding styles
- **Legacy Hardware Replication** — modeling discrete logic ICs in HDL for simulation, testing, or system integration with older hardware

## 💡 Why This Matters
This project demonstrates:
- Translating a **physical IC datasheet/pinout** into accurate HDL
- Writing the **same logic in multiple coding styles** (behavioral vs. structural), a key RTL design skill
- Multi-output, multi-input combinational design and verification
- Building clean, traceable testbenches for gate-level validation

