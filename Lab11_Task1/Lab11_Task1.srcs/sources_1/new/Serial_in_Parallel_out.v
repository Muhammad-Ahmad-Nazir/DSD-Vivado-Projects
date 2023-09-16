`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 02:53:31 PM
// Design Name: 
// Module Name: Serial_in_Parallel_out
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


module Serial_in_Parallel_out(clk, reset, data_in, data_out);
input clk;
input reset;
input data_in;
output reg [7:0] data_out;

reg [7:0] temp;

always@(posedge clk)
begin
    if (reset == 1)
    begin
        data_out = 8'b00000000;
    end
    
    else
    begin
        temp = data_out >> 1;
        data_out = { data_in, temp[6:0]};
    end
end
endmodule
