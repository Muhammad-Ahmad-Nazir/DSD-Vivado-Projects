`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 10:41:10 AM
// Design Name: 
// Module Name: Adder_8bit
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


module Adder_8bit(
input [7:0] operand1,
input [7:0] operand2,
input carry_in,
output reg [7:0] sum,
output reg carry_out
    );
    
always@(*)
begin
    {carry_out,sum} = operand1 + operand2 + carry_in;
end
endmodule
