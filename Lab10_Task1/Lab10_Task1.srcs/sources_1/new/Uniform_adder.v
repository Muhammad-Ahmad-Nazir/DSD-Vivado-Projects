`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2023 11:09:01 AM
// Design Name: 
// Module Name: Uniform_adder
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


module Uniform_adder(operand1, operand2, carry_in, sum, carry_out);
input [11:0] operand1;
input [11:0] operand2;
input carry_in;
output reg [11:0] sum = 0;
output reg carry_out = 0;

reg carry = 1'b1;

reg [11:0] temp_sum;

reg [3:0] sum_0_1;
reg c_0_1;
reg [11:0] sum_0_2;
reg c_0_2;
reg [11:0] sum_0_3;
reg c_0_3;

reg [3:0] sum_1_1;
reg c_1_1;
reg [11:0] sum_1_2;
reg c_1_2;
reg [11:0] sum_1_3;
reg c_1_3;

reg carry_forward_3;
reg carry_forward_7;
reg carry_forward_11;

always@(*)
begin
    assign {c_0_1,sum_0_1} = operand1[3:0] + operand2[3:0];
    assign {c_0_2,sum_0_2} = operand1[7:4] + operand2[7:4];
    assign {c_0_3,sum_0_3} = operand1[11:8] + operand2[11:8];
    
    assign {c_1_1,sum_1_1} = operand1[3:0] + operand2[3:0] + carry;
    assign {c_1_2,sum_1_2} = operand1[7:4] + operand2[7:4] + carry;
    assign {c_1_3,sum_1_3} = operand1[11:8] + operand2[11:8] + carry;
    
    case (carry_in)
    1'b0:
    begin
        temp_sum[3:0] = sum_0_1;
        carry_forward_3 = c_0_1;
    end
    
    1'b1:
    begin
        temp_sum[3:0] = sum_1_1;
        carry_forward_3 = c_1_1;
    end
    endcase
    
    case (carry_forward_3)
    1'b0:
    begin
        temp_sum[7:4] = sum_0_2;
        carry_forward_7 = c_0_2;
    end
    
    1'b1:
    begin
        temp_sum[7:4] = sum_1_2;
        carry_forward_7 = c_1_2;
    end
    endcase
    
    case (carry_forward_7)
    1'b0:
    begin
        temp_sum[11:8] = sum_0_3;
        carry_forward_11 = c_0_3;
    end
    
    1'b1:
    begin
        temp_sum[11:8] = sum_1_3;
        carry_forward_11 = c_1_3;
    end
    endcase
    
    assign sum = temp_sum;
    assign carry_out = carry_forward_11;
    
end
endmodule
