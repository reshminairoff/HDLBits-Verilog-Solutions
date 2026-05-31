`timescale 1ns/1ps

module tb_chip_7458;

    reg p1a, p1b, p1c;
    reg p1d, p1e, p1f;
    reg p2a, p2b, p2c, p2d;

    wire p1y;
    wire p2y;

    chip_7458_direct uut (
        .p1a(p1a),
        .p1b(p1b),
        .p1c(p1c),
        .p1d(p1d),
        .p1e(p1e),
        .p1f(p1f),
        .p1y(p1y),

        .p2a(p2a),
        .p2b(p2b),
        .p2c(p2c),
        .p2d(p2d),
        .p2y(p2y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_chip_7458);
    end

    initial begin

        $display("7458 Chip Simulation");

        // Test 1
        p1a=0; p1b=0; p1c=0;
        p1d=0; p1e=0; p1f=0;
        p2a=0; p2b=0; p2c=0; p2d=0;
        #10;

        $display("T1: p1y=%b p2y=%b", p1y, p2y);

        // Test 2
        p1a=1; p1b=1; p1c=1;
        p1d=0; p1e=0; p1f=0;
        #10;

        $display("T2: p1y=%b p2y=%b", p1y, p2y);

        // Test 3
        p1a=0; p1b=0; p1c=0;
        p1d=1; p1e=1; p1f=1;
        #10;

        $display("T3: p1y=%b p2y=%b", p1y, p2y);

        // Test 4
        p2a=1; p2b=1;
        p2c=0; p2d=0;
        #10;

        $display("T4: p1y=%b p2y=%b", p1y, p2y);

        // Test 5
        p2a=0; p2b=0;
        p2c=1; p2d=1;
        #10;

        $display("T5: p1y=%b p2y=%b", p1y, p2y);

        // Test 6
        p1a=1; p1b=1; p1c=1;
        p1d=1; p1e=1; p1f=1;

        p2a=1; p2b=1;
        p2c=1; p2d=1;
        #10;

        $display("T6: p1y=%b p2y=%b", p1y, p2y);

        $finish;
    end

endmodule
