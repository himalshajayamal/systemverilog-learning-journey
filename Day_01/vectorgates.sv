module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    assign out_or_bitwise = a | b;  
    // Bitwise OR operation (bit-by-bit)
    // Each bit of 'a' is ORed with corresponding bit of 'b'
    //
    // Example:
    // a = 3'b101
    // b = 3'b011
    // ----------------
    //   101
    // | 011
    // = 111
    //
    // So out_or_bitwise = 3'b111

    assign out_or_logical = a || b;  
    // Logical OR operation (whole-vector evaluation)
    // Treats each vector as a single boolean value:
    // - 0 if vector is 000
    // - 1 if vector is anything non-zero
    //
    // Example 1:
    // a = 3'b000, b = 3'b000 ? out_or_logical = 0
    //
    // Example 2:
    // a = 3'b000, b = 3'b101 ? out_or_logical = 1
    //
    // Example 3:
    // a = 3'b110, b = 3'b000 ? out_or_logical = 1

    assign out_not[5:3] = ~b;  
    // Bitwise NOT of 'b', stored in upper 3 bits of out_not
    // Each bit of b is inverted individually
    //
    // Example:
    // b = 3'b101
    // ~b = 3'b010
    // out_not[5:3] = 010

    assign out_not[2:0] = ~a;  
    // Bitwise NOT of 'a', stored in lower 3 bits of out_not
    //
    // Example:
    // a = 3'b110
    // ~a = 3'b001
    // out_not[2:0] = 001

endmodule