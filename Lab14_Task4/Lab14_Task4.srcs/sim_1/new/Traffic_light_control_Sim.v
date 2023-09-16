`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 03:13:12 PM
// Design Name: 
// Module Name: Traffic_light_control_Sim
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


module Traffic_light_control_Sim();
reg clk;
reg rs;
wire [1:0] S1;
wire [1:0] S2;

Traffic_light_controller TLC(clk,rs,S1,S2);

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
end
endmodule
