//
// File: fadd_32bit_hierarchical_adder.sv
// Description:
// 32-bit adder built using hierarchical design:
// - top_module: 32-bit adder using two 16-bit adders (add16)
// - add16 (provided): built internally using 16 full adders (add1)
// - add1: 1-bit full adder (user implemented)
//
// Architecture:
// a[31:0] + b[31:0] = sum[31:0]
// Lower 16 bits generate carry for upper 16 bits
//

// ======================================================
// TOP LEVEL MODULE (32-bit adder using two 16-bit blocks)
// ======================================================
module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    // -----------------------------
    // Split inputs into lower and upper 16-bit parts
    // -----------------------------
    logic [15:0] low_a, high_a;
    logic [15:0] low_b, high_b;

    assign low_a  = a[15:0];   // lower half of operand a
    assign high_a = a[31:16];  // upper half of operand a

    assign low_b  = b[15:0];   // lower half of operand b
    assign high_b = b[31:16];  // upper half of operand b

    // -----------------------------
    // Internal wires for intermediate results
    // -----------------------------
    logic [15:0] out_low, out_high;
    logic carry;   // carry from lower 16-bit addition

    // -----------------------------
    // Lower 16-bit adder
    // Computes: low_a + low_b + 0
    // Produces sum + carry-out
    // -----------------------------
    add16 inst_1 (
        .a(low_a),
        .b(low_b),
        .cin(1'b0),      // no initial carry-in
        .sum(out_low),
        .cout(carry)     // forwarded to upper block
    );

    // -----------------------------
    // Upper 16-bit adder
    // Computes: high_a + high_b + carry
    // -----------------------------
    add16 inst_2 (
        .a(high_a),
        .b(high_b),
        .cin(carry),     // carry from lower stage
        .sum(out_high),
        .cout()          // ignored final carry-out
    );

    // -----------------------------
    // Combine upper and lower results
    // -----------------------------
    assign sum = {out_high, out_low};

endmodule


// ======================================================
// 1-BIT FULL ADDER (basic building block)
// ======================================================
module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    // -----------------------------
    // Full adder equations:
    // sum  = a XOR b XOR cin
    // cout = majority(a, b, cin)
    // -----------------------------

    assign sum  = a ^ b ^ cin;

    assign cout = (a & b) |
                  (a & cin) |
                  (b & cin);

endmodule