`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 12:01:24 PM
// Design Name: 
// Module Name: MUX_2x1
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


module MUX_2x1(
input select,
input [7:0] data1,
input [7:0] data2,
output reg [7:0] dataout
    );

always@(*)
begin
    if ( select == 1'b1 )
    begin
        dataout = data2;
    end
    
    else
    begin
        dataout = data1;
    end
end    
endmodule
