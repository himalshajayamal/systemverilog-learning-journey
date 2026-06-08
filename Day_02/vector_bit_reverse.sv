module top_module( 
    input [7:0] in,
    output [7:0] out
);

    // Reverse the bit order of the 8-bit input vector.
    //
    // Input bit positions:
    // in[7] in[6] in[5] in[4] in[3] in[2] in[1] in[0]
    //
    // Output bit positions:
    // out[7] out[6] out[5] out[4] out[3] out[2] out[1] out[0]
    //
    // Connections:
    // out[7] = in[0]
    // out[6] = in[1]
    // out[5] = in[2]
    // out[4] = in[3]
    // out[3] = in[4]
    // out[2] = in[5]
    // out[1] = in[6]
    // out[0] = in[7]
    //
    // Example:
    // in  = 8'b11010010
    // out = 8'b01001011

    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};

endmodule