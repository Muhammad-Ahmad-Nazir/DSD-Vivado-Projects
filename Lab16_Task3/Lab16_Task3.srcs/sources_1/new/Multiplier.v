`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2023 03:47:08 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
input clk,
input start,
input [3:0] multiplicand,
input [3:0] multiplier,
output reg [7:0] product = 8'b000000,
output reg done
    );
    
reg [3:0] accumulator;
reg [3:0] adder;
reg [3:0] multiplier_reg;
reg [3:0] shifter;
reg [2:0] counter;
reg multiplier_LSB;
reg shift_en;
reg add_en;


reg carry_in = 1'b0;
reg carry_out;
reg [7:0] temp_product = 8'b000000;


always@(posedge clk)
begin
    if ( start == 0 )
    begin
        accumulator = 4'b0000;
        multiplier_reg = 4'b0000;
        adder = 4'b0000;
        shifter = 4'b0000;
        counter = 3'b000;
        multiplier_LSB = 1'b0;
        shift_en = 1'b0;
        add_en = 1'b0;
        done = 1'b0;
        carry_out = 1'b0;
    end
    
    else if ( start == 1 && done == 0)
    begin
        if ( counter == 2'b00 )
        begin
            //accumulator = multiplicand;
            multiplier_reg = multiplier;
        end
        
        else;
        
        multiplier_LSB = multiplier_reg[0];
        
        if ( multiplier_LSB )
        begin
            add_en = 1;
            shift_en = 1;
            accumulator = multiplicand;
        end
        
        else
        begin
            add_en = 0;
            shift_en = 1;
            accumulator = 4'b0000;
        end
        
        if ( counter == 4 )//////////////////////////////////////////////
        begin
            done = 1;
        end
        else;
        
        if ( shift_en == 1)
        begin
            multiplier_reg = {1'b0, multiplier_reg[3:1]};
        end
        
        else;
        
        //Unsolved logic
        
        if (add_en == 1)
        begin
            case (counter)
            
            2'b00:
            begin
                {carry_out, adder} = temp_product[3:0] + accumulator + carry_in;
                temp_product[3:0] = adder;
                carry_in = carry_out;
            end
            
            2'b01:
            begin
                {carry_out, adder} = temp_product[4:1] + accumulator + carry_in;
                temp_product[4:1] = adder;
                carry_in = carry_out;
            end
            
            2'b10:
            begin
                {carry_out, adder} = temp_product[5:2] + accumulator + carry_in;
                temp_product[5:2] = adder;
                carry_in = carry_out;
            end
            
            2'b11:
            begin
                {carry_out, adder} = temp_product[6:3] + accumulator + carry_in;
                temp_product[7:3] = {carry_out, adder};
            end
            
            endcase 
        end
        else;
        
        add_en = 1'b0;
        product = temp_product;
       
       
    //Donot change 
    
        counter = counter + 1;   
    end
end

endmodule   
