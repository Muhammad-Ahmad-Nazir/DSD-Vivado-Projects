`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 12:40:48 PM
// Design Name: 
// Module Name: MUX_4x1_Sim
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


module MUX_4x1_Sim();
reg [1:0] sel;
reg [2:0] data0;
reg [2:0] data1;
reg [2:0] data2;
reg [2:0] data3;
wire [2:0] out;

MUX_4x1 M1(sel, data0, data1, data2, data3, out);

initial
begin
    data0 = 3'd1;
    data1 = 3'd2;
    data2 = 3'd3;
    data3 = 3'd4;
    
    #50
    sel = 2'b00;
    
    #50
    sel = 2'b01;
    
    #50
    sel = 2'b10;
    
    #50
    sel = 2'b11;
end
endmodule
