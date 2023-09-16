`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 02:59:59 PM
// Design Name: 
// Module Name: Master_slave_FF
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


module Master_slave_FF(clk, data_in, data_out, data_out_bar);
input clk;
input data_in;
output reg data_out;
output reg data_out_bar;

reg intermediate_state;

always@(posedge clk)
begin
    intermediate_state = data_in;
end

always@(negedge clk)
begin
    data_out = intermediate_state;
    data_out_bar = ~intermediate_state;
end

endmodule
