`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 09:42:59 AM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
input clk,
input reset,
input [31:0] PC_input,
output reg [31:0] PC
);


always@(posedge clk or posedge reset)
begin
    if ( reset == 1'b1 )
    begin
        PC = 32'b0;
    end
    
    else
    begin
	   PC = PC_input;
    end
end
endmodule
