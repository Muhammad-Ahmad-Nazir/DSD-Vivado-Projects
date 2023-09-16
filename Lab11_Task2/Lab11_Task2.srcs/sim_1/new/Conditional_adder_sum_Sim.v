`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 04:24:30 PM
// Design Name: 
// Module Name: Conditional_adder_sum_Sim
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


module Conditional_adder_sum_Sim();
reg clk;
reg rs;
reg [31:0] in1;
reg [31:0] in2;
wire [31:0] out;

Conditional_sum_adder CSA1(clk, rs, in1, in2, out);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    rs = 1;
    #20
    rs = 0;
end

initial
begin
    #10
    in1 = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
    in2 = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
end
endmodule
