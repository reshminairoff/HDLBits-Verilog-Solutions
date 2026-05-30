// ============================================
// chip_7458.v — 7458 Chip Implementation
// Four AND gates + Two OR gates
// 10 inputs, 2 outputs
// Tried BOTH ways as the problem suggests
// Source: HDLBits
// Reshmi Aravindan Nair
// ============================================

// ============================================
// WAY 1 — Direct assign (no intermediate wires)
// ============================================
module chip_7458_direct(
  input p1a , p1b , p1c , p1d , p1e , p1f ,
	output p1y ,
	input p2a , p2b , p2c , p2d , 
	output p2y  
) ;
// Everything in one line each — no wires needed
	assign  p1y = ( p1a & p1c & p1b ) | ( p1f & p1e & p1d ) ;
	assign p2y = ( p2a & p2b ) | ( p2c & p2d ) ;
endmodule 


// ============================================
// WAY 2 — Using intermediate wires (4 wires)
// ============================================
module chip_7458_wires(
    input  p1a, p1b, p1c, p1d, p1e, p1f,
    input  p2a, p2b, p2c, p2d,
    output p1y,
    output p2y
);

    // Four intermediate wires, one per AND gate
    wire and1_out;   // p1a & p1b
    wire and2_out;   // p1c & p1d
    wire and3_out;   // p1e & p1f
    wire and4_out;   // p2a & p2b & p2c & p2d

    // Four AND gates
    assign and1_out = p1a & p1b;
    assign and2_out = p1c & p1d;
    assign and3_out = p1e & p1f;
    assign and4_out = p2a & p2b & p2c & p2d;

    // Two OR gates combining AND outputs
    assign p1y = and1_out | and2_out | and3_out;
    assign p2y = and4_out;

endmodule


