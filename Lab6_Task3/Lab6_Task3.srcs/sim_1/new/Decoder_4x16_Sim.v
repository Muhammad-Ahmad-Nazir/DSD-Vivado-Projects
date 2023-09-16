`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:01:07 PM
// Design Name: 
// Module Name: Decoder_4x16_Sim
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


module Decoder_4x16_Sim();
reg en;
reg [3:0] in;
wire [15:0] out;

Decoder_4x16 DC416(en,in,out);

initial
begin
    #50
    en = 0;
    in = 4'b0000;
    
    #50
    en = 0;
    in = 4'b0001;
    
    #50
    en = 0;
    in = 4'b0010;
    
    #50
    en = 0;
    in = 4'b0011;
    
    #50
    en = 0;
    in = 4'b0100;
    
    #50
    en = 0;
    in = 4'b0101;
    
    #50
    en = 0;
    in = 4'b0110;
    
    #50
    en = 0;
    in = 4'b0111;
    
    #50
    en = 0;
    in = 4'b1000;
    
    #50
    en = 0;
    in = 4'b1001;
    
    #50
    en = 0;
    in = 4'b1010;
    
    #50
    en = 0;
    in = 4'b1011;
    
    #50
    en = 0;
    in = 4'b1100;
    
    #50
    en = 0;
    in = 4'b1101;
    
    #50
    en = 0;
    in = 4'b1110;
    
    #50
    en = 0;
    in = 4'b1111;
    
    #50
    en = 1;
    in = 4'b0000;
    
    #50
    en = 1;
    in = 4'b0001;
    
    #50
    en = 1;
    in = 4'b0010;
    
    #50
    en = 1;
    in = 4'b0011;
    
    #50
    en = 1;
    in = 4'b0100;
    
    #50
    en = 1;
    in = 4'b0101;
    
    #50
    en = 1;
    in = 4'b0110;
    
    #50
    en = 1;
    in = 4'b0111;
    
    #50
    en = 1;
    in = 4'b1000;
    
    #50
    en = 1;
    in = 4'b1001;
    
    #50
    en = 1;
    in = 4'b1010;
    
    #50
    en = 1;
    in = 4'b1011;
    
    #50
    en = 1;
    in = 4'b1100;
    
    #50
    en = 1;
    in = 4'b1101;
    
    #50
    en = 1;
    in = 4'b1110;
    
    #50
    en = 1;
    in = 4'b1111;
end

endmodule
