//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Aug 14 13:15:35 2025
//Host        : DESKTOP-IM3L5OE running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (pl_clk0_0);
  output pl_clk0_0;

  wire pl_clk0_0;

  design_1 design_1_i
       (.pl_clk0_0(pl_clk0_0));
endmodule
