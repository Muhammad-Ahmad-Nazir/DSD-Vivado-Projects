`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 12:19:07 PM
// Design Name: 
// Module Name: Simulator
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


module Simulator();
reg [1:0] x, y;
wire z;

Top_module Tm1( x, y, z);

//initial
//begin
//    clk = 1'b0;
//    forever #5 clk = ~clk;
//end

initial
begin
    #10 
    x = 2'b00;
    y = 2'b00;
    
    #10 
    x = 2'b00;
    y = 2'b01;
    
    #10 
    x = 2'b00;
    y = 2'b10;
    
    #10 
    x = 2'b00;
    y = 2'b11;
    
    #10 
    x = 2'b01;
    y = 2'b00;
    
    #10 
    x = 2'b01;
    y = 2'b01;
    
    #10 
    x = 2'b01;
    y = 2'b10;
    
    #10 
    x = 2'b01;
    y = 2'b11;
    
    #10 
    x = 2'b10;
    y = 2'b00;
    
    #10 
    x = 2'b10;
    y = 2'b01;
    
    #10 
    x = 2'b10;
    y = 2'b10;
    
    #10 
    x = 2'b10;
    y = 2'b11;
    
    #10 
    x = 2'b11;
    y = 2'b00;
    
    #10 
    x = 2'b11;
    y = 2'b01;
    
    #10 
    x = 2'b11;
    y = 2'b10;
    
    #10 
    x = 2'b11;
    y = 2'b11;
    
end
endmodule
