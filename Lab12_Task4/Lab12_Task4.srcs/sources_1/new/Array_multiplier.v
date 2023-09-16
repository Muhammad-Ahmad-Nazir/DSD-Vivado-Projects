`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 03:17:57 PM
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

module Full_adder(
input bit1,
input bit2,
input carry_in,
output reg sum,
output reg carry_out);

always@(*)
begin
    assign {carry_out,sum} = bit1 + bit2 + carry_in;
end

endmodule


module Array_multiplier(
input [3:0] multiplicand,
input [3:0] multiplier,
output reg [7:0] product
    );

wire carry_in = 1'b0;
wire P00,P10,P20,P30,P01,P11,P21,P31,P02,P12,P22,P32,P03,P13,P23,P33;    
wire sum_L11,sum_L12,sum_L13,sum_L21,sum_L22,sum_L23,sum_L31,sum_L32,sum_L33,sum_L41,sum_L42,sum_L43;
wire carry_L11,carry_L12,carry_L13,carry_L21,carry_L22,carry_L23,carry_L31,carry_L32,carry_L33,carry_L41,carry_L42,carry_L43;
wire R0, R1, R2, R3, R4, R5, R6, R7;

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

Full_adder F11(P10,P01,carry_in,sum_L11,carry_L11);
Full_adder F12(P20,P11,carry_in,sum_L12,carry_L12);
Full_adder F13(P30,P21,carry_in,sum_L13,carry_L13);

Full_adder F21(carry_L11,sum_L12,P02,sum_L21,carry_L21);
Full_adder F22(carry_L12,sum_L13,P12,sum_L22,carry_L22);
Full_adder F23(P31,P22,carry_L13,sum_L23,carry_L23);

Full_adder F31(carry_L21,sum_L22,P03,sum_L31,carry_L31);
Full_adder F32(carry_L22,sum_L23,P13,sum_L32,carry_L32);
Full_adder F33(P32,P23,carry_L23,sum_L33,carry_L33);

Full_adder F41(carry_L31,sum_L32,carry_in,sum_L41,carry_L41);
Full_adder F42(carry_L32,sum_L33,carry_L41,sum_L42,carry_L42);
Full_adder F43(carry_L42,carry_L33,P33,sum_L43,carry_L43);

assign R0 = P00;
assign R1 = sum_L11;
assign R2 = sum_L21;
assign R3 = sum_L31;
assign R4 = sum_L41;
assign R5 = sum_L42;
assign R6 = sum_L43;
assign R7 = carry_L43;

always@(*)
begin
    product = {R7,R6,R5,R4,R3,R2,R1,R0};
end
endmodule
