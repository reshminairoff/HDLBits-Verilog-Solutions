// ============================================
// gates.v — All Basic Logic Gates
// Reshmi Aravindan Nair
// Simulation:https://www.edaplayground.com/x/ifpM
// Source: HDLBits Practice
// ============================================


// --------------------------------------------
// 1. AND Gate
// --------------------------------------------
module and_gate(
    input  a,
    input  b,
    output out
);
    assign out = a & b;
endmodule


// --------------------------------------------
// 2. OR Gate
// --------------------------------------------
module or_gate(
    input  a,
    input  b,
    output out
);
    assign out = a | b;
endmodule


// --------------------------------------------
// 3. NOT Gate
// --------------------------------------------
module not_gate(
  output out, 
  input in 
);
	assign out = ~in ;
endmodule 

// --------------------------------------------
// 4. NAND Gate
// --------------------------------------------
module nand_gate(
    input  a,
    input  b,
    output out
);
    assign out = ~(a & b);
endmodule


// --------------------------------------------
// 5. NOR Gate
// --------------------------------------------
module nor_gate(
    input  a,
    input  b,
    output out
);
    assign out = ~(a | b);
endmodule


// --------------------------------------------
// 6. XOR Gate
// --------------------------------------------
module xor_gate(
    input  a,
    input  b,
    output out
);
    assign out = a ^ b;
endmodule


// --------------------------------------------
// 7. XNOR Gate
// --------------------------------------------
module xnor_gate(
    input  a,
    input  b,
    output out
);
    assign out = ~(a ^ b);
endmodule
