`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 10:19:21 AM
// Design Name: 
// Module Name: Adder_4_bit_sim
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


module Adder_4_bit_sim();
reg [3:0] input1;
reg [3:0] input2;
wire [3:0] anode;
wire [6:0] segment;
wire signed_ov;
wire unsigned_ov;


reg clk;
reg reset;

Adder_4_bit ADD1(input1,input2,anode,segment,signed_ov,unsigned_ov);

initial
begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

initial
begin
    reset = 1'b0;
end

initial
begin
    #10
    input1 = 4'b0001;
    input2 = 4'b0001;
    #10
    input1 = 4'b0010;
    input2 = 4'b0010;
    #10
    input1 = 4'b0011;
    input2 = 4'b0011;
    #10
    input1 = 4'b1111;
    input2 = 4'b0100;
end
endmodule
