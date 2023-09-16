`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 03:36:33 PM
// Design Name: 
// Module Name: Loadable_Counter
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


module Loadable_Counter(
input clk,
input reset,
input load_en,
input [7:0] load_value,
output reg [7:0] counter_out
    );

initial
begin
    counter_out = 8'b0000_0000;
end

always@(posedge clk or posedge reset)
begin
    if ( reset == 1 || counter_out == 8'b1111_1111 )
    begin
        counter_out = 8'b0000_0000;
    end
    
    else if ( load_en == 1 )
    begin
        counter_out = load_value;
    end
    
    else
    begin
        counter_out = counter_out + 1;
    end
end
endmodule
