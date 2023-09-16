`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:32:35 AM
// Design Name: 
// Module Name: Decoder_2x4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder_2x4(in1,in2,out);
input in1;
input in2;
output [3:0] out;

wire in1_bar;
wire in2_bar;

not n1(in1_bar,in1);
not n2(in2_bar,in2);

and a1(out[0], in1_bar, in2_bar);
and a2(out[1], in1_bar, in2);
and a3(out[2], in1, in2_bar);
and a4(out[3], in1, in2);


endmodule
