module half_adder(
    input a,
    input b,
    output carry,
    output sum
    );

    _xor _xor(.a(a), .b(b), .out(sum));
    _and _and(.a(a), .b(b), .out(carry));

endmodule

module adder(
    input a,
    input b,
    input c,
    output carry,
    output sum
    );

    wire first_sum, first_carry, second_carry;

    half_adder half_adder_ab(.a(a), .b(b), .sum(first_sum), .carry(first_carry));
    half_adder half_adder_c(.a(c), .b(first_sum), .sum(sum), .carry(second_carry));

    _or _or(.a(first_carry), .b(second_carry), .out(carry));

endmodule

module add32(
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] out
    );

    wire carry[31:0];

    genvar i;

    half_adder half_adder(.a(a[0]), .b(b[0]), .sum(out[0]), .carry(carry[0]));

    for(i = 1; i <= 31; i = i + 1) begin
        adder adder(.a(a[i]), .b(b[i]), .c(carry[i - 1]), .sum(out[i]), .carry(carry[i]));
    end

endmodule
