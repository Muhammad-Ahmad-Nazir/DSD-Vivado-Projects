`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 02:36:31 PM
// Design Name: 
// Module Name: Debounce_Sim
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


module Debounce_Sim();
reg clk;
reg btn_in;
wire btn_out;
wire slow;

Debounce DB1(clk,btn_in,btn_out,slow);

initial
begin
    clk = 1'b0;
    forever #1clk = ~clk;
end

initial
begin
  btn_in = 0;
  #10;
  btn_in=1;
  #20;
  btn_in = 0;
  #10;
  btn_in=1;
  #30; 
  btn_in = 0;
  #10;
  btn_in=1;
  #40;
  btn_in = 0;
  #10;
  btn_in=1;
  #30; 
  btn_in = 0;
  #10;
  btn_in=1; 
  #1000; 
  btn_in = 0;
  #10;
  btn_in=1;
  #20;
  btn_in = 0;
  #10;
  btn_in=1;
  #30; 
  btn_in = 0;
  #10;
  btn_in=1;
  #40;
  btn_in = 0; 
 end 

endmodule
