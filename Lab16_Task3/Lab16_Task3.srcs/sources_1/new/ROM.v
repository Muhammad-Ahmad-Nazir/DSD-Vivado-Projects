`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2023 03:47:24 PM
// Design Name: 
// Module Name: ROM
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


module ROM(
input clk,
input [4:0] address,
output reg [3:0] data = 4'b0000
    );

reg [3:0] Registers[31:0];

initial
begin
    //Multiplicand
    Registers[0] = 4'b0000;
    Registers[1] = 4'b0001;
    Registers[2] = 4'b0010;
    Registers[3] = 4'b0011;
    
    Registers[4] = 4'b0100;
    Registers[5] = 4'b0101;
    Registers[6] = 4'b0110;
    Registers[7] = 4'b0111;
    
    Registers[8] = 4'b1000;
    Registers[9] = 4'b1001;
    Registers[10] = 4'b1010;
    Registers[11] = 4'b1011;
    
    Registers[12] = 4'b1100;
    Registers[13] = 4'b1101;
    Registers[14] = 4'b1110;
    Registers[15] = 4'b1111;
    
    //Multiplier
    Registers[16] = 4'b0000;
    Registers[17] = 4'b0001;
    Registers[18] = 4'b0010;
    Registers[19] = 4'b0011;
    
    Registers[20] = 4'b0100;
    Registers[21] = 4'b0101;
    Registers[22] = 4'b0110;
    Registers[23] = 4'b0111;
    
    Registers[24] = 4'b1000;
    Registers[25] = 4'b1001;
    Registers[26] = 4'b1010;
    Registers[27] = 4'b1011;
    
    Registers[28] = 4'b1100;
    Registers[29] = 4'b1101;
    Registers[30] = 4'b1110;
    Registers[31] = 4'b1111;
end

always@(posedge clk)
begin
    data = Registers[address];
end

endmodule
