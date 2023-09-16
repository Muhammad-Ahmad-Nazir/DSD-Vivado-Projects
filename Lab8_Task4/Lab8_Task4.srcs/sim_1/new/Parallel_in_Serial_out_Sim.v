`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:36:45 PM
// Design Name: 
// Module Name: Parallel_in_Serial_out_Sim
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


module Parallel_in_Serial_out_Sim();
reg clk;
reg clr;
reg en;
reg [7:0] in;
wire out;

Parallel_in_Serial_out PISO1(clk, clr, en, in, out);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #20
    clr = 0;
    en = 0;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b01010101;
    
    #20
    clr = 0;
    en = 0;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
    #20
    clr = 0;
    en = 1;
    in = 8'b00110011;
    
end
endmodule
