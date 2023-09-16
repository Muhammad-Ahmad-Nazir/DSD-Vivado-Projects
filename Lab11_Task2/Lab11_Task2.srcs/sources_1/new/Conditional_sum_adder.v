`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 03:42:15 PM
// Design Name: 
// Module Name: Conditional_sum_adder
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


module Conditional_sum_adder(
input clk,
input reset,
input [31:0] operand1,
input [31:0] operand2,
//input carry_in,
output reg [31:0] sum
    );
    
reg [1:0]  mux_selector = 0;
wire [7:0] op1_sel;
wire [7:0] op2_sel;
wire carry_from_adder;
wire carry_to_adder = 0;
wire [7:0] adder_result;
wire [31:0] temp_storage;

always@(posedge clk)
begin
    if (reset == 1)
    begin
        mux_selector = 0;
    end
    
    else if (mux_selector > 3)
    begin
        mux_selector = 0;
    end
    
    else
    begin
        mux_selector = mux_selector + 1;
    end
end

MUX_4x1 M1(mux_selector, operand1[7:0], operand1[15:8], operand1[23:16], operand1[31:24], op1_sel);
MUX_4x1 M2(mux_selector, operand2[7:0], operand2[15:8], operand2[23:16], operand2[31:24], op2_sel);

Conditional_adder_module CAM1(op1_sel, op2_sel, carry_to_adder, adder_result, carry_from_adder);

D_flipflop DFF1(clk, reset, carry_from_adder, carry_to_adder);

DMUX_1x4 DMUX1(mux_selector, adder_result, temp_storage[7:0], temp_storage[15:8], temp_storage[23:16], temp_storage[31:24]);

always@(posedge clk)
begin
    sum <= temp_storage;
end
endmodule
