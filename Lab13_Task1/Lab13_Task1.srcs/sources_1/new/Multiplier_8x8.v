`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 10:38:23 AM
// Design Name: 
// Module Name: Multiplier_8x8
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


module Multiplier_8x8 (
input [7:0] multiplicand,
input [7:0] multiplier,
output [15:0] product
    );

wire carry = 1'b0;
wire P00,P10,P20,P30,P40,P50,P60,P70,P01,P11,P21,P31,P41,P51,P61,P71,P02,P12,P22,P32,P42,P52,P62,P72;
wire P03,P13,P23,P33,P43,P53,P63,P73,P04,P14,P24,P34,P44,P54,P64,P74,P05,P15,P25,P35,P45,P55,P65,P75;
wire P06,P16,P26,P36,P46,P56,P66,P76,P07,P17,P27,P37,P47,P57,P67,P77;

wire [7:0] sum_adder1;
wire carry_adder1;
wire [7:0] sum_adder2;
wire carry_adder2;
wire [7:0] sum_adder3;
wire carry_adder3;
wire [7:0] sum_adder4;
wire carry_adder4;
wire [7:0] sum_adder5;
wire carry_adder5;
wire [7:0] sum_adder6;
wire carry_adder6;
wire [7:0] sum_adder7;
wire carry_adder7;

//Layer1 of AND
and aL11(P00,multiplicand[0],multiplier[0]);
and aL12(P10,multiplicand[1],multiplier[0]);
and aL13(P20,multiplicand[2],multiplier[0]);
and aL14(P30,multiplicand[3],multiplier[0]);
and aL15(P40,multiplicand[4],multiplier[0]);
and aL16(P50,multiplicand[5],multiplier[0]);
and aL17(P60,multiplicand[6],multiplier[0]);
and aL18(P70,multiplicand[7],multiplier[0]);

//Layer2 of AND
and aL21(P01,multiplicand[0],multiplier[1]);
and aL22(P11,multiplicand[1],multiplier[1]);
and aL23(P21,multiplicand[2],multiplier[1]);
and aL24(P31,multiplicand[3],multiplier[1]);
and aL25(P41,multiplicand[4],multiplier[1]);
and aL26(P51,multiplicand[5],multiplier[1]);
and aL27(P61,multiplicand[6],multiplier[1]);
and aL28(P71,multiplicand[7],multiplier[1]);

//Layer3 of AND
and aL31(P02,multiplicand[0],multiplier[2]);
and aL32(P12,multiplicand[1],multiplier[2]);
and aL33(P22,multiplicand[2],multiplier[2]);
and aL34(P32,multiplicand[3],multiplier[2]);
and aL35(P42,multiplicand[4],multiplier[2]);
and aL36(P52,multiplicand[5],multiplier[2]);
and aL37(P62,multiplicand[6],multiplier[2]);
and aL38(P72,multiplicand[7],multiplier[2]);

//Layer4 of AND
and aL41(P03,multiplicand[0],multiplier[3]);
and aL42(P13,multiplicand[1],multiplier[3]);
and aL43(P23,multiplicand[2],multiplier[3]);
and aL44(P33,multiplicand[3],multiplier[3]);
and aL45(P43,multiplicand[4],multiplier[3]);
and aL46(P53,multiplicand[5],multiplier[3]);
and aL47(P63,multiplicand[6],multiplier[3]);
and aL48(P73,multiplicand[7],multiplier[3]);

//Layer5 of AND
and aL51(P04,multiplicand[0],multiplier[4]);
and aL52(P14,multiplicand[1],multiplier[4]);
and aL53(P24,multiplicand[2],multiplier[4]);
and aL54(P34,multiplicand[3],multiplier[4]);
and aL55(P44,multiplicand[4],multiplier[4]);
and aL56(P54,multiplicand[5],multiplier[4]);
and aL57(P64,multiplicand[6],multiplier[4]);
and aL58(P74,multiplicand[7],multiplier[4]);

//Layer6 of AND
and aL61(P05,multiplicand[0],multiplier[5]);
and aL62(P15,multiplicand[1],multiplier[5]);
and aL63(P25,multiplicand[2],multiplier[5]);
and aL64(P35,multiplicand[3],multiplier[5]);
and aL65(P45,multiplicand[4],multiplier[5]);
and aL66(P55,multiplicand[5],multiplier[5]);
and aL67(P65,multiplicand[6],multiplier[5]);
and aL68(P75,multiplicand[7],multiplier[5]);

//Layer7 of AND
and aL71(P06,multiplicand[0],multiplier[6]);
and aL72(P16,multiplicand[1],multiplier[6]);
and aL73(P26,multiplicand[2],multiplier[6]);
and aL74(P36,multiplicand[3],multiplier[6]);
and aL75(P46,multiplicand[4],multiplier[6]);
and aL76(P56,multiplicand[5],multiplier[6]);
and aL77(P66,multiplicand[6],multiplier[6]);
and aL78(P76,multiplicand[7],multiplier[6]);

//Layer8 of AND
and aL81(P07,multiplicand[0],multiplier[7]);
and aL82(P17,multiplicand[1],multiplier[7]);
and aL83(P27,multiplicand[2],multiplier[7]);
and aL84(P37,multiplicand[3],multiplier[7]);
and aL85(P47,multiplicand[4],multiplier[7]);
and aL86(P57,multiplicand[5],multiplier[7]);
and aL87(P67,multiplicand[6],multiplier[7]);
and aL88(P77,multiplicand[7],multiplier[7]);

Adder_8bit ADD1( {1'B0,P70,P60,P50,P40,P30,P20,P10}, {P71,P61,P51,P41,P31,P21,P11,P01}, carry, sum_adder1, carry_adder1);
Adder_8bit ADD2( {carry_adder1,sum_adder1[7:1]}, {P72,P62,P52,P42,P32,P22,P12,P02}, carry, sum_adder2, carry_adder2);
Adder_8bit ADD3( {carry_adder2,sum_adder2[7:1]}, {P73,P63,P53,P43,P33,P23,P13,P03}, carry, sum_adder3, carry_adder3);
Adder_8bit ADD4( {carry_adder3,sum_adder3[7:1]}, {P74,P64,P54,P44,P34,P24,P14,P04}, carry, sum_adder4, carry_adder4);
Adder_8bit ADD5( {carry_adder4,sum_adder4[7:1]}, {P75,P65,P55,P45,P35,P25,P15,P05}, carry, sum_adder5, carry_adder5);
Adder_8bit ADD6( {carry_adder5,sum_adder5[7:1]}, {P76,P66,P56,P46,P36,P26,P16,P06}, carry, sum_adder6, carry_adder6);
Adder_8bit ADD7( {carry_adder6,sum_adder6[7:1]}, {P77,P67,P57,P47,P37,P27,P17,P07}, carry, sum_adder7, carry_adder7);

assign product = {carry_adder7, sum_adder7[7:0], sum_adder6[0], sum_adder5[0], sum_adder4[0], sum_adder3[0], sum_adder2[0], sum_adder1[0], P00};

endmodule
