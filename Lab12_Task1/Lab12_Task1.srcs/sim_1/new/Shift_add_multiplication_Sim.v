`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 10:13:31 PM
// Design Name: 
// Module Name: Shift_add_multiplication_Sim
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


module Shift_add_multiplication_Sim();
reg clk;
reg [3:0] m1;
reg [3:0] m2;
wire [7:0] pro;

Shift_add_multiplication SAM1(clk, m1, m2, pro);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #10
    m1 = 4'b0010;
    m2 = 4'b1001;
    
end
endmodule
