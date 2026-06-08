module top_module (
    input a,
    input b,
    output out
);

    // ============================================================
    // METHOD 1: PORT CONNECTION BY NAME (RECOMMENDED)
    // ============================================================
    //
    // mod_a = module type (blueprint)
    // inst1 = instance name (actual copy of the module)
    //
    // Connect top_module signals to mod_a ports:
    //
    // Top-level wire a   --> mod_a port in1
    // Top-level wire b   --> mod_a port in2
    // Top-level wire out --> mod_a port out
    //
    // Syntax:
    // .module_port(signal_name)
    //
    mod_a inst1 (
        .in1(a),
        .in2(b),
        .out(out)
    );



    // ============================================================
    // METHOD 2: PORT CONNECTION BY POSITION
    // ============================================================
    //
    // Port order must exactly match module declaration:
    //
    // module mod_a (
    //     input in1,
    //     input in2,
    //     output out
    // );
    //
    // Therefore:
    //
    // a   --> in1
    // b   --> in2
    // out --> out
    //
    // Less preferred because if the module port order changes,
    // this connection may become incorrect.
    //
    // mod_a inst2 (a, b, out);
    //
    // Equivalent to:
    // mod_a inst2 (
    //     .in1(a),
    //     .in2(b),
    //     .out(out)
    // );
    //

endmodule