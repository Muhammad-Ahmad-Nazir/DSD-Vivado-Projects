`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2023 01:22:12 PM
// Design Name: 
// Module Name: Non_uniform_adder
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


module Non_uniform_adder(operand1, operand2, carry_in, sum, carry_out);
input [11:0] operand1;
input [11:0] operand2;
input carry_in;
output reg [11:0] sum = 0;
output reg carry_out = 0;

reg [2:0] sum_3bit;
reg carry_3bit;
reg [3:0] sum_4bit;
reg carry_4bit;
reg [4:0] sum_5bit;
reg carry_5bit;

reg cin = 1'b1;

reg [11:0] temp_sum;
//reg temp_carry;

reg [2:0] result_3adder_0;
reg carry_3adder_0;
reg [3:0] result_4adder_0;
reg carry_4adder_0;
reg [4:0] result_5adder_0;
reg carry_5adder_0;

reg [2:0] result_3adder_1;
reg carry_3adder_1;
reg [3:0] result_4adder_1;
reg carry_4adder_1;
reg [4:0] result_5adder_1;
reg carry_5adder_1;

reg cout_3bit;
reg cout_4bit;
reg cout_5bit;

always@(*)
begin
    assign {carry_3adder_0,result_3adder_0} = operand1[2:0] + operand2[2:0];
    assign {carry_4adder_0,result_4adder_0} = operand1[6:3] + operand2[6:3];
    assign {carry_5adder_0,result_5adder_0} = operand1[11:7] + operand2[11:7];
    
    assign {carry_3adder_1,result_3adder_1} = operand1[2:0] + operand2[2:0] + cin;
    assign {carry_4adder_1,result_4adder_1} = operand1[6:3] + operand2[6:3] + cin;
    assign {carry_5adder_1,result_5adder_1} = operand1[11:7] + operand2[11:7] + cin;
    
    case (carry_in)
    
    1'b0:
    begin
        temp_sum[2:0] = result_3adder_0;
        cout_3bit = carry_3adder_0;
    end
    1'b1:
    begin
        temp_sum[2:0] = result_3adder_1;
        cout_3bit = carry_3adder_1;
    end 
    endcase
    
    case (cout_3bit)
    
    1'b0:
    begin
        temp_sum[6:3] = result_4adder_0;
        cout_4bit = carry_4adder_0;
    end
    1'b1:
    begin
        temp_sum[6:3] = result_4adder_1;
        cout_4bit = carry_4adder_1;
    end 
    endcase
    
    case (cout_4bit)
    
    1'b0:
    begin
        temp_sum[11:7] = result_5adder_0;
        cout_5bit = carry_5adder_0;
    end
    1'b1:
    begin
        temp_sum[11:7] = result_5adder_1;
        cout_5bit = carry_5adder_1;
    end 
    endcase
    
    assign sum = temp_sum;
    assign carry_out = cout_5bit;
end

endmodule
