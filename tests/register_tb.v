`timescale 1ns / 1ps

module register_tb;
    localparam N = 32;

    reg clk;
    reg d;
    reg in;
    reg load;
    reg [N-1:0] reg_in;
    reg reg_load;

    wire out;
    wire [N-1:0] reg_out;

    dff dff(.clk(clk), .d(d), .q(q));
    bit bit(.clk(clk), .in(in), .load(load), .out(out));
    register register(.clk(clk), .in(reg_in), .load(reg_load), .out(reg_out));

    initial begin
        clk = 1;
        forever #1 clk = ~clk;
    end

    // DFF
    initial begin
        d = 0;
        #2
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);

        #1 d = 1;
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);

        #2
        if(q !== 1) $display("[FAILED] DFF != 1 (got %d)", q);

        #2.5 d = 0; #1
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);
    end

    // Bit
    initial begin
        in = 0; load = 1;
        #2.5 load = 0;
        if(out !== 0) $display("[FAILED] BIT != 0 (got %d)", q);
        #2.5 in = 1; #2.5
        if(out !== 0) $display("[FAILED] BIT != 0 (got %d)", q);
        #2.5 load = 1; #2.5
        if(out !== 1) $display("[FAILED] BIT != 1 (got %d)", q);
    end

    // Register
    initial begin
        reg_in = 32'b0; reg_load = 1;
        #2.5 reg_load = 0;
        if(reg_out !== 32'b0) $display("[FAILED] REGISTER != 0 (got %h)", reg_out);
        #2.5 reg_in = 32'hFFFFAAAA;
        reg_load = 1; #2; reg_load = 0; #5
        if(reg_out !== 32'hFFFFAAAA) $display("[FAILED] REGISTER != FFFFAAAA (got %h)", out);
        #5 reg_in = 32'b0; #5
        if(reg_out !== 32'hFFFFAAAA) $display("[FAILED] REGISTER != FFFFAAAA (got %h)", out);
    end

endmodule