`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:00:51 PM
// Design Name: 
// Module Name: Serial_in_Parallel_out_Sim
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


module Serial_in_Parallel_out_Sim();
reg clk;
reg clr;
reg D;
wire [7:0] out;

Serial_in_Parallel_out SIPO1(clk, clr, D, out);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 1;
    D = 0;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 1;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 0;
    
    #20
    clr = 0;
    D = 1;  
end
endmodule
