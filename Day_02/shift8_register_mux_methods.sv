module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);

    // ============================================================
    // SHIFT REGISTER STAGES
    // ============================================================
    // d -> a -> b -> c (each stage = 1 clock delay)
    // ============================================================

    logic [7:0] a, b, c;

    // Stage 1
    my_dff8 inst_1 (
        .clk(clk),
        .d(d),
        .q(a)
    );

    // Stage 2
    my_dff8 inst_2 (
        .clk(clk),
        .d(a),
        .q(b)
    );

    // Stage 3
    my_dff8 inst_3 (
        .clk(clk),
        .d(b),
        .q(c)
    );

    // ============================================================
    // 4:1 MULTIPLEXER (select delay)
    // ============================================================
    // sel:
    // 00 → original input
    // 01 → 1-cycle delay
    // 10 → 2-cycle delay
    // 11 → 3-cycle delay
    // ============================================================

    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = a;
            2'b10: q = b;
            2'b11: q = c;
        endcase
    end

endmodule