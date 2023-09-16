`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2023 01:25:28 PM
// Design Name: 
// Module Name: Multiplier_4x4_Sim
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


module Multiplier_4x4_Sim();
reg clk;
reg st;
reg [4:0] op1_adr;
reg [4:0] op2_adr;
wire [7:0] pro;
wire d;

Multiplier_4x4 MU1( clk, st, op1_adr, op2_adr, pro, d);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #10
    st = 0;
    
    #10
    st = 1;
    op1_adr = 5'b00011;
    op2_adr = 5'b10101;
end
endmodule
