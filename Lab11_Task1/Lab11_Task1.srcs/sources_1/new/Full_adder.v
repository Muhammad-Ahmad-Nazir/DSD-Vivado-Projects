`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 02:43:41 PM
// Design Name: 
// Module Name: Full_adder
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

module Full_adder (
input bit1,
input bit2,
input carry_in,
output reg result,
output reg carry_out

);

always@(*)
begin
    {carry_out,result} = bit1 + bit2 + carry_in;
end
endmodule