`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 10:01:33 AM
// Design Name: 
// Module Name: Time_shared_16x16_multiplier
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


module Time_shared_16x16_multiplier(
input clk,
input [15:0] multiplicand,
input [15:0] multiplier,
output reg [31:0] product
    );

reg [2:0] counter = 3'b100;
wire [7:0] multiplicand_sel;
wire [7:0] multiplier_sel;
wire [15:0] multiplication_result;
reg [15:0] product_reg1;
reg [15:0] product_reg2;
reg [15:0] product_reg3;
reg [15:0] product_reg4;

always@(posedge clk)
begin
    if ( counter > 4)
    begin
        counter = 2'b00;
    end
    
    else
    begin
        counter = counter + 1'b1;
    end    
end

MUX_2x1 M1(counter[0], multiplicand[15:8], multiplicand[7:0], multiplicand_sel);
MUX_2x1 M2(counter[1], multiplier[15:8], multiplier[7:0], multiplier_sel);

Multiplier_8x8 M8x8(multiplicand_sel, multiplier_sel,multiplication_result);

always@(*)
begin
case (counter)

    3'b000:
    begin
        product[7:0] = multiplication_result[7:0];
        product_reg1[15:0] = {8'b0000_0000, multiplication_result[15:8]};
    end
    
    3'b001:
    begin
        product_reg2 = multiplication_result;
    end
    
    3'b010:
    begin
        product_reg3 = multiplication_result + product_reg2+ product_reg1;
        product[15:8] = product_reg3[7:0];
    end
    
    3'b011:
    begin
        product[31:16] = multiplication_result + {8'b0 ,product_reg3[15:0]};
    end
    
    endcase
    
end
endmodule
