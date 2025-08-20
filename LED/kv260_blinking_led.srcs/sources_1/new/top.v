//`timescale 1ns / 1ps

//module top(
//        output  wire  [0:0]   led
//    );

//    wire   clk;
//    design_1 i_design1(.pl_clk0_0(clk));

//    reg   [25:0]  counter = 0;
//    always @(posedge clk) begin
//        counter <= counter + 1;
//    end

//    assign led = counter[25];

//endmodule

`timescale 1ns / 1ps

module top(
        output  wire  [3:0]   led
    );

    wire   clk;
    design_1 i_design1(.pl_clk0_0(clk));

    reg   [25:0]  counter = 0;
    reg   [3:0]   led_pattern = 4'b0001;
    
    always @(posedge clk) begin
        counter <= counter + 1;
        
        if (counter == 0)
            led_pattern <= {led_pattern[2:0], led_pattern[3]};
    end

    assign led = led_pattern;

endmodule