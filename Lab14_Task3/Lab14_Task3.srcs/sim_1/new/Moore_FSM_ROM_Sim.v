`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 12:02:40 PM
// Design Name: 
// Module Name: Moore_FSM_ROM_Sim
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


module Moore_FSM_ROM_Sim();
reg clk;
reg rs;
wire [2:0] c;

Moore_FSM_ROM MSR(clk, rs, c);

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
