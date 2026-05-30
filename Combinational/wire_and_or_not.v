// ============================================
// wire_and_or_not.v : wire _and_or_not
// Reshmi Aravindan Nair
// Simulation:https: https://www.edaplayground.com/x/XSc8
// Source: HDLBits Practice
// ============================================
module top_module (
	input a ,
	input b ,
	input c ,
	input d ,
	output out ,
	output out_n
);
	assign out = ( a & b ) | ( c & d ) ;
	assign out_n = ~ ( ( a & b ) | ( c & d) ) ;
endmodule
