# 🔲 Basic Logic Gates — Verilog HDL Implementation

**File:** `gates.v`
**Author:** Reshmi Aravindan Nair
**Platform:** [EDA Playground Simulation](https://www.edaplayground.com/x/ifpM)
**Source:** HDLBits Practice

---

## 📌 Overview

This module implements all fundamental logic gates from scratch using **Verilog HDL** with continuous `assign` statements — the most hardware-accurate way to describe combinational logic at the RTL level.

Each gate is written as a **separate, self-contained module** to reflect real-world digital design practices where individual components are instantiated and reused across larger systems. This structure directly mirrors how logic cells are defined in standard cell libraries used in ASIC and FPGA design flows.

> **Why this matters:** Every complex digital system — from ALUs to processors — is ultimately built from these primitive gates. A thorough understanding of their behaviour, truth tables, and Verilog representation is the foundation of all RTL design.

---

## 🎯 Aim

- Implement all basic logic gates using synthesizable Verilog
- Practice correct module declaration with `input` / `output` port syntax
- Use `assign` statements for clean, single-line combinational logic
- Verify functional correctness through simulation on EDA Playground
- Build a reusable gate library that can be instantiated in future designs

---

## 🛠️ Implementation Details

| Gate | Module Name | Verilog Operator | Logic Expression |
|---|---|---|---|
| AND | `and_gate` | `&` | `out = a & b` |
| OR | `or_gate` | `\|` | `out = a \| b` |
| NOT | `not_gate` | `~` | `out = ~in` |
| NAND | `nand_gate` | `~( & )` | `out = ~(a & b)` |
| NOR | `nor_gate` | `~( \| )` | `out = ~(a \| b)` |
| XOR | `xor_gate` | `^` | `out = a ^ b` |
| XNOR | `xnor_gate` | `~( ^ )` | `out = ~(a ^ b)` |

---

## 📐 Truth Tables

### AND Gate — Output is HIGH only when both inputs are HIGH

| A | B | Output |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | **1** |

---

### OR Gate — Output is HIGH when at least one input is HIGH

| A | B | Output |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | **1** |
| 1 | 0 | **1** |
| 1 | 1 | **1** |

---

### NOT Gate — Output is the inverse of the input

| A | Output |
|---|---|
| 0 | **1** |
| 1 | 0 |

---

### NAND Gate — Inverse of AND. Output is LOW only when both inputs are HIGH

| A | B | Output |
|---|---|---|
| 0 | 0 | **1** |
| 0 | 1 | **1** |
| 1 | 0 | **1** |
| 1 | 1 | 0 |

---

### NOR Gate — Inverse of OR. Output is HIGH only when both inputs are LOW

| A | B | Output |
|---|---|---|
| 0 | 0 | **1** |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

---

### XOR Gate — Output is HIGH when inputs are different

| A | B | Output |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | **1** |
| 1 | 0 | **1** |
| 1 | 1 | 0 |

---

### XNOR Gate — Output is HIGH when inputs are the same

| A | B | Output |
|---|---|---|
| 0 | 0 | **1** |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | **1** |

---

## 🔬 Simulation

All gates are simulated and verified on **EDA Playground**:
👉 [View Simulation](https://www.edaplayground.com/x/ifpM)

The testbench applies all possible input combinations for each gate and the output waveform confirms correct behaviour against the truth tables above.

---

## ✅ Conclusion

This implementation demonstrates:

- **RTL-level thinking** — each gate is written as it would appear in a real synthesis netlist
- **Clean code structure** — separate modules for each gate allows easy instantiation and testing
- **Synthesizable Verilog** — all `assign` statements are directly mappable to hardware primitives
- **Verification discipline** — every module is backed by simulation, not just written and assumed correct

NAND and NOR gates hold special significance in digital design — they are **functionally complete**, meaning any Boolean function can be implemented using only NAND gates or only NOR gates. This property is fundamental to CMOS logic families used in all modern chips.

These gates serve as the building blocks for all future modules in this repository including adders, multiplexers, encoders, and finite state machines.## Truth Tables
