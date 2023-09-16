`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 10:23:06 AM
// Design Name: 
// Module Name: Mealy_FSM_ROM
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


module Mealy_FSM_ROM(
input clk,
input reset,
output reg [2:0] count
    );

reg [2:0] state = 3'b000;
wire [2:0] next_state = 3'b000;

wire [2:0] temp_count = 3'b000;
//wire [2:0] temp_ns;
    
always@(posedge clk or reset)
begin
    if ( reset == 1)
    begin
        state = 3'b000;
        //next_state = 3'b000;
    end
    
    else
    begin
        state = next_state;
        count = temp_count;
    end
end

ROM R1(state, next_state, temp_count);

endmodule
