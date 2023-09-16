`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 09:42:52 AM
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
reg input1;
reg input2;
wire [3:0] result;

Decoder_2x4 D1(
.in1(input1),
.in2(input2),
.out(result)
);

initial
begin
    #50
    input1 = 0;
    input2 = 0;
    
    #50
    input1 = 0;
    input2 = 1;
    
    #50
    input1 = 1;
    input2 = 0;
    
    #50
    input1 = 1;
    input2 = 1;
end

endmodule
