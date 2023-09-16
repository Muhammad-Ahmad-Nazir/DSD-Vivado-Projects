`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 02:50:45 PM
// Design Name: 
// Module Name: D_flipflop_Sim
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


module D_flipflop_Sim();
reg clk;
reg rs;
reg D;
wire Q;
wire Q_bar;

D_flipflop dff1(clk, rs, D, Q, Q_bar);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #50
    rs = 0;
    D = 0;
    
    #50
    rs = 0;
    D = 1;
    
    #50
    rs = 1;
    D = 0;
    
    #50
    rs = 1;
    D = 1;

end
endmodule
