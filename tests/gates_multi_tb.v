`timescale 1ns / 1ps

module gates_multi_tb;
    localparam N = 32;

    reg [N-1:0] a;
    reg [N-1:0] b;
    reg sel;

    wire [N-1:0] not_out;
    wire [N-1:0] and_out;
    wire [N-1:0] or_out;
    wire [N-1:0] mux_out;

    notn #(.N(N)) notn(.in(a), .out(not_out));
    andn #(.N(N)) andn(.a(a), .b(b), .out(and_out));
    orn #(.N(N)) orn(.a(a), .b(b), .out(or_out));
    muxn #(.N(N)) muxn(.a(a), .b(b), .sel(sel), .out(mux_out));

    initial begin
        a = 'hAAAAAAAA; b = 'hAAAA5555; #10
        if(not_out !== 'h55555555)
            $display("[FAILED] NOT%d('hAAAAAAAA) != 'h55555555 (got %h)", N, not_out);
        if(and_out !== 'hAAAA0000)
            $display("[FAILED] AND%d('hAAAAAAAA, 'hAAAA5555) != 'hAAAA0000 (got %h)", N, and_out);
        if(or_out !== 'hAAAAFFFF)
            $display("[FAILED] AND%d('hAAAAAAAA, 'hAAAA5555) != 'hAAAAFFFF (got %h)", N, or_out);

        sel = 0; #10
        if(mux_out !== 'hAAAAAAAA)
            $display("[FAILED] MUX%d('hAAAAAAAA, 'hAAAA5555, 0) != 'hAAAAAAAA (got %h)", N, mux_out);
        sel = 1; #10
        if(mux_out !== 'hAAAA5555)
            $display("[FAILED] MUX%d('hAAAAAAAA, 'hAAAA5555, 1) != 'hAAAA5555 (got %h)", N, mux_out);
    end

endmodule