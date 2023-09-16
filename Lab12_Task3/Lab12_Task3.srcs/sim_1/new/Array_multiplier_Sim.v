`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 09:49:07 PM
// Design Name: 
// Module Name: Array_multiplier_Sim
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


module Array_multiplier_Sim();
reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

Array_multiplier AM1(a,b,p);

initial
begin
    #20
    a = 4'b1011;
    b = 4'b0101;
end
endmodule
