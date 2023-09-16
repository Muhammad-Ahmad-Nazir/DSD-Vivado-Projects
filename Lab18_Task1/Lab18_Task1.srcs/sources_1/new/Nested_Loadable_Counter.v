`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2023 01:27:36 AM
// Design Name: 
// Module Name: Nested_Loadable_Counter
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


module Nested_Loadable_Counter(
input clk,
input reset,
input [1:0] condition_select,
input [7:0] branch_address,
input [7:0] second_address,
input condition_0,
input condition_1,
input [7:0] subroutine_return_address,
input polarity,
input [1:0] next_address_select,
output reg [7:0] counter_out
    );
    
reg [7:0] uPC_register = 8'b0000_0000;
reg condition_MUX_out;
reg normal_execution = 1'b0;
reg unconditional_jump = 1'b0;
reg xor_result;
reg [1:0] final_address_select = 2'b00;


// Block for full counter working
always@(posedge clk or posedge reset)
begin
    if ( reset == 1 || uPC_register == 8'b1111_1111 )
    begin
        uPC_register = 8'b0000_0000;
    end
 
    else
    begin
        //MUX for conditional selection
        case ( condition_select )
        
        2'b00:
        begin
            normal_execution = 1'b1;
            unconditional_jump = 1'b0;
            condition_MUX_out = normal_execution;
        end
        2'b01:
        begin
            normal_execution = 1'b0;
            unconditional_jump = 1'b0;
            condition_MUX_out = condition_0;
        end
        2'b10:
        begin
            normal_execution = 1'b0;
            unconditional_jump = 1'b0;
            condition_MUX_out = condition_1;
        end
        2'b11:
        begin
            normal_execution = 1'b0;
            unconditional_jump = 1'b1;
            condition_MUX_out = unconditional_jump;
        end
        endcase
        
        //Place Next Address Logic here.
        xor_result = condition_MUX_out ^ polarity;
        
        if ( xor_result == 1 && next_address_select == 2'b00)
        begin
            final_address_select = 2'b00;
        end
        
        else if ( xor_result == 1 && next_address_select == 2'b01)
        begin
            final_address_select = 2'b01;
        end
        
        else if ( xor_result == 1 && next_address_select == 2'b10)
        begin
            final_address_select = 2'b10;
        end
        
        else if ( xor_result == 1 && next_address_select == 2'b11)
        begin
            final_address_select = 2'b11;
        end
        
        else;
        
        // MUX for the selecting out-going counter value
        case (final_address_select)
        
        2'b00:
        begin
            counter_out = uPC_register;
        end
        2'b01:
        begin
            counter_out = subroutine_return_address;
        end
        2'b10:
        begin
            counter_out = second_address;
        end
        2'b11:
        begin
            counter_out = branch_address;
        end
        endcase
        
        
        //Adder for updating uPC_Register
        uPC_register = counter_out + 8'b0000_0001;
        
    end

end    
    
endmodule
