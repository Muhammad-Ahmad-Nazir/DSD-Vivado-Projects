`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2023 09:52:21 AM
// Design Name: 
// Module Name: Nested_Loop_Sim
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


module Nested_Loop_Sim();
reg clk;
reg rs;
reg loop_i;
reg [7:0] PC;
reg [7:0] EA;
reg [3:0] LC;

wire LEF;
wire LEIF;
wire [7:0] NA;

Nested_Loop_Machine NLM1(clk, rs, loop_i, PC, EA, LC, LEF, LEIF, NA);

initial
begin
    clk = 1'b0;
    PC = 8'b0000_0000;
    forever #2 clk = ~clk;
end

always@(posedge clk)
begin
    PC = PC + 8'b0000_0001;
    
    if ( LEF == 1'b1 )
    begin
        PC = NA;
    end
end

initial
begin
    #5
    rs = 1;
    
    #5 
    rs = 0;
    loop_i = 1'b1;
    EA = 8'd20;
    LC = 4'd2;
    
    #1
    loop_i = 1'b0;
    
    #5 
    rs = 0;
    loop_i = 1'b1;
    EA = 8'd15;
    LC = 4'd1;
    
    #1
    loop_i = 1'b0;
    
end
endmodule
