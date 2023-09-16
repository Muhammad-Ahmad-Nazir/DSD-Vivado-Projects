`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 02:48:32 PM
// Design Name: 
// Module Name: Nested_Loadable_Counter_Sim
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


module Nested_Loadable_Counter_Sim();
reg clk;
reg rs;
reg [1:0] cond_sel;
reg [7:0] br_adr;
reg [7:0] sec_adr;
reg cond_0;
reg cond_1;
reg [7:0] sub_ret_adr;
reg pol;
reg [1:0] next_adr_sel;
wire [7:0] c_out;

Nested_Loadable_Counter NLC1( clk, rs, cond_sel, br_adr, sec_adr, cond_0, cond_1, sub_ret_adr, pol, c_out);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    #10
    rs = 1;
    
    #10
    rs = 0;
    cond_sel = 2'b00;
    br_adr = 8'b0011_0010;
    sec_adr = 8'b0110_0100;
    cond_0 = 1'b0;
    cond_1 = 1'b0;
    sub_ret_adr = 8'b1001_0110;
    pol = 0;
    next_adr_sel = 2'b00;
    
    
    #50
    rs = 0;
    cond_sel = 2'b01;
    br_adr = 8'b0011_0010;
    sec_adr = 8'b0110_0100;
    cond_0 = 1'b1;
    cond_1 = 1'b0;
    sub_ret_adr = 8'b1001_0110;
    pol = 0;
    next_adr_sel = 2'b01;
    
    #50
    rs = 0;
    cond_sel = 2'b10;
    br_adr = 8'b0011_0010;
    sec_adr = 8'b0110_0100;
    cond_0 = 1'b0;
    cond_1 = 1'b1;
    sub_ret_adr = 8'b1001_0110;
    pol = 0;
    next_adr_sel = 2'b10;
    
    #50
    rs = 0;
    cond_sel = 2'b11;
    br_adr = 8'b0011_0010;
    sec_adr = 8'b0110_0100;
    cond_0 = 1'b0;
    cond_1 = 1'b0;
    sub_ret_adr = 8'b1001_0110;
    pol = 0;
    next_adr_sel = 2'b11;
    
end    
endmodule
