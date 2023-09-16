`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 11:00:01 AM
// Design Name: 
// Module Name: Bit_serial_adder_Sim
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


module Bit_serial_adder_Sim();
reg clk;
reg rs;
reg en_a;
reg en_b;
reg [7:0] a;
reg [7:0] b;
wire [7:0] s;

wire v,w,x,y,z;

Bit_serial_adder BSA(clk, rs, en_a, en_b, a, b, s, v, w, x, y, z);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #20
    rs = 1;
    
    #20
    rs = 0;
    en_a = 1;
    a = 8'b0000_1001;
    en_b = 1;
    b = 8'b0000_0111;
    
    #10
    rs = 0;
    en_a = 0;
    //a = 8'b0000_1001;
    en_b = 0;
    //b = 8'b0000_0111;
    
end
endmodule
