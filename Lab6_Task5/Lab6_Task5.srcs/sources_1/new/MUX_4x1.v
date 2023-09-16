`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:30:53 PM
// Design Name: 
// Module Name: MUX_4x1
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


module MUX_4x1(selection_lines, data_line_0, data_line_1, data_line_2, data_line_3, output_line);
//input enable;
input [1:0] selection_lines;
input [2:0] data_line_0;
input [2:0] data_line_1;
input [2:0] data_line_2;
input [2:0] data_line_3;
output reg [2:0] output_line;

always@(*)
begin
    case (selection_lines)
    
    2'b00: output_line = data_line_0;
    2'b01: output_line = data_line_1;
    2'b10: output_line = data_line_2;
    2'b11: output_line = data_line_3;
    
    endcase
end

endmodule
