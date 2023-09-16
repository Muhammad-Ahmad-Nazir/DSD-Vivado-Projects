`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:12:31 AM
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
reg input1;
reg input2;
reg input3;
wire [7:0]result;

Decoder_3x8 D1(input1, input2, input3, result);

initial
begin
    #50
    input1 = 0;
    input2 = 0;
    input3 = 0;
    
    #50
    input1 = 0;
    input2 = 0;
    input3 = 1;
    
    #50
    input1 = 0;
    input2 = 1;
    input3 = 0;
    
    #50
    input1 = 0;
    input2 = 1;
    input3 = 1;
    
    #50
    input1 = 1;
    input2 = 0;
    input3 = 0;
    
    #50
    input1 = 1;
    input2 = 0;
    input3 = 1;
    
    #50
    input1 = 1;
    input2 = 1;
    input3 = 0;
    
    #50
    input1 = 1;
    input2 = 1;
    input3 = 1;
    
end
endmodule
