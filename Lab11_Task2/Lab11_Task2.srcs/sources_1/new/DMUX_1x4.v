`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 04:16:00 PM
// Design Name: 
// Module Name: DMUX_1x4
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


module DMUX_1x4(
input [1:0] line_select,
input [7:0] data_in,
output reg [7:0] data_out_1,
output reg [7:0] data_out_2,
output reg [7:0] data_out_3,
output reg [7:0] data_out_4
    );
 
 always@(*)
 begin   
    case(line_select)
    
    2'b00:
    begin
        data_out_1 = data_in;
    end
    
    2'b01:
    begin
        data_out_2 = data_in;
    end
    
    2'b10:
    begin
        data_out_3 = data_in;
    end
    
    2'b11:
    begin
        data_out_4 = data_in;
    end
    
    endcase
end
endmodule
