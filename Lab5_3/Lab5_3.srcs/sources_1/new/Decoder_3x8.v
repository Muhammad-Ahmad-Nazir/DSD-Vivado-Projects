`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:18:30 AM
// Design Name: 
// Module Name: Decoder_3x8
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


module Decoder_3x8(data,result);
input [2:0] data;
output reg [7:0] result = 0;

always @ (*)
begin
    case (data)
    
    3'b000: result = 8'b00000001;
    3'b001: result = 8'b00000010;
    3'b010: result = 8'b00000100;
    3'b011: result = 8'b00001000;
    3'b100: result = 8'b00010000;
    3'b101: result = 8'b00100000;
    3'b110: result = 8'b01000000;
    3'b111: result = 8'b10000000;
    
    endcase
end
endmodule
