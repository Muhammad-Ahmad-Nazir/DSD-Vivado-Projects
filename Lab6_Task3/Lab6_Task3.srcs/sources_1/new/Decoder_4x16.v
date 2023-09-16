`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 11:49:29 AM
// Design Name: 
// Module Name: Decoder_4x16
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


module Decoder_4x16(enable,input_lines,output_lines);
input enable;
input [3:0] input_lines;
output reg [15:0] output_lines = 0;

wire [3:0] layer_2_sel;
wire [3:0] final_out;

Decoder_2x4 L1D1(enable, input_lines[3:2], layer_2_sel);

Decoder_2x4 L2D1(layer_2_sel[0], input_lines[1:0], final_out);
Decoder_2x4 L2D2(layer_2_sel[1], input_lines[1:0], final_out);
Decoder_2x4 L2D3(layer_2_sel[2], input_lines[1:0], final_out);
Decoder_2x4 L2D4(layer_2_sel[3], input_lines[1:0], final_out);

always@(*)
begin
    if ( layer_2_sel[0] == 1)
    begin
        output_lines = {12'b0,final_out};
    end
    
    else if ( layer_2_sel[1] == 1)
    begin
        output_lines = {8'b0,final_out,4'b0};
    end
    
    else if ( layer_2_sel[2] == 1)
    begin
        output_lines = {4'b0,final_out,8'b0};
    end
    
    else if ( layer_2_sel[3] == 1)
    begin
        output_lines = {final_out,8'b0};
    end
    
    else
    begin
        output_lines = 16'b0;
    end
    
end
endmodule
