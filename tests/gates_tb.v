`timescale 1ns / 1ps

module gates_tb;
    reg a;
    reg b;

    wire nand_out;
    wire not_out;
    wire and_out;
    wire or_out;
    wire xor_out;

    _nand _nand(.a(a), .b(b), .out(nand_out));
    _not _not(.in(a), .out(not_out));
    _and _and(.a(a), .b(b), .out(and_out));
    _or _or(.a(a), .b(b), .out(or_out));
    _xor _xor(.a(a), .b(b), .out(xor_out));

    initial
    begin
        $dumpfile("gates_tb.vcd");
        $dumpvars(0, gates_tb);

        a = 0; b = 0; #10
        if(nand_out !== 1) $display("[FAILED] NAND(0, 0) != 1 (got %d)", nand_out);
        if(not_out !== 1) $display("[FAILED] NOT(0) != 1 (got %d)", not_out);
        if(and_out !== 0) $display("[FAILED] AND(0, 0) != 0 (got %d)", and_out);
        if(or_out !== 0) $display("[FAILED] OR(0, 0) != 0 (got %d)", or_out);
        if(xor_out !== 0) $display("[FAILED] XOR(0, 0) != 0 (got %d)", xor_out);

        a = 1; b = 0; #10
        if(nand_out !== 1) $display("[FAILED] NAND(1, 0) != 1 (got %d)", nand_out);
        if(not_out !== 0) $display("[FAILED] NOT(1) != 0 (got %d)", not_out);
        if(and_out !== 0) $display("[FAILED] AND(1, 0) != 0 (got %d)", and_out);
        if(or_out !== 1) $display("[FAILED] OR(1, 0) != 1 (got %d)", or_out);
        if(xor_out !== 1) $display("[FAILED] XOR(1, 0) != 1 (got %d)", xor_out);

        a = 0; b = 1; #10
        if(nand_out !== 1) $display("[FAILED] NAND(0, 1) != 1 (got %d)", nand_out);
        if(and_out !== 0) $display("[FAILED] AND(0, 1) != 0 (got %d)", and_out);
        if(or_out !== 1) $display("[FAILED] OR(0, 1) != 1 (got %d)", or_out);
        if(xor_out !== 1) $display("[FAILED] XOR(0, 1) != 1 (got %d)", xor_out);

        a = 1; b = 1; #10
        if(nand_out !== 0) $display("[FAILED] NAND(1, 1) != 0 (got %d)", nand_out);
        if(and_out !== 1) $display("[FAILED] AND(1, 1) != 1 (got %d)", and_out);
        if(or_out !== 1) $display("[FAILED] OR(1, 1) != 1 (got %d)", or_out);
        if(xor_out !== 0) $display("[FAILED] XOR(1, 1) != 0 (got %d)", xor_out);
    end

endmodule