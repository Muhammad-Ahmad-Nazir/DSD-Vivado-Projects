`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 12:59:29 AM
// Design Name: 
// Module Name: Unloadable_Counter
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


module Unloadable_Counter(
input clk,
input reset,
output reg [7:0] count = 8'b0000_0000
    );
    
always@(posedge clk or posedge reset)
begin
    if ( reset == 1 || count == 8'b1111_1111 )
    begin
        count = 8'b0000_0000;
    end
    
    else
    begin
        count = count + 1;
    end
end
 
endmodule
