`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 05:13:53 PM
// Design Name: 
// Module Name: Array_multiplier
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

module Adder_4_bit(
input [3:0] op1,
input [3:0] op2,
input carry_in,
output reg [3:0] sum,
output reg carry_out
);

always@(*)
begin
    {carry_out,sum} = op1 + op2 + carry_in;
end

endmodule

module Array_multiplier(
input [3:0] multiplicand,
input [3:0] multiplier,
output [7:0] product
);

wire cin = 1'b0;
wire P00,P10,P20,P30,P01,P11,P21,P31,P02,P12,P22,P32,P03,P13,P23,P33;
wire R0,R1,R2,R3,R4,R5,R6,R7;
wire [3:0] adder1;
wire c_1;
wire [3:0] adder2;
wire c_2;
wire [3:0] adder3;
wire c_3;

and a1(P00,multiplicand[0],multiplier[0]);
and a2(P10,multiplicand[1],multiplier[0]);
and a3(P20,multiplicand[2],multiplier[0]);
and a4(P30,multiplicand[3],multiplier[0]);

and a5(P01,multiplicand[0],multiplier[1]);
and a6(P11,multiplicand[1],multiplier[1]);
and a7(P21,multiplicand[2],multiplier[1]);
and a8(P31,multiplicand[3],multiplier[1]);

and a9(P02,multiplicand[0],multiplier[2]);
and a10(P12,multiplicand[1],multiplier[2]);
and a11(P22,multiplicand[2],multiplier[2]);
and a12(P32,multiplicand[3],multiplier[2]);

and a13(P03,multiplicand[0],multiplier[3]);
and a14(P13,multiplicand[1],multiplier[3]);
and a15(P23,multiplicand[2],multiplier[3]);
and a16(P33,multiplicand[3],multiplier[3]);

Adder_4_bit ADD1( {1'b0,P30,P20,P10}, {P31,P21,P11,P01}, cin, adder1, c_1);
Adder_4_bit ADD2( {1'b0,adder1[3:1]}, {P32,P22,P12,P02}, c_1, adder2, c_2);
Adder_4_bit ADD3( {1'b0,adder2[3:1]}, {P33,P23,P13,P03}, c_2, adder3, c_3);

assign product = { c_3, adder3[3:0], adder2[0], adder1[0], P00};

endmodule
