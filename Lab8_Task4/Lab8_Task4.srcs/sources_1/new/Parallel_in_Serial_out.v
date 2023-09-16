`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:22:34 PM
// Design Name: 
// Module Name: Parallel_in_Serial_out
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


module Parallel_in_Serial_out(clk, reset, enable, data_in, data_out);
input clk;
input reset;
input enable;
input [7:0] data_in;
output reg data_out;

reg [7:0] temp;

always@(posedge clk)
begin
    if (reset == 1)
    begin
        temp = 8'b00000000;
    end
    
    else if (enable == 0)
    begin
        temp = data_in;
    end
    
    else
    begin
        data_out = temp[0];
        temp = temp >> 1;
    end
end
endmodule
