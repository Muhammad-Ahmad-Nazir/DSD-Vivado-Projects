`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:59:29 PM
// Design Name: 
// Module Name: Ring_counter_Sim
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


module Ring_counter_Sim();
reg clk;
reg clr;
wire [7:0] count;

Ring_counter RC1(clk, clr, count);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #50
    clr = 1;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 1;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
    #50
    clr = 0;
    
end
endmodule
