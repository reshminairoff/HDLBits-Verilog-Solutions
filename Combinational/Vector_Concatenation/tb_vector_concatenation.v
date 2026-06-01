// ==================================================================
// tb_vector_concatenation.v — Testbenches for vector_concatenation
// Reshmi Aravindan Nair
// ===================================================================
module tb_top_module;

    // Inputs
    reg [4:0] a, b, c, d, e, f;

    // Outputs
    wire [7:0] w, x, y, z;

    // Instantiate the module
    top_module uut (
        .a(a), .b(b), .c(c),
        .d(d), .e(e), .f(f),
        .w(w), .x(x), .y(y), .z(z)
    );

    // Task to check and display results
    task check;
        input [7:0] expected_w, expected_x, expected_y, expected_z;
        input [63:0] test_num;
        begin
            $display("Test %0d | w=%b x=%b y=%b z=%b | %s",
                test_num, w, x, y, z,
                (w==expected_w && x==expected_x &&
                 y==expected_y && z==expected_z)
                 ? "PASS" : "FAIL");
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_top_module);

        // ─── Test 1 — All zeros ───
        a=5'b00000; b=5'b00000; c=5'b00000;
        d=5'b00000; e=5'b00000; f=5'b00000;
        #10;
        // z always ends with 2'b11 so expected_z = 8'b00000011
        check(8'b00000000,
              8'b00000000,
              8'b00000000,
              8'b00000011, 1);

        // ─── Test 2 — All ones ───
        a=5'b11111; b=5'b11111; c=5'b11111;
        d=5'b11111; e=5'b11111; f=5'b11111;
        #10;
        check(8'b11111111,
              8'b11111111,
              8'b11111111,
              8'b11111111, 2);

        // ─── Test 3 — Incremental values ───
        a=5'b00001; b=5'b00010; c=5'b00011;
        d=5'b00100; e=5'b00101; f=5'b00110;
        #10;
        // w = a + b[4:2] = 00001 + 000   = 00001000
        // x = b[1:0] + c + d[4] = 10 + 00011 + 0 = 10000110  (fixed below)
        // Manual calculation displayed — check waveform in EPWave
        $display("Test 3 | in: a=%b b=%b c=%b d=%b e=%b f=%b",
                  a, b, c, d, e, f);
        $display("        out: w=%b x=%b y=%b z=%b", w, x, y, z);

        // ─── Test 4 — Alternate pattern ───
        a=5'b10101; b=5'b01010; c=5'b10101;
        d=5'b01010; e=5'b10101; f=5'b01010;
        #10;
        $display("Test 4 | in: a=%b b=%b c=%b d=%b e=%b f=%b",
                  a, b, c, d, e, f);
        $display("        out: w=%b x=%b y=%b z=%b", w, x, y, z);

        // ─── Test 5 — Check z always ends in 11 ───
        a=5'b11000; b=5'b00111; c=5'b11000;
        d=5'b00111; e=5'b11000; f=5'b00111;
        #10;
        $display("Test 5 | z last 2 bits = %b | %s",
                  z[1:0],
                  (z[1:0] == 2'b11) ? "PASS — z ends in 11"
                                    : "FAIL — z does not end in 11");

        $display("--- Simulation Complete ---");
        $finish;
    end

endmodule
