// ============================================
// tb_vector3.v — Testbenches for vector3
// Reshmi Aravindan Nair
// ===========================================
`timescale 1ns/1ps

module tb_vector3;

    reg  [2:0] vec;
    wire [2:0] outv;
    wire o2, o1, o0;

    // Instantiate DUT
    vector3 uut (
        .vec(vec),
        .outv(outv),
        .o2(o2),
        .o1(o1),
        .o0(o0)
    );

    // Generate waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_vector3);
    end

    // Apply test vectors
    initial begin

        $display("======================================");
        $display(" vec   outv   o2 o1 o0");
        $display("======================================");

        vec = 3'b000; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b001; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b010; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b011; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b100; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b101; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b110; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        vec = 3'b111; #10;
        $display("%b    %b     %b  %b  %b", vec,outv,o2,o1,o0);

        $finish;
    end

endmodule
