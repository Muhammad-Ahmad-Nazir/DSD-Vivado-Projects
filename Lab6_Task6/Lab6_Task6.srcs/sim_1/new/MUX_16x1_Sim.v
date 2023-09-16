`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2023 03:12:54 PM
// Design Name: 
// Module Name: MUX_16x1_Sim
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


module MUX_16x1_Sim();
reg [3:0] sel;
reg [4:0] d1;
reg [4:0] d2;
reg [4:0] d3;
reg [4:0] d4;
reg [4:0] d5;
reg [4:0] d6;
reg [4:0] d7;
reg [4:0] d8;
reg [4:0] d9;
reg [4:0] d10;
reg [4:0] d11;
reg [4:0] d12;
reg [4:0] d13;
reg [4:0] d14;
reg [4:0] d15;
reg [4:0] d16;
wire [4:0] out;

MUX_16x1 M1(sel,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,out);

initial
begin
    d1 = 5'd1;
    d2 = 5'd2;
    d3 = 5'd3;
    d4 = 5'd4;
    d5 = 5'd5;
    d6 = 5'd6;
    d7 = 5'd7;
    d8 = 5'd8;
    d9 = 5'd9;
    d10 = 5'd10;
    d11 = 5'd11;
    d12 = 5'd12;
    d13 = 5'd13;
    d14 = 5'd14;
    d15 = 5'd15;
    d16 = 5'd16;
    
    #30
    sel = 4'b0000;
    
    #30
    sel = 4'b0001;
    
    #30
    sel = 4'b0010;
    
    #30
    sel = 4'b0011;
    
    #30
    sel = 4'b0100;
    
    #30
    sel = 4'b0101;
    
    #30
    sel = 4'b0110;
    
    #30
    sel = 4'b0111;
    
    #30
    sel = 4'b1000;
    
    #30
    sel = 4'b1001;
    
    #30
    sel = 4'b1010;
    
    #30
    sel = 4'b1011;
    
    #30
    sel = 4'b1100;
    
    #30
    sel = 4'b1101;
    
    #30
    sel = 4'b1110;
    
    #30
    sel = 4'b1111;
    
end
endmodule
