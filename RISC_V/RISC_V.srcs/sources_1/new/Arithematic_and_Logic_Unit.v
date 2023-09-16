`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 12:14:37 PM
// Design Name: 
// Module Name: Arithematic_and_Logic_Unit
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


module Arithematic_and_Logic_Unit(
input [3:0] ALU_sel,
input [31:0] Register1_value, Register2_value,
output reg [31:0] ALU_output
    );

always@(*)
begin
	
	case(ALU_sel)
		4'd0:	ALU_output = Register1_value + Register2_value;
		4'd1:	ALU_output = Register1_value - Register2_value;
		4'd2:	ALU_output = Register1_value << Register2_value;
		4'd3:	ALU_output = ($signed(Register1_value) < $signed(Register2_value));
		4'd4:	ALU_output = Register1_value < Register2_value;
		4'd5:	ALU_output = Register1_value ^ Register2_value;
		4'd6:	ALU_output = Register1_value >> Register2_value;
		4'd7:	ALU_output = Register1_value >>> Register2_value;
		4'd8:	ALU_output = Register1_value | Register2_value;
		4'd9:	ALU_output = Register1_value & Register2_value;
	endcase
end

endmodule
