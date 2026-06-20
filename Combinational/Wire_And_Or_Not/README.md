# Wire AND-OR-NOT — Verilog HDL

## 📌 Overview
This module implements a basic **AND-OR-INVERT (AOI) logic function**, combining two AND gates, an OR gate, and an inverter to produce both a direct output and its complement. AOI structures like this are among the most fundamental building blocks in combinational digital logic.

```verilog
input  a, b, c, d;
output out, out_n;

assign out   = (a & b) | (c & d);
assign out_n = ~((a & b) | (c & d));
```

## ⚙️ How It Works
The circuit evaluates two independent AND conditions, combines them with an OR, and produces both the result and its logical inverse:

| Signal | Logic | Description |
|---|---|---|
| `out` | `(a & b) \| (c & d)` | High if **either** input pair (`a,b` or `c,d`) is fully high |
| `out_n` | `~out` | Inverted (NOT) version of `out` — a NAND-OR-AND composite |

**Example:**
```
a=1, b=1, c=0, d=0  →  out = 1, out_n = 0
a=0, b=0, c=0, d=0  →  out = 0, out_n = 1
```

## ✅ Conditions Covered in Testbench
The testbench (`tb_wire_and_or_not.v`) applies a structured set of input combinations covering the key logic paths:

- **All-zero inputs** — confirms baseline low output
- **Single bit set (`d=1`)** — verifies a lone high bit cannot trigger the output
- **One AND pair fully high (`c=1, d=1`)** — confirms the second AND-OR branch alone can drive `out` high
- **Other AND pair fully high (`a=1, b=1`)** — confirms the first AND-OR branch alone can drive `out` high
- **Mixed activation (`a=1, c=1, d=1`)** — tests a partially overlapping combination across both branches
- **All-one inputs** — confirms both AND branches active simultaneously still produces the correct result

Across all cases, the testbench also implicitly verifies that `out` and `out_n` remain consistent complements of one another.

## 🧪 Simulation
Verified using Icarus Verilog / EDA Playground.
🔗 **Live simulation:** [EDA Playground Link](https://www.edaplayground.com/x/XSc8)

📂 **Source reference:** HDLBits Practice

## 🌍 Where Is This Used?
AND-OR-INVERT (AOI) logic structures are foundational primitives in digital hardware, appearing in:

- **Standard Cell Libraries** — AOI gates are common pre-characterized cells in ASIC standard cell libraries, valued for their compact transistor-level implementation
- **Combinational Control Logic** — used in decoders, multiplexer select logic, and condition-checking circuits
- **Glue Logic** — small AOI blocks frequently used to combine multiple enable/control signals on PCBs and FPGAs
- **Digital Circuit Education** — a classic example for teaching De Morgan's theorem and complementary logic design

## 💡 Why This Matters
This project, while simple, reinforces core digital design fundamentals:
- Building **multi-level combinational logic** (AND → OR → NOT) in a single, clean expression
- Understanding **complementary output design** — providing both a signal and its inverse, a common requirement in real hardware interfaces
- Systematic test vector selection that isolates each logic branch individually before combining them
- A foundation for recognizing **AOI/OAI gate structures**, which are heavily used in ASIC standard-cell design for area and power efficiency
