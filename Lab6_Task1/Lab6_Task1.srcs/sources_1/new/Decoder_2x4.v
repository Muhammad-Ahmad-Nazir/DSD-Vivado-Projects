`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:38:17 AM
// Design Name: 
// Module Name: Decoder_2x4
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


module Decoder_2x4(enable, data_in, data_out);
input enable;
input [1:0] data_in;
output reg [3:0] data_out = 0;

always@(*)
begin
    if (enable == 1)
    begin
        case (data_in)
        
        2'b00: data_out = 4'b0001;
        2'b01: data_out = 4'b0010;
        2'b10: data_out = 4'b0100;
        2'b11: data_out = 4'b1000;
        
        endcase
    end
end

endmodule
