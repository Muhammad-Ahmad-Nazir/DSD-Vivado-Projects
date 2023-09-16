`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 02:43:41 PM
// Design Name: 
// Module Name: D_flipflop
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


module D_flipflop(clk, reset, input_state, output_state);//, output_state_bar);
input clk;
input reset;
input input_state;
output reg output_state;
// reg output_state_bar;

always@(posedge clk)
begin
    if (reset)    //reset has been set for active-high enable
    begin
        output_state = 0;
        //output_state_bar = 1;
    end
    
    else
    begin
        output_state = input_state;
        //output_state_bar = ~input_state;
    end
    
end
endmodule

