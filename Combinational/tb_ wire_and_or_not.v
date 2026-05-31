// ============================================
// tb_ wire_and_or_not.v — Testbench for wire_and_or_not
// Reshmi Aravindan Nair
// ============================================
`timescale 1ns/1ps

module tb_top_module;

    reg a, b, c, d;
    wire out, out_n;

    // Instantiate DUT
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out),
        .out_n(out_n)
    );

    // Generate waveform file
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_top_module);
    end

    initial begin

        $display("=====================================");
        $display(" a b c d | out out_n");
        $display("=====================================");

        a=0; b=0; c=0; d=0; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        a=0; b=0; c=0; d=1; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        a=0; b=0; c=1; d=1; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        a=1; b=1; c=0; d=0; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        a=1; b=0; c=1; d=1; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        a=1; b=1; c=1; d=1; #10;
        $display(" %b %b %b %b |  %b    %b", a,b,c,d,out,out_n);

        $finish;
    end

endmodule
