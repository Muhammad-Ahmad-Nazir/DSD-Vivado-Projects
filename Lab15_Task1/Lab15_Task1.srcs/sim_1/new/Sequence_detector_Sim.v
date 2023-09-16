`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 04:44:23 PM
// Design Name: 
// Module Name: Sequence_detector_Sim
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


module Sequence_detector_Sim();
reg clk;
reg rs;
reg in;
wire out;

Sequence_detector SD(clk, rs, in, out);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #10
    rs = 1;
    
    #10
    rs = 0;
    
    #10
    in = 0;
    
    #10
    in = 1;
    
    #10
    in = 0;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 0;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 0;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 0;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
    #10
    in = 1;
    
end
endmodule
