`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:10:16 PM
// Design Name: 
// Module Name: Parallel_in_Parallel_out
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


module Parallel_in_Parallel_out(clk, reset, data_in, data_out);
input clk;
input reset;
input [7:0] data_in;
output reg [7:0] data_out;

always@(posedge clk)
begin
    if (reset == 1)
    begin
        data_out = 8'b00000000;
    end
    
    else
    begin
        data_out = data_in;
    end
end

endmodule
