// ============================================
// vector3.v — 3-bit Vector Split
// Input : 3-bit vector
// Output: same vector + 3 separate 1-bit outputs
// Source: HDLBits — Problem Statement 11
// Reshmi Aravindan Nair
// ============================================

module vector3(
    input  wire [2:0] vec,    // 3-bit input vector
    output wire [2:0] outv,   // same vector as output
    output wire       o2,     // bit position 2
    output wire       o1,     // bit position 1
    output wire       o0      // bit position 0
);

    // Output the full vector as-is
    assign outv = vec;        // correct — no [2:0] needed here

    // Split into individual bits
    assign o0 = vec[0];       // position 0 → LSB (least significant)
    assign o1 = vec[1];       // position 1 → middle bit
    assign o2 = vec[2];       // position 2 → MSB (most significant)

endmodule
