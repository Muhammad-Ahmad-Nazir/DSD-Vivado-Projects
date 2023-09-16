`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2023 07:54:09 PM
// Design Name: 
// Module Name: Shift_add_multiplication
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


module Shift_add_multiplication(
input clk,
input [3:0] multiplicand,
input [3:0] multiplier,
output reg  [7:0] product
    );

reg shift_control = 1'b1;
reg [7:0] temp_multiplicand;    
reg [3:0] temp_multiplier;
reg [7:0] temp_product = 0;
reg ALU_control;
reg multiplier_check;


always@(posedge clk)//posedge clk
begin
    temp_multiplicand = {4'b0,multiplicand};
    temp_multiplier = multiplier;
    
    multiplier_check = temp_multiplier[3] | temp_multiplier[2] | temp_multiplier[1] |temp_multiplier[0];
    
    if ( multiplier_check != 0)
    begin
        ALU_control = temp_multiplier[0];
        
        if(ALU_control == 1)
        begin
            temp_product = temp_product + temp_multiplicand;
        end
        
        temp_multiplicand = temp_multiplicand << shift_control;
        temp_multiplier = temp_multiplier >> shift_control;
        
        product <= temp_product;
    end
    
    
    
end
endmodule
