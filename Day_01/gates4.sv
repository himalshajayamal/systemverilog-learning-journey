module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = in[3] & in[2] & in[1] & in[0];
    // 4-input AND gate (bitwise AND applied manually)
    // Output = 1 only if ALL bits are 1
    // Example: in = 4'b1111 ? out_and = 1
    // Example: in = 4'b1101 ? out_and = 0

    assign out_or = in[3] | in[2] | in[1] | in[0];
    // 4-input OR gate (bitwise OR applied manually)
    // Output = 1 if ANY bit is 1
    // Example: in = 4'b0001 ? out_or = 1
    // Example: in = 4'b0000 ? out_or = 0

    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];
    // 4-input XOR gate (parity check)
    // Output = 1 if number of 1s is odd
    // Example: in = 4'b1010 ? out_xor = 0
    // Example: in = 4'b1000 ? out_xor = 1

endmodule