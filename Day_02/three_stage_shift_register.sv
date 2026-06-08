module top_module (
    input clk,
    input d,
    output q
);

    // ============================================================
    // METHOD 1 : NAMED PORT MAPPING
    // ============================================================
    //
    // Safer and more commonly used in industry.
    // Connections are made using port names.
    //
    // Syntax:
    // .port_name(signal_name)
    //
    // Example:
    // .clk(clk)
    // .d(d)
    // .q(a)
    //
    // Order does NOT matter because ports are matched by name.
    //
    // ------------------------------------------------------------
    //
    // wire a;
    // wire b;
    //
    // my_dff inst_1 (
    //     .clk(clk),
    //     .d(d),
    //     .q(a)
    // );
    //
    // my_dff inst_2 (
    //     .clk(clk),
    //     .d(a),
    //     .q(b)
    // );
    //
    // my_dff inst_3 (
    //     .clk(clk),
    //     .d(b),
    //     .q(q)
    // );
    //
    // ============================================================


    // Internal wires connecting the flip-flops
    wire a, b;

    // ============================================================
    // METHOD 2 : POSITIONAL PORT MAPPING
    // ============================================================
    //
    // Given module:
    //
    // module my_dff (
    //     input clk,
    //     input d,
    //     output q
    // );
    //
    // Port order:
    //
    // Position 1 -> clk
    // Position 2 -> d
    // Position 3 -> q
    //
    // Therefore:
    //
    // my_dff d1 ( clk, d, a );
    //
    // means:
    //
    // clk -> clk
    // d   -> d
    // a   -> q
    //
    // Data flow:
    //
    // d ---> d1 ---> d2 ---> d3 ---> q
    //
    // Every clock pulse shifts data one stage forward.
    //
    // ============================================================

    my_dff d1 ( clk, d, a );
    my_dff d2 ( clk, a, b );
    my_dff d3 ( clk, b, q );

    // ============================================================
    // Example:
    //
    // Initial:
    // a = 0
    // b = 0
    // q = 0
    //
    // Input d = 1
    //
    // Clock #1:
    // a = 1
    // b = 0
    // q = 0
    //
    // Clock #2:
    // a = 1
    // b = 1
    // q = 0
    //
    // Clock #3:
    // a = 1
    // b = 1
    // q = 1
    //
    // Input bit reaches output after
    // passing through three flip-flops.
    // ============================================================

endmodule