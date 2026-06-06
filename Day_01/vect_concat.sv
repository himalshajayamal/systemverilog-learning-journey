module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );

    wire [31:0] out;  
    // 32-bit intermediate wire used to hold the full concatenated result
    // This acts like a "single bus" that combines all inputs in order

    assign out = {a, b, c, d, e, f, 2'b11};
    // Concatenation operator:
    // Joins all 5-bit inputs in sequence into one 32-bit vector
    //
    // Breakdown:
    // a = bits [31:27]
    // b = bits [26:22]
    // c = bits [21:17]
    // d = bits [16:12]
    // e = bits [11:7]
    // f = bits [6:2]
    // 2'b11 = bits [1:0]
    //
    // Example idea:
    // out = aaaaa bbbbb ccccc ddddd eeeee fffff 11

    assign w = out[31:24];
    // Highest byte of the 32-bit vector
    // Takes the most significant 8 bits of the concatenation

    assign x = out[23:16];
    // Next 8-bit segment

    assign y = out[15:8];
    // Middle 8-bit segment

    assign z = out[7:0];
    // Lowest 8-bit segment (includes part of f + final bits)

endmodule