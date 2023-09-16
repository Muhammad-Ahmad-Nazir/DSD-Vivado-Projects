`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 09:44:45 AM
// Design Name: 
// Module Name: RISC-V_TB
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


module RISC_V_TB();
reg clk;
reg rs;
//wire [31:0] x;
wire [31:0] out;

RISC_V_main RVM1( clk, rs, out);

initial
begin
    clk = 1'b0;
    forever #1000 clk = ~clk;
end

initial
begin
    #0
    rs = 1'b1;
    
    #10
    rs = 1'b0;
    
end
endmodule
