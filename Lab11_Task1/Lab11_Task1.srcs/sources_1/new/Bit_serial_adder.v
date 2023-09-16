`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 02:37:16 PM
// Design Name: 
// Module Name: Bit_serial_adder
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


module Bit_serial_adder(
input clk, 
input reset, 
input op1_enable, 
input op2_enable, 
input [7:0] operand1, 
input [7:0] operand2, 
output reg [7:0] sum,

output reg x1,
output reg x2,
output reg x3,
output reg x4,
output reg x5

);

wire op1_serial;
wire op2_serial;
wire carry_to_adder = 0;
wire carry_from_adder = 0;
wire sum_out;
wire [7:0] temp_sum;

Parallel_in_Serial_out PISO1(clk, reset, op1_enable, operand1, op1_serial);
Parallel_in_Serial_out PISO2(clk, reset, op2_enable, operand2, op2_serial);

Full_adder FA1(op1_serial, op2_serial, carry_to_adder, sum_out, carry_from_adder);

D_flipflop DFF1(clk, reset, carry_from_adder, carry_to_adder);

Serial_in_Parallel_out SIPO1(clk, reset, sum_out, temp_sum);

always@(posedge clk)
begin
    
    x1 = op1_serial;
    x2 = op2_serial;
    x3 = carry_to_adder;
    x4 = carry_from_adder;
    x5 = sum_out;
    
    sum <= temp_sum;
end

//assign sum = temp_sum;

endmodule
