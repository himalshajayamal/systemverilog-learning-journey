module top_module( 
    input [31:0] in,
    output [31:0] out );

    assign out[31:24] = in[7:0];
    // Highest byte of output gets lowest byte of input
    // Example: in = AaaaaaaaBbbbbbbbCcccccccDddddddd
    // in[7:0] = Dddddddd ? goes to out[31:24]

    assign out[23:16] = in[15:8];
    // Second highest byte swaps with second lowest byte
    // in[15:8] = Cccccccc ? goes to out[23:16]

    assign out[15:8] = in[23:16];
    // Third byte swaps with second highest byte
    // in[23:16] = Bbbbbbbb ? goes to out[15:8]

    assign out[7:0] = in[31:24];
    // Lowest byte of output gets highest byte of input
    // in[31:24] = Aaaaaaaa ? goes to out[7:0]

endmodule