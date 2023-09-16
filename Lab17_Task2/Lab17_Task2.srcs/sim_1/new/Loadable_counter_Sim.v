`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 04:01:50 PM
// Design Name: 
// Module Name: Loadable_counter_Sim
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


module Loadable_counter_Sim();
reg clk;
reg rs;
reg ld;
reg [7:0] ld_val;
wire [7:0] c_out;

Loadable_Counter LC1( clk, rs, ld, ld_val, c_out);

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
    ld = 0;
    ld_val = 8'd50;
    
    #100
    rs = 0;
    ld = 1;
    ld_val = 8'd50;
    
    #10
    rs = 0;
    ld = 0;
    ld_val = 8'd50;
    
end
endmodule
