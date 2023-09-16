`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2023 04:19:43 PM
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
reg [3:0] M1;
reg [3:0] M2;
wire [7:0] pro;

Array_multiplier AM1( M1,M2,pro);

initial
begin
    #10
    M1 = 4'b0101;
    M2 = 4'b1011;
end

endmodule
