`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 12:43:19 PM
// Design Name: 
// Module Name: Time_shared_16x16_multiplier_Sim
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


module Time_shared_16x16_multiplier_Sim();
reg clk;
reg [15:0] op1;
reg [15:0] op2;
wire [31:0] pro;

Time_shared_16x16_multiplier TSM1(clk,op1,op2,pro);

initial
begin
    clk = 1'b0;
    forever #20 clk = ~clk;
end

initial
begin
    #20
    op1 = 16'b0000_0000_0000_1011;
    op2 = 16'b0000_0000_0000_0101;
end
endmodule
