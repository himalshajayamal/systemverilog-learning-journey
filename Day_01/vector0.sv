module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration

assign outv = vec;      
// Pass-through assignment: copies the entire 3-bit input vector as-is
// Example: vec = 3'b101 ? outv = 3'b101
// Example: vec = 3'b000 ? outv = 3'b000

assign o0 = vec[0];     
// Bit 0 (LSB - Least Significant Bit)
// This is the rightmost bit of the vector
// Example: vec = 3'b101 ? vec[0] = 1 ? o0 = 1
// Example: vec = 3'b100 ? vec[0] = 0 ? o0 = 0

assign o1 = vec[1];     
// Bit 1 (middle bit in a 3-bit vector)
// Example: vec = 3'b101 ? vec[1] = 0 ? o1 = 0
// Example: vec = 3'b011 ? vec[1] = 1 ? o1 = 1

assign o2 = vec[2];     
// Bit 2 (MSB - Most Significant Bit)
// This is the leftmost bit of the vector
// Example: vec = 3'b101 ? vec[2] = 1 ? o2 = 1
// Example: vec = 3'b001 ? vec[2] = 0 ? o2 = 0
    
endmodule