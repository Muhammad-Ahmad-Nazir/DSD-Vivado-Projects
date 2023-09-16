`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2023 06:00:37 PM
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
input [1:0] a,b,
output reg c
    );

reg a1_comp, a0_comp, b1_comp, b0_comp;

always@(*)
begin
    a1_comp = ~a[1];
    a0_comp = ~a[0];
    b1_comp = ~b[1];
    b0_comp = ~b[0];
    
    c = ( (a1_comp & b1_comp) + (a[1] & b[1]) ) & ( (a0_comp & b0_comp) + (a[0] & b[0]) ); 
end

endmodule
