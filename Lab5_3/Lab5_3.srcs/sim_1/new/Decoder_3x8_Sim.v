`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:23:13 AM
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
reg [2:0] inputs;
wire [7:0] outputs;

Decoder_3x8 D1(inputs,outputs);

initial
begin
    #50
    inputs = 3'b000;
    
    #50
    inputs = 3'b001;
    
    #50
    inputs = 3'b010;
    
    #50
    inputs = 3'b011;
    
    #50
    inputs = 3'b100;
    
    #50
    inputs = 3'b101;
    
    #50
    inputs = 3'b110;
    
    #50
    inputs = 3'b111;

end
endmodule
