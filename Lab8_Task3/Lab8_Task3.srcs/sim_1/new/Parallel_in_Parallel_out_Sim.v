`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:14:06 PM
// Design Name: 
// Module Name: Parallel_in_Parallel_out_Sim
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


module Parallel_in_Parallel_out_Sim();
reg clk;
reg clr;
reg [7:0] in;
wire [7:0] out;

Parallel_in_Parallel_out PIPO1(clk, clr, in, out);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #50
    clr = 0;
    in = 8'b01010101;
    
    #50
    clr = 0;
    in = 8'b10101010;
    
    #50
    clr = 1;
    in = 8'b01010101;
    
    #50
    clr = 0;
    in = 8'b11111111;
    
    #50
    clr = 0;
    in = 8'b00000000;
    
    #50
    clr = 0;
    in = 8'b11111111;
    
end
endmodule
