`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 12:03:31 PM
// Design Name: 
// Module Name: Immediate_value_gen
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


module Immediate_value_gen(
input [19:0] Imm_gen_input,
input I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en,
output reg [31:0] Imm_gen_output
    );

always @(*)        //final = {n{name[bit]}} - set bit of name in final n times
begin
	if (I_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (L_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (S_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (B_type_en)
	begin
		Imm_gen_output = { 12'd0, {Imm_gen_input[19:0]}};
	end
	
	if (J_type_en)
	begin
		Imm_gen_output = { 11'd0, {Imm_gen_input[19:0]}, 1'd0};
	end
	
	if (U_type_en)
	begin
		Imm_gen_output = { {Imm_gen_input[19:0]}, 12'd0 };
	end

end

endmodule
