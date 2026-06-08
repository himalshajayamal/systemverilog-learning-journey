// File: add32_using_two_add16.sv
// Description: 32-bit adder built using two 16-bit ripple adders (add16 modules)
// Architecture: Lower 16-bit adder generates carry for upper 16-bit adder

module top_module(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    // -----------------------------
    // Split 32-bit inputs into halves
    // -----------------------------
    wire [15:0] lo_a, hi_a;   // lower and upper half of input a
    wire [15:0] lo_b, hi_b;   // lower and upper half of input b

    assign lo_a = a[15:0];    // least significant 16 bits of a
    assign hi_a = a[31:16];   // most significant 16 bits of a

    assign lo_b = b[15:0];    // least significant 16 bits of b
    assign hi_b = b[31:16];   // most significant 16 bits of b

    // -----------------------------
    // Internal wires for results
    // -----------------------------
    wire [15:0] sum_lo;   // sum of lower 16 bits
    wire [15:0] sum_hi;   // sum of upper 16 bits
    wire carry;           // carry from lower adder

    // -----------------------------
    // Lower 16-bit adder
    // Computes: lo_a + lo_b + 0
    // Produces sum_lo and carry-out
    // -----------------------------
    add16 u0 (
        .a(lo_a),
        .b(lo_b),
        .cin(1'b0),     // no initial carry-in
        .sum(sum_lo),
        .cout(carry)    // carry forwarded to upper adder
    );

    // -----------------------------
    // Upper 16-bit adder
    // Computes: hi_a + hi_b + carry
    // -----------------------------
    add16 u1 (
        .a(hi_a),
        .b(hi_b),
        .cin(carry),    // carry from lower stage
        .sum(sum_hi),
        .cout()         // ignored final carry-out
    );

    // -----------------------------
    // Combine upper and lower results
    // -----------------------------
    assign sum = {sum_hi, sum_lo};

endmodule