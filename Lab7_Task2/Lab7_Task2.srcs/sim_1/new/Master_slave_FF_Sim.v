`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 03:04:38 PM
// Design Name: 
// Module Name: Master_slave_FF_Sim
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


module Master_slave_FF_Sim();
reg clk;
reg D;
wire Q;
wire Q_bar;

Master_slave_FF MSFF1(clk, D, Q, Q_bar);

initial
begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial
begin
    #50
    D = 1;
    
    #50
    D = 0;
    
    #50
    D = 1;
    
    #50
    D = 1;
    
    #50
    D = 0;
    
    #50
    D = 0;
    
    #50
    D = 1;

end
endmodule
