module notn #(
    parameter N = 32
    ) (
    input wire [N-1:0] in,
    output wire [N-1:0] out
    );

    genvar i;

    for(i = 0; i <= N - 1; i = i + 1) _not _not(.in(in[i]), .out(out[i]));

endmodule

module andn #(
    parameter N = 32
    ) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [N-1:0] out
    );

    genvar i;

    for(i = 0; i <= N - 1; i = i + 1) _and _and(.a(a[i]), .b(b[i]), .out(out[i]));

endmodule

module orn #(
    parameter N = 32
    ) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [N-1:0] out
    );

    genvar i;

    for(i = 0; i <= N - 1; i = i + 1) _or _or(.a(a[i]), .b(b[i]), .out(out[i]));

endmodule

module muxn #(
    parameter N = 32
    ) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire sel,
    output wire [N-1:0] out
    );

    genvar i;

    for(i = 0; i <= N - 1; i = i + 1) mux mux(.a(a[i]), .b(b[i]), .sel(sel), .out(out[i]));

endmodule