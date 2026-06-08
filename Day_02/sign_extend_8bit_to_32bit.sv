module top_module (
    input [7:0] in,
    output [31:0] out
);

    // ============================================================
    // Sign Extension: Extend an 8-bit signed number to 32 bits
    // ============================================================
    //
    // The sign bit is the MSB (Most Significant Bit):
    //
    //     in[7]
    //
    // If in[7] = 0:
    //     The number is positive (or zero)
    //     Fill the new upper 24 bits with 0s
    //
    // Example:
    //     in  = 8'b00000101   (+5)
    //
    //     out = 32'b00000000000000000000000000000101
    //
    //
    // If in[7] = 1:
    //     The number is negative (two's complement)
    //     Fill the new upper 24 bits with 1s
    //
    // Example:
    //     in  = 8'b11111101   (-3)
    //
    //     out = 32'b11111111111111111111111111111101
    //
    //
    // ============================================================
    // Actual HDLBits Solution (Recommended)
    // ============================================================
    //
    // {24{in[7]}}
    //
    // This is called the REPLICATION OPERATOR.
    //
    // If in[7] = 0:
    //
    //     {24{1'b0}}
    //
    // becomes:
    //
    //     000000000000000000000000
    //
    //
    // If in[7] = 1:
    //
    //     {24{1'b1}}
    //
    // becomes:
    //
    //     111111111111111111111111
    //
    //
    // Then concatenate the original 8-bit input:
    //
    //     {{24{in[7]}}, in}
    //
    // Result:
    //
    //     [24 replicated sign bits][original 8-bit input]
    //
    // ============================================================

    assign out = {{24{in[7]}}, in};



    // ============================================================
    // Alternative Thinking (Your Approach)
    // ============================================================
    //
    // Conceptually you were thinking:
    //
    //     If sign bit is 1
    //         prepend twenty-four 1s
    //
    //     Else
    //         prepend twenty-four 0s
    //
    // The logic itself is CORRECT.
    //
    // However, this code cannot be written directly inside a module
    // because:
    //
    // 1. "if" statements must be inside an always_comb block.
    // 2. "assign" statements cannot appear inside an if statement.
    // 3. assign is a continuous hardware connection, not a
    //    procedural statement like C/Python.
    //
    // Legal procedural version:
    //
    // always_comb begin
    //
    //     if (in[7] == 1'b1) begin
    //
    //         out = {
    //             24'b111111111111111111111111,
    //             in[7:0]
    //         };
    //
    //     end
    //     else begin
    //
    //         out = {
    //             24'b000000000000000000000000,
    //             in[7:0]
    //         };
    //
    //     end
    //
    // end
    //
    // This produces the SAME hardware as:
    //
    //     assign out = {{24{in[7]}}, in};
    //
    // but the replication-operator solution is shorter, cleaner,
    // and is the standard RTL coding style.
    // ============================================================

endmodule