`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 11:09:12 AM
// Design Name: 
// Module Name: Decoder_3x8_Sim
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


module Decoder_3x8_Sim();
reg en;
reg [2:0] in;
wire [7:0] out;

Decoder_3x8 DD1(en,in,out);

initial
begin
    #50
    en = 0;
    in = 3'b000;
    
    #50
    en = 0;
    in = 3'b001;
    
    #50
    en = 0;
    in = 3'b010;
    
    #50
    en = 0;
    in = 3'b011;
    
    #50
    en = 0;
    in = 3'b100;
    
    #50
    en = 0;
    in = 3'b101;
    
    #50
    en = 0;
    in = 3'b110;
    
    #50
    en = 0;
    in = 3'b111;
    
    #50
    en = 1;
    in = 3'b000;
    
    #50
    en = 1;
    in = 3'b001;
    
    #50
    en = 1;
    in = 3'b010;
    
    #50
    en = 1;
    in = 3'b011;
    
    #50
    en = 1;
    in = 3'b100;
    
    #50
    en = 1;
    in = 3'b101;
    
    #50
    en = 1;
    in = 3'b110;
    
    #50
    en = 1;
    in = 3'b111;
end
endmodule
