`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 04:05:54 PM
// Design Name: 
// Module Name: Mealy_sequence_detector_Sim
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


module Mealy_sequence_detector_Sim();
reg clk;
reg rs;
reg in;
wire [3:0] con;
wire out;

Mealy_sequence_detector MSD(clk, rs, in, con, out);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #15
    rs = 1;
    
    #15
    rs = 0;
    in = 1;
    
    #15
    in = 0;
    
    #15
    in = 0;
    
    #15
    in = 1;
    
    #15
    in = 1;
    
    #15
    in = 1;
    
    #15
    in = 0;
    
    #15
    in = 0;
    
    #15
    in = 1;
    
    #15
    in = 0;
 end   
endmodule
