module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // ============================================================
    // MODULE INSTANTIATION (NAMED PORT MAPPING)
    // ============================================================
    //
    // mod_a               = module type (blueprint)
    // instantiate_1       = instance name (actual hardware copy)
    //
    // Named mapping syntax:
    //
    // .module_port(top_level_signal)
    //
    // .in1(a)
    // means:
    // Connect top_module signal "a"
    // to mod_a port "in1"
    //
    // ============================================================
    // PORT CONNECTIONS
    // ============================================================
    //
    // mod_a port      ←→      top_module signal
    //
    // in1             ←→      a
    // in2             ←→      b
    // in3             ←→      c
    // in4             ←→      d
    // out1            ←→      out1
    // out2            ←→      out2
    //
    // ============================================================
    // DIFFERENCE FROM POSITIONAL MAPPING
    // ============================================================
    //
    // POSITIONAL:
    //
    // mod_a inst1 (out1, out2, a, b, c, d);
    //
    // Connections depend entirely on ORDER.
    //
    // ------------------------------------------------------------
    //
    // NAMED:
    //
    // mod_a inst1 (
    //     .in1(a),
    //     .in2(b),
    //     .in3(c),
    //     .in4(d),
    //     .out1(out1),
    //     .out2(out2)
    // );
    //
    // Connections depend on PORT NAMES.
    // Order does NOT matter.
    //
    // For example, this is also valid:
    //
    // mod_a inst1 (
    //     .out2(out2),
    //     .in3(c),
    //     .in1(a),
    //     .out1(out1),
    //     .in4(d),
    //     .in2(b)
    // );
    //
    // Because the compiler matches names, not positions.
    //
    // ============================================================

    mod_a instantiate_1 (
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d),
        .out1(out1),
        .out2(out2)
    );

endmodule