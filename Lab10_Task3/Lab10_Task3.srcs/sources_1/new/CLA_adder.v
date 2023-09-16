`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2023 02:18:57 PM
// Design Name: 
// Module Name: CLA_adder
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


module CLA_adder(operand1, operand2, carry_in, sum, carry_out);
input [3:0] operand1;
input [3:0] operand2;
input carry_in;
output reg [3:0] sum;
output reg carry_out;

reg [3:0] temp_sum;

reg [3:0] G_array;
reg [3:0] P_array;
reg [3:0] C_array;

always@(*)
begin
    C_array[0] = carry_in;
    G_array[0] = operand1[0] + operand2[0];
    P_array[0] = operand1[0] ^ operand2[0];
    temp_sum[0] = operand1[0] ^ operand2[0];
    
    C_array[1] = G_array[0] | (P_array[0] & C_array[0]);
    G_array[1] = operand1[1] + operand2[1];
    P_array[1] = operand1[1] ^ operand2[1];
    temp_sum[1] = operand1[1] ^ operand2[1];
    
    C_array[2] = G_array[1] | (P_array[1] & C_array[1]);
    G_array[2] = operand1[2] + operand2[2];
    P_array[2] = operand1[2] ^ operand2[2];
    temp_sum[2] = operand1[2] ^ operand2[2];
    
    C_array[3] = G_array[2] | (P_array[2] & C_array[2]);
    G_array[3] = operand1[3] + operand2[3];
    P_array[3] = operand1[3] ^ operand2[3];
    temp_sum[3] = operand1[3] ^ operand2[3];
    
    assign sum = operand1 + operand2 + carry_in;
    assign carry_out = G_array[3] | (P_array[3] & C_array[3]);
    
end
endmodule
