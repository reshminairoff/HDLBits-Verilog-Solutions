// Code your testbench here
// or browse Examples
module tb_top_module;

    // Inputs
    reg [31:0] in;
    
    // Outputs
    wire [31:0] out;
    
    // Instantiate the module
    top_module uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_top_module);
        
        // Test 1 — Basic swap
        // Input:  AABBCCDD
        // Output: DDCCBBAA
        in = 32'hAABBCCDD;
        #10;
        $display("Test 1 | in = %h | out = %h | Expected: DDCCBBAA | %s",
            in, out, (out == 32'hDDCCBBAA) ? "PASS" : "FAIL");
        
        // Test 2 — All zeros
        in = 32'h00000000;
        #10;
        $display("Test 2 | in = %h | out = %h | Expected: 00000000 | %s",
            in, out, (out == 32'h00000000) ? "PASS" : "FAIL");
        
        // Test 3 — All ones
        in = 32'hFFFFFFFF;
        #10;
        $display("Test 3 | in = %h | out = %h | Expected: FFFFFFFF | %s",
            in, out, (out == 32'hFFFFFFFF) ? "PASS" : "FAIL");
        
        // Test 4 — Incremental bytes
        // Input:  01020304
        // Output: 04030201
        in = 32'h01020304;
        #10;
        $display("Test 4 | in = %h | out = %h | Expected: 04030201 | %s",
            in, out, (out == 32'h04030201) ? "PASS" : "FAIL");
        
        // Test 5 — Real world: endian swap
        // Input:  12345678
        // Output: 78563412
        in = 32'h12345678;
        #10;
        $display("Test 5 | in = %h | out = %h | Expected: 78563412 | %s",
            in, out, (out == 32'h78563412) ? "PASS" : "FAIL");
        
        $display("--- Simulation Complete ---");
        $finish;
    end

endmodule
