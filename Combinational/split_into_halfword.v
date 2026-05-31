// ============================================
// split_into_halfword.v: split_into_halfword
// Reshmi Aravindan Nair
// Simulation: 
// Source: HDLBits Practice
// ============================================
module split_into_halfword (
	input wire [15:0] in ,
	output wire [7:0] out_hi ,
	output wire [7:0] out_lo 
) ;
	assign out_hi = in [15:8] ;
	assign out_lo = in [7:0] ;
endmodule 
