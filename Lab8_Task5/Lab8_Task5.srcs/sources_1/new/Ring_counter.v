`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 04:48:04 PM
// Design Name: 
// Module Name: Ring_counter
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


module Ring_counter(clk, reset, c_out);
input clk;
input reset;
output [7:0] c_out;

reg [7:0] temp_count;
reg temp_shift_store;

always@(posedge clk or posedge reset)
begin
    if ( reset == 1)
    begin
        temp_count = 4'b00000001;
    end
    
    else
    begin
        temp_shift_store = temp_count[0];
        temp_count = temp_count >> 1;
        temp_count[7] = temp_shift_store;
    end
end
    
    assign c_out = temp_count;
    
endmodule
