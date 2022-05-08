`timescale 1ns / 1ps

module adders_tb;
    localparam N = 32;
    reg a, b, c;
    reg [N-1:0] a32;
    reg [N-1:0] b32;

    wire half_sum, half_carry, sum, carry;
    wire [N-1:0] out32;

    half_adder half_adder(.a(a), .b(b), .sum(half_sum), .carry(half_carry));

    adder adder(.a(a), .b(b), .c(c), .sum(sum), .carry(carry));

    addn #(.N(N)) add32(.a(a32), .b(b32), .out(out32));

    initial begin
        a = 0; b = 0; c = 0; #10
        if(half_sum !== 0) $display("[FAILED] HALF_ADDER(0, 0).SUM != 0 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(0, 0).CARRY != 0 (got %d)", half_carry);

        if(sum !== 0) $display("[FAILED] ADDER(0, 0, 0).SUM != 0 (got %d)", sum);
        if(carry !== 0) $display("[FAILED] ADDER(0, 0, 0).CARRY != 0 (got %d)", carry);

        a = 1; b = 0; c = 0; #10
        if(half_sum !== 1) $display("[FAILED] HALF_ADDER(1, 0).SUM != 1 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(1, 0).CARRY != 0 (got %d)", half_carry);

        if(sum !== 1) $display("[FAILED] ADDER(1, 0, 0).SUM != 1 (got %d)", sum);
        if(carry !== 0) $display("[FAILED] ADDER(1, 0, 0).CARRY != 0 (got %d)", carry);

        a = 0; b = 1; c = 0; #10
        if(half_sum !== 1) $display("[FAILED] HALF_ADDER(0, 1).SUM != 1 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(0, 1).CARRY != 0 (got %d)", half_carry);

        if(sum !== 1) $display("[FAILED] ADDER(0, 1, 0).SUM != 1 (got %d)", sum);
        if(carry !== 0) $display("[FAILED] ADDER(0, 1, 0).CARRY != 0 (got %d)", carry);

        a = 1; b = 1; c = 0; #10
        if(half_sum !== 0) $display("[FAILED] HALF_ADDER(1, 0).SUM != 0 (got %d)", half_sum);
        if(half_carry !== 1) $display("[FAILED] HALF_ADDER(1, 0).CARRY != 1 (got %d)", half_carry);

        if(sum !== 0) $display("[FAILED] ADDER(1, 0, 0).SUM != 0 (got %d)", sum);
        if(carry !== 1) $display("[FAILED] ADDER(1, 0, 0).CARRY != 1 (got %d)", carry);

        a = 0; b = 0; c = 1; #10
        if(half_sum !== 0) $display("[FAILED] HALF_ADDER(0, 0).SUM != 0 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(0, 0).CARRY != 0 (got %d)", half_carry);

        if(sum !== 1) $display("[FAILED] ADDER(0, 0, 1).SUM != 1 (got %d)", sum);
        if(carry !== 0) $display("[FAILED] ADDER(0, 0, 1).CARRY != 0 (got %d)", carry);

        a = 1; b = 0; c = 1; #10
        if(half_sum !== 1) $display("[FAILED] HALF_ADDER(1, 0).SUM != 1 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(1, 0).CARRY != 0 (got %d)", half_carry);

        if(sum !== 0) $display("[FAILED] ADDER(1, 0, 1).SUM != 0 (got %d)", sum);
        if(carry !== 1) $display("[FAILED] ADDER(1, 0, 1).CARRY != 1 (got %d)", carry);

        a = 0; b = 1; c = 1; #10
        if(half_sum !== 1) $display("[FAILED] HALF_ADDER(0, 1).SUM != 1 (got %d)", half_sum);
        if(half_carry !== 0) $display("[FAILED] HALF_ADDER(0, 1).CARRY != 0 (got %d)", half_carry);

        if(sum !== 0) $display("[FAILED] ADDER(0, 1, 1).SUM != 0 (got %d)", sum);
        if(carry !== 1) $display("[FAILED] ADDER(0, 1, 1).CARRY != 1 (got %d)", carry);

        a = 1; b = 1; c = 1; #10
        if(half_sum !== 0) $display("[FAILED] HALF_ADDER(1, 0).SUM != 1 (got %d)", half_sum);
        if(half_carry !== 1) $display("[FAILED] HALF_ADDER(1, 0).CARRY != 0 (got %d)", half_carry);

        if(sum !== 1) $display("[FAILED] ADDER(1, 1, 1).SUM != 1 (got %d)", sum);
        if(carry !== 1) $display("[FAILED] ADDER(1, 1, 1).CARRY != 1 (got %d)", carry);

        a32 = 'h55555555; b32 = 'hAAAAAAAA; #10
        if(out32 !== 'hFFFFFFFF) $display("[FAILED] ADD32(0x5555.5555, 0xAAAA.AAAA) != 0xFFFF.FFFF (got %h)", out32);
    end

endmodule