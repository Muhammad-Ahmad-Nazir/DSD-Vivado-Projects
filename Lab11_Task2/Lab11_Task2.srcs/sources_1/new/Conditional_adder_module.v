`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 04:00:44 PM
// Design Name: 
// Module Name: Conditional_adder_module
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


module Conditional_adder_module(
input [7:0] input1,
input [7:0] input2,
input carry_in,
output reg [7:0] result,
output reg carry_out
    );
    
reg [7:0] case_0_sum;
reg case_0_carry;
reg [7:0] case_1_sum;
reg case_1_carry;

always@(*)
begin
    {case_0_carry,case_0_sum} = input1 + input2;
    {case_1_carry,case_1_sum} = input1 + input2 + carry_in;
    
    case(carry_in)
    
    1'b0:
    begin
        result = case_0_sum;
        carry_out = case_0_carry;
    end
    
    1'b1:
    begin
        result = case_1_sum;
        carry_out = case_1_carry;
    end
    
    endcase
    
end
endmodule
