module dff(
    input wire clk,
    input wire d,
    output reg q
    );

    always @ (posedge clk) begin
        q <= d;
    end

endmodule

module bit(
    input wire clk,
    input wire load,
    input wire in,
    output wire out
    );

    wire mux_out;

    mux mux(.a(out), .b(in), .sel(load), .out(mux_out));
    dff dff(.clk(clk), .d(mux_out), .q(out));

endmodule

module register #(
    parameter N = 32
    ) (
    input wire clk,
    input wire load,
    input wire [N-1:0] in,
    output wire [N-1:0] out
    );

    genvar i;

    for(i = 0; i < N; i = i + 1) bit bit(.clk(clk), .load(load), .in(in[i]), .out(out[i]));

endmodule
