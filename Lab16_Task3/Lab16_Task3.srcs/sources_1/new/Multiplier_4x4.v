`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2023 03:46:26 PM
// Design Name: 
// Module Name: Multiplier_4x4
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


module Multiplier_4x4(
input clk,
input start,
input [4:0] multiplicand_adr,
input [4:0] multiplier_adr,
output [7:0] Product,
output Done
    );
    
//wire [7:0] moduler_product;
//wire moduler_done;
wire [3:0] multiplicand_value;
wire [3:0] multiplier_value;

ROM R1(clk, multiplicand_adr, multiplicand_value);
ROM R2(clk, multiplier_adr, multiplier_value);
Multiplier M1( clk, start, multiplicand_value, multiplier_value, Product, Done);
    
endmodule


