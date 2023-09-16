`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 12:41:58 PM
// Design Name: 
// Module Name: MUX_3x1
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


module MUX_3x1(
input [31:0] in1, in2, in3,
input [1:0] selection_bits,
output reg [31:0] out
    );

always @(*)
begin
	if (selection_bits == 2'b00)
		out = in1;
	else if (selection_bits == 2'b01)
		out = in2;
	else if (selection_bits == 2'b10)
		out = in3;
		
end

endmodule
