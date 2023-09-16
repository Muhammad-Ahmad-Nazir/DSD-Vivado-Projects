`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:16:46 PM
// Design Name: 
// Module Name: Encoder_4x2
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


module Encoder_4x2(input_lines, output_code);
input [3:0] input_lines;
output reg [1:0] output_code = 0;

always@(*)
begin
//    if ( (input_lines[1] || input_lines[3]) == 1)
//    begin
//        output_code[0] = 1;
//    end
    
//    if ( (input_lines[2] || input_lines[3]) == 1)
//    begin
//        output_code[1] = 1;
//    end

    case(input_lines)
    
    4'b0001: output_code = 2'b00;
    4'b0010: output_code = 2'b01;
    4'b0100: output_code = 2'b10;
    4'b1000: output_code = 2'b11;
    
    endcase

end
endmodule
