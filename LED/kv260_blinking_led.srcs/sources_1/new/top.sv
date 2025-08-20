`timescale 1ns / 1ps

module top(
        output  var logic   [0:0]   led
    );

    logic   clk;
    design_1 i_design1(.pl_clk0_0(clk));

    logic   [25:0]  counter = 0;
    always_ff @(posedge clk) begin
        counter <= counter + 1;
    end

    assign led = counter[25];

endmodule