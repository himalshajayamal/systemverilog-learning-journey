module top_module (
    input a, b, c, d, e,
    output [24:0] out
);

    // ============================================================
    // Goal:
    // Compute all pairwise equality comparisons between 5 inputs:
    // a, b, c, d, e
    //
    // If two bits are equal → output bit = 1
    // If different         → output bit = 0
    //
    // This is implemented using XNOR logic:
    //     ~(x ^ y)  => 1 when x == y
    // ============================================================


    // ============================================================
    // METHOD 1 (STRUCTURED / EXPLICIT APPROACH)
    // ============================================================

    wire [24:0] top, bottom;

    // TOP vector:
    // Each input bit is replicated 5 times
    //
    // Example:
    // a = 1 → 11111
    // b = 0 → 00000
    //
    // So we build:
    // top = {aaaaa, bbbbb, ccccc, ddddd, eeeee}
    assign top = { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };

    // BOTTOM vector:
    // Entire input vector is repeated 5 times
    //
    // mid = {a,b,c,d,e}
    // bottom = {mid, mid, mid, mid, mid}
    assign bottom = {5{a,b,c,d,e}};

    // Compare bit-by-bit using XNOR:
    // 1 if equal, 0 if different
    assign out = ~top ^ bottom;



    // ============================================================
    // METHOD 2 (YOUR APPROACH – BLOCKED VERSION IDEA)
    // ============================================================
    //
    // Your idea:
    //
    // 1. Group inputs:
    //    wire [4:0] mid;
    //    assign mid = {a, b, c, d, e};
    //
    // 2. Compare each repeated group:
    //
    //    assign out[24:20] = ~({5{a}} ^ mid);
    //    assign out[19:15] = ~({5{b}} ^ mid);
    //    assign out[14:10] = ~({5{c}} ^ mid);
    //    assign out[9:5]   = ~({5{d}} ^ mid);
    //    assign out[4:0]   = ~({5{e}} ^ mid);
    // This is conceptually correct:
    //
    // Each block computes:
    //
    //    XNOR(repeated_bit, full_vector)
    //
    // Meaning:
    //    "Is a equal to a,b,c,d,e?"
    //
    // Repeated for each input bit.
    //
    // Why it works:
    // - {5{a}} creates: aaaaa
    // - mid = abcde
    // - XNOR compares bitwise
    //
    // This expands into the same hardware as METHOD 1,
    // but is less compact and more repetitive.
    //
    // ============================================================

    // ============================================================
    // METHOD 3 (ONE-LINE RTL STYLE)
    // ============================================================
    // assign out = ~({ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ {5{a,b,c,d,e}});

endmodule