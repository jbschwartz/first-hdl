// Of course these gates are silly to design in Verilog (as builtins exist).
// This is a learning exercise (following Nand2Tetris).

module _nand(
    input a,
    input b,
    output out
    );

    // Define using builtin Verilog code since we will use this as the fundamental building block.
    assign out = ~(a & b);

endmodule

module _not(
    input in,
    output out
    );

    _nand _nand(.a(in), .b(in), .out(out));

endmodule

module _and(
    input a,
    input b,
    output out
    );

    wire w;

    _nand _nand(.a(a), .b(b), .out(w));
    _not _not(.in(w), .out(out));

endmodule

module _or(
    input a,
    input b,
    output out
    );

    wire n_a, n_b;

    _nand _nand_a(.a(a), .b(a), .out(n_a));
    _nand _nand_b(.a(b), .b(b), .out(n_b));
    _nand _nand_out(.a(n_a), .b(n_b), .out(out));

endmodule

module _xor(
    input a,
    input b,
    output out
    );

    wire a_or_b, not_a_and_not_b;

    _or _or(.a(a), .b(b), .out(a_or_b));
    _nand _nand(.a(a), .b(b), .out(not_a_and_not_b));
    _and _and(.a(a_or_b), .b(not_a_and_not_b), .out(out));

endmodule
