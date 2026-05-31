// Code your testbench here
// or browse Examples
// ============================================
// tb_split_into_halfword.v — Testbench
// ============================================
`timescale 1ns/1ps

module tb_split_into_halfword;

  // Inputs
  reg [15:0] in;

  // Outputs
  wire [7:0] out_hi;
  wire [7:0] out_lo;

  // Instantiate DUT
  split_into_halfword uut (
    .in    (in),
    .out_hi(out_hi),
    .out_lo(out_lo)
  );

  // Task: apply stimulus and check output
  task apply_and_check;
    input [15:0] stimulus;
    input [7:0]  exp_hi;
    input [7:0]  exp_lo;
    begin
      in = stimulus;
      #10;
      if (out_hi !== exp_hi || out_lo !== exp_lo) begin
        $display("FAIL: in=%h | out_hi=%h (exp %h) | out_lo=%h (exp %h)",
                  stimulus, out_hi, exp_hi, out_lo, exp_lo);
      end else begin
        $display("PASS: in=%h | out_hi=%h | out_lo=%h",
                  stimulus, out_hi, out_lo);
      end
    end
  endtask

  initial begin
    $display("=== split_into_halfword testbench ===");
    $display("%-20s %-10s %-10s", "in [15:0]", "out_hi", "out_lo");
    $display("--------------------------------------");

    // Test vectors:          input       exp_hi  exp_lo
    apply_and_check(16'hABCD, 8'hAB,     8'hCD);
    apply_and_check(16'h1234, 8'h12,     8'h34);
    apply_and_check(16'hFFFF, 8'hFF,     8'hFF);
    apply_and_check(16'h0000, 8'h00,     8'h00);
    apply_and_check(16'hFF00, 8'hFF,     8'h00);
    apply_and_check(16'h00FF, 8'h00,     8'hFF);
    apply_and_check(16'h8000, 8'h80,     8'h00);
    apply_and_check(16'h0001, 8'h00,     8'h01);
    apply_and_check(16'hDEAD, 8'hDE,     8'hAD);
    apply_and_check(16'hBEEF, 8'hBE,     8'hEF);

    $display("--------------------------------------");
    $display("Simulation complete.");
    $finish;
  end

  // Waveform dump (for EPWave viewer in EDA Playground)
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_split_into_halfword);
  end

endmodule
