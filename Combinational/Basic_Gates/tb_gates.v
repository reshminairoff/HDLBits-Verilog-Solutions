// ============================================
// tb_gates.v — Testbench for All Logic Gates
// Reshmi Aravindan Nair
// ============================================

`timescale 1ns/1ps

module tb_gates;

    // ----------------------------------------
    // INPUTS — declared as reg
    // ----------------------------------------
    reg a;
    reg b;
    reg in;       // for NOT gate only

    // ----------------------------------------
    // OUTPUTS — declared as wire
    // ----------------------------------------
    wire and_out;
    wire or_out;
    wire not_out;
    wire nand_out;
    wire nor_out;
    wire xor_out;
    wire xnor_out;

    // ----------------------------------------
    // CONNECT ALL MODULES
    // exactly matching your port names
    // ----------------------------------------
    and_gate  u1 ( .a(a),   .b(b), .out(and_out)  );
    or_gate   u2 ( .a(a),   .b(b), .out(or_out)   );
    not_gate  u3 ( .in(in),        .out(not_out)  );
    nand_gate u4 ( .a(a),   .b(b), .out(nand_out) );
    nor_gate  u5 ( .a(a),   .b(b), .out(nor_out)  );
    xor_gate  u6 ( .a(a),   .b(b), .out(xor_out)  );
    xnor_gate u7 ( .a(a),   .b(b), .out(xnor_out) );

    // ----------------------------------------
    // WAVEFORM DUMP
    // this is what generates your EPWave
    // ----------------------------------------
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_gates);
    end

    // ----------------------------------------
    // APPLY INPUTS — all 4 combinations
    // ----------------------------------------
    initial begin

        // initialise everything to 0
        a = 0; b = 0; in = 0;

        // --- Test 1 : a=0 b=0 ---
        a = 0; b = 0; in = 0;
        #10;

        // --- Test 2 : a=0 b=1 ---
        a = 0; b = 1; in = 0;
        #10;

        // --- Test 3 : a=1 b=0 ---
        a = 1; b = 0; in = 1;
        #10;

        // --- Test 4 : a=1 b=1 ---
        a = 1; b = 1; in = 1;
        #10;

        $finish;
    end

    // ----------------------------------------
    // PRINT RESULTS IN LOG
    // ----------------------------------------
    initial begin
        // print header
        $display("------------------------------------------------");
        $display("  a  b | AND  OR  NOT  NAND  NOR  XOR  XNOR   ");
        $display("------------------------------------------------");

        // wait for each test and print result
        // Test 1
        #10;
        $display("  %b  %b |  %b    %b    %b     %b     %b    %b     %b",
        a, b,
        and_out, or_out, not_out,
        nand_out, nor_out,
        xor_out, xnor_out);

        // Test 2
        #10;
        $display("  %b  %b |  %b    %b    %b     %b     %b    %b     %b",
        a, b,
        and_out, or_out, not_out,
        nand_out, nor_out,
        xor_out, xnor_out);

        // Test 3
        #10;
        $display("  %b  %b |  %b    %b    %b     %b     %b    %b     %b",
        a, b,
        and_out, or_out, not_out,
        nand_out, nor_out,
        xor_out, xnor_out);

        // Test 4
        #10;
        $display("  %b  %b |  %b    %b    %b     %b     %b    %b     %b",
        a, b,
        and_out, or_out, not_out,
        nand_out, nor_out,
        xor_out, xnor_out);

        $display("------------------------------------------------");
        $display("  Simulation complete!                          ");
        $display("------------------------------------------------");
    end

endmodule
