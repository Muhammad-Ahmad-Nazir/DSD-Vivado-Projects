`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2023 11:40:36 AM
// Design Name: 
// Module Name: Binary_multiplier_3x3_Sim
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


module Binary_multiplier_3x3_Sim();
reg clk;
reg st;
reg [2:0] op1;
reg [2:0] op2;
wire d;
wire [5:0] pro;

Binary_multiplier_3x3 BM3x3(clk,st,op1,op2,pro,d);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #10
    st = 0;
    
    #20
    st = 1;
    op1 = 3'b011;
    op2 = 3'b010;
    
//    #10
//    st = 0;
end
endmodule
