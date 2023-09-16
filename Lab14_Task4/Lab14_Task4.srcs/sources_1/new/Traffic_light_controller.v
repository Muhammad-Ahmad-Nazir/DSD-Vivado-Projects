`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 02:45:31 PM
// Design Name: 
// Module Name: Traffic_light_controller
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


module Traffic_light_controller(
input clk,
input reset,
output reg [1:0] NS_signal,
output reg [1:0] EW_signal
    );
    
reg [2:0] state = 3'b000;
wire [2:0] next_state;
wire [1:0] temp_NS_signal;
wire [1:0] temp_EW_signal;

always@(posedge clk or posedge reset)
begin
    if (reset == 1)
    begin
        state = 3'b000;
    end
    
    else
    begin
        state = next_state;
        NS_signal = temp_NS_signal;
        EW_signal = temp_EW_signal;
    end
end

Traffic_light_ROM TL_ROM(state, next_state, temp_NS_signal, temp_EW_signal);
    
endmodule
