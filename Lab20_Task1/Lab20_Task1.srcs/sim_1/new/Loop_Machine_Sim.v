`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 12:09:44 PM
// Design Name: 
// Module Name: Loop_Machine_Sim
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


module Loop_Machine_Sim();
reg clk;
reg en_l;
reg [7:0] l_s_adr;
reg [7:0] l_e_adr;
reg [3:0] noloop;
reg [7:0] curr_adr;

wire lei;
wire lef;

Loop_Machine LM( clk, en_l, l_s_adr, l_e_adr, noloop, curr_adr, lei, lef);

initial 
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #5
    en_l = 1'b1;
    l_s_adr = 8'b0001_0100;
    l_e_adr = 8'b0001_1110;
    noloop = 3'b0010;
    curr_adr = 8'b0000_0000;
    
    #5
    en_l = 1'b0;
    curr_adr = curr_adr + 8'b0000_0001;
    
    #5
    en_l = 1'b0;
    curr_adr = curr_adr + 8'b0000_1101;
    
    #5
    en_l = 1'b0;
    curr_adr = 8'b0001_0100;
    
    #5
    en_l = 1'b0;
    curr_adr = 8'b0001_1110;
end
endmodule
