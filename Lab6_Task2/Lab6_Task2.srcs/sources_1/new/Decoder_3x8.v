`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 10:53:58 AM
// Design Name: 
// Module Name: Decoder_3x8
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
        default: data_out = 4'b0000;
        
        endcase
    end
end

endmodule


module Decoder_3x8(enable,input_lines,output_lines);
input enable;
input [2:0] input_lines;
output reg [7:0] output_lines = 0;

reg in2_bar;
reg enable_for_0 = 0;
reg enable_for_1 = 0;
wire [7:0] data_to_send;

always@(*)
begin
     in2_bar = ~input_lines[2];
    
    if ( (enable && in2_bar) == 1)
    begin
        enable_for_0 = 1;
        enable_for_1 = 0;
        
    end
    
    else if ( (enable && input_lines[2]) == 1)
    begin
        enable_for_0 = 0;
        enable_for_1 = 1;
    end
    
    else
    begin
        enable_for_0 = 0;
        enable_for_1 = 0;
    end
    
    //Decoder_2x4 DC1(enable_for_0, input_lines[1:0], output_lines[3:0]);
    //Decoder_2x4 DC2(enable_for_1, input_lines[1:0], output_lines[7:4]);
end
    Decoder_2x4 DC1(enable_for_0, input_lines[1:0], data_to_send[3:0]);
    Decoder_2x4 DC2(enable_for_1, input_lines[1:0], data_to_send[7:4]);

always@(*)
begin
    output_lines = data_to_send;
end

endmodule
