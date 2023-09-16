`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:52:42 PM
// Design Name: 
// Module Name: MUX_16x1
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

module MUX_4x1(selection_lines, data_line_0, data_line_1, data_line_2, data_line_3, output_line);
//input enable;
input [1:0] selection_lines;
input [2:0] data_line_0;
input [2:0] data_line_1;
input [2:0] data_line_2;
input [2:0] data_line_3;
output reg [2:0] output_line;

always@(*)
begin
    case (selection_lines)
    
    2'b00: output_line = data_line_0;
    2'b01: output_line = data_line_1;
    2'b10: output_line = data_line_2;
    2'b11: output_line = data_line_3;
    
    endcase
end

endmodule


module MUX_16x1(select_lines, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, out_line);
input [3:0] select_lines;
input [4:0] data1;
input [4:0] data2;
input [4:0] data3;
input [4:0] data4;
input [4:0] data5;
input [4:0] data6;
input [4:0] data7;
input [4:0] data8;
input [4:0] data9;
input [4:0] data10;
input [4:0] data11;
input [4:0] data12;
input [4:0] data13;
input [4:0] data14;
input [4:0] data15;
input [4:0] data16;
output reg [4:0] out_line;

wire [4:0] intermediate_line_1;
wire [4:0] intermediate_line_2;
wire [4:0] intermediate_line_3;
wire [4:0] intermediate_line_4;
wire [4:0] out_data;

MUX_4x1 M1(select_lines[1:0], data1, data2, data3, data4, intermediate_line_1);
MUX_4x1 M2(select_lines[1:0], data5, data6, data7, data8, intermediate_line_2);
MUX_4x1 M3(select_lines[1:0], data9, data10, data11, data12, intermediate_line_3);
MUX_4x1 M4(select_lines[1:0], data13, data14, data15, data16, intermediate_line_4);

MUX_4x1 M5(select_lines[3:2], intermediate_line_1, intermediate_line_2, intermediate_line_3, intermediate_line_4, out_data);

always@(*)
begin
    assign out_line = out_data;
end

endmodule
