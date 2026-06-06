`default_nettype none     // Prevents accidental implicit wire creation (good practice)

module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    assign out_hi = in[15:8];  
    // Upper byte (MSB half of the 16-bit input)
    // Example: in = 16'b10101010_11110000 ? out_hi = 10101010

    assign out_lo = in[7:0];   
    // Lower byte (LSB half of the 16-bit input)
    // Example: in = 16'b10101010_11110000 ? out_lo = 11110000

endmodule