`timescale 1ns / 1ps

module register_tb;
    reg clk;
    reg d;

    dff dff(.clk(clk), .d(d), .q(q));

    initial begin
        clk = 1; d = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        #2
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);

        #1 d = 1;
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);

        #2
        if(q !== 1) $display("[FAILED] DFF != 1 (got %d)", q);

        #2.5 d = 0; #1
        if(q !== 0) $display("[FAILED] DFF != 0 (got %d)", q);
    end

endmodule