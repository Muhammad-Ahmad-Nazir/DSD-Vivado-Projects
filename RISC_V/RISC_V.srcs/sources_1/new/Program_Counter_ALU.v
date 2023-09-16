`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 09:43:56 AM
// Design Name: 
// Module Name: Program_Counter_ALU
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


module Program_Counter_ALU(
input [31:0] PC,
output reg [31:0] PC_plus4
);

always@(*)
begin
	PC_plus4 = PC + 4;
end
endmodule
