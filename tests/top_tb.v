`timescale 1ns / 1ps

module top_tb();
    adders_tb adders_tb();
    gates_multi_tb gates_multi_tb();
    gates_tb gates_tb();
    register_tb register_tb();

    initial begin
        $dumpfile("testbenches.vcd");
        $dumpvars(2, top_tb);

        #100 $finish;
    end

endmodule