`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:07:39 AM
// Design Name: 
// Module Name: Decoder_3x8
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


module Decoder_3x8(in1,in2,in3,out);
input in1;
input in2;
input in3;
output [7:0] out;

wire in1_bar;
wire in2_bar;
wire in3_bar;

assign in1_bar = ~in1;
assign in2_bar = ~in2;
assign in3_bar = ~in3;

assign out[0] = in1_bar & in2_bar & in3_bar;
assign out[1] = in1_bar & in2_bar & in3;
assign out[2] = in1_bar & in2 & in3_bar;
assign out[3] = in1_bar & in2 & in3;
assign out[4] = in1 & in2_bar & in3_bar;
assign out[5] = in1 & in2_bar & in3;
assign out[6] = in1 & in2 & in3_bar;
assign out[7] = in1 & in2 & in3;

endmodule
