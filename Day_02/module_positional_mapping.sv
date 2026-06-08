module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    // ============================================================
    // MODULE INSTANTIATION (POSITIONAL MAPPING)
    // ============================================================
    //
    // We are creating ONE instance of module "mod_a"
    //
    // IMPORTANT IDEA:
    // mod_a is a BLUEPRINT (module definition)
    // inst1 is the ACTUAL hardware instance
    //
    // ============================================================
    // PORT ORDER (given by problem):
    //
    // mod_a ( output, output, input, input, input, input )
    //
    // That means:
    //
    // position 1 → out1
    // position 2 → out2
    // position 3 → a
    // position 4 → b
    // position 5 → c
    // position 6 → d
    //
    // ============================================================
    // POSITIONAL CONNECTION RULE:
    //
    // Signals are connected STRICTLY by order.
    // Names do NOT matter here.
    //
    // out1 → 1st port
    // out2 → 2nd port
    // a    → 3rd port
    // b    → 4th port
    // c    → 5th port
    // d    → 6th port
    //
    // If you swap order → hardware becomes wrong.
    // ============================================================

    mod_a inst1 (out1, out2, a, b, c, d);

endmodule