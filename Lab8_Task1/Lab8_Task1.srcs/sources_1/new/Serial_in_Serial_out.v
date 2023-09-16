`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 03:38:21 PM
// Design Name: 
// Module Name: Serial_in_Serial_out
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


module Serial_in_Serial_out(clk, reset, data_in, data_out);
input clk;
input reset;
input data_in;
output data_out;

reg [7:0] temp;

always@(posedge clk)
begin
    if (reset == 1)
    begin
        temp = 8'b00000000;
    end
    
    else
    begin
        temp = temp >> 1;
        temp[7] = data_in;
    end
end
    assign data_out = temp[0];
    
endmodule
