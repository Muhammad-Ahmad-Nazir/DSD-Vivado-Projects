`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 01:40:13 AM
// Design Name: 
// Module Name: Top_module
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


module Top_module(
input clk,
input reset,
output [7:0] data
    );
    
wire [7:0] counter_value;

Unloadable_Counter UC1( clk, reset, counter_value);
ROM R1( clk, counter_value, data); 

endmodule
