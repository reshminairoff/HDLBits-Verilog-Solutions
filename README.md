⚡ Verilog HDL Practice — HDLBits Solutions & Digital Design Modules

A structured collection of Verilog HDL implementations covering combinational logic, datapath design, and RTL modules — solved as part of the HDLBits online exercise platform and extended with custom design challenges.


📌 About This Repository
This repository documents my hands-on journey through hardware description language (HDL) design using Verilog. Each module is written, simulated, and verified as part of systematic practice to build proficiency in RTL (Register Transfer Level) design — a core skill in VLSI, FPGA, and SoC development roles.
The problems are sourced primarily from HDLBits, a widely used platform for practising digital logic in Verilog, and are organized by topic for clarity and ease of review.

🗂️ Repository Structure

Combinational/
Basic_Gates/          # AND, OR, NAND, NOR, XOR gate implementations
Byte_Reversal/        # 32-bit byte order reversal using bit manipulation
Chip_7458/            # Replication of the 7458 dual AND-OR-INVERT gate IC
Split_into_Half_word/ # 32-bit word splitter into two 16-bit half-words
Vector3/              # Bit vector operations and indexing
Vector_Concatenation/ # Multi-vector concatenation and replication
Wire_And_Or_Not/      # Fundamental wire and logic gate drive circuits

🔄 This repository is actively growing. New modules covering sequential logic, finite state machines, arithmetic circuits, and timing design will be added as I complete the full HDLBits curriculum.


🧠 Topics Covered
✅ Combinational Logic (Current)
ModuleConceptBasic_GatesGate-level primitives: AND, OR, XOR, NAND, NOR, XNORWire_And_Or_NotContinuous assignment, wire driving, basic inversionVector3Packed vectors, part-selects, bit indexingVector_Concatenation{} concatenation operator, {n{}} replicationByte_ReversalStructural bit manipulation of multi-byte dataSplit_into_Half_wordDatapath slicing — splitting words into sub-wordsChip_7458IC-level combinational logic replication

🛠️ Tools & Technologies
Tool                                                Purpose
Verilog HDL (IEEE 1364)                 Hardware description and RTL design
HDLBits Online Judge                    Problem sourcing and functional verification
EDA PLayground (online)                 Simulation and waveform analysis
