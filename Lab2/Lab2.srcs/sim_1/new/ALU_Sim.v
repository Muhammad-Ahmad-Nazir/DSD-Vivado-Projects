`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 11:05:07 PM
// Design Name: 
// Module Name: ALU_Sim
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


module ALU_Sim();
reg [3:0] in1;
reg [3:0] in2;
reg btnl;
reg btnr;
reg btnu;
reg btnd;
reg btnc;
wire [3:0] res;

reg clk;

ALU A1(clk, in1,in2,btnl,btnr,btnu,btnd,btnc,res);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin

    #50
    in1 = 4'b0011;
    in2 = 4'b0001;
    btnl = 1;
    btnr = 0;
    btnu = 0;
    btnd = 0;
    btnc = 0;
    
    #50
    in1 = 4'b0011;
    in2 = 4'b0001;
    btnl = 0;
    btnr = 1;
    btnu = 0;
    btnd = 0;
    btnc = 0;
    
    #50
    in1 = 4'b0011;
    in2 = 4'b0001;
    btnl = 0;
    btnr = 0;
    btnu = 1;
    btnd = 0;
    btnc = 0;
    
    #50
    in1 = 4'b0011;
    in2 = 4'b0001;
    btnl = 0;
    btnr = 0;
    btnu = 0;
    btnd = 1;
    btnc = 0;
    
    #50
    in1 = 4'b0011;
    in2 = 4'b0001;
    btnl = 0;
    btnr = 0;
    btnu = 0;
    btnd = 0;
    btnc = 1;
    
end

endmodule
