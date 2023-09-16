`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:42:36 AM
// Design Name: 
// Module Name: Decoder_2x4_Sim
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


module Decoder_2x4_Sim();
reg en;
reg [1:0] in;
wire [3:0] out;

Decoder_2x4 D1(en,in,out);

initial
begin
    #50
    en = 0;
    in = 2'b00;
    
    #50
    en = 0;
    in = 2'b01;
    
    #50
    en = 0;
    in = 2'b10;
    
    #50
    en = 0;
    in = 2'b11;
    
    #50
    en = 1;
    in = 2'b00;
    
    #50
    en = 1;
    in = 2'b01;
    
    #50
    en = 1;
    in = 2'b10;
    
    #50
    en = 1;
    in = 2'b11;
end

endmodule
