`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:20:35 PM
// Design Name: 
// Module Name: Encoder_4x2_Sim
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


module Encoder_4x2_Sim();
reg [3:0] in;
wire [1:0] out;

Encoder_4x2 EC1(in,out);

initial
begin
    #50
    in = 4'b0001;
    
    #50
    in = 4'b0010;
    
    #50
    in = 4'b0100;
    
    #50
    in = 4'b1000;
end
endmodule
