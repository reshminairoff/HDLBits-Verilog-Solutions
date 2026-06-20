# Byte Reversal (Endianness Converter) — Verilog HDL

## 📌 Overview
This module performs a **32-bit byte-order reversal**, converting a 4-byte input word from one endianness to another by swapping the byte positions. It is a fundamental building block used in digital design, embedded systems, and data communication interfaces.

```verilog
input  [31:0] in;
output [31:0] out;
assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};
```

## ⚙️ How It Works
The 32-bit input is split into four 8-bit bytes, which are then reordered in reverse sequence:

| Input Byte Position | Output Byte Position |
|---|---|
| Byte 0 (LSB)  | Byte 3 (MSB) |
| Byte 1        | Byte 2       |
| Byte 2        | Byte 1       |
| Byte 3 (MSB)  | Byte 0 (LSB) |

**Example:**
```
Input  : 32'h12345678
Output : 32'h78563412
```

## ✅ Conditions Covered in Testbench
The included testbench (`tb_byte_reversal.v`) verifies correct functionality across the following cases:

- **Basic byte swap** — confirms standard reversal logic
- **All-zero input** — edge case for lower boundary
- **All-one input** — edge case for upper boundary
- **Incremental byte pattern** — validates byte-level ordering correctness
- **Real-world endian conversion** — simulates a practical Big-Endian ↔ Little-Endian swap scenario

Each test case prints a `PASS`/`FAIL` result for quick verification, making the design easy to validate and debug.

## 🧪 Simulation
Verified using Icarus Verilog / EDA Playground.
🔗 **Live simulation:** [EDA Playground Link](https://www.edaplayground.com/x/Ugz4)

📂 **Source reference:** HDLBits Practice

## 🌍 Where Is This Used?
Byte/endianness reversal logic is a **core operation in real-world digital systems**, including:

- **Networking & Communication Protocols** — converting data between Big-Endian (network byte order) and Little-Endian (host byte order) formats (e.g., Ethernet, TCP/IP packet processing)
- **Memory & Bus Interfaces** — aligning data formats between processors and peripherals with different byte ordering conventions
- **FPGA/ASIC Data Pipelines** — used in DSP, video processing, and high-speed data transfer modules
- **Embedded Systems** — interfacing between microcontrollers and external devices with mismatched endianness

## 💡 Why This Matters
Although simple in implementation, byte reversal logic demonstrates a strong understanding of:
- Bit/byte-level manipulation in hardware description languages
- RTL design principles and combinational logic design
- Endianness — a critical, often overlooked concept in hardware-software interfacing
- Verification methodology through self-checking testbenches

