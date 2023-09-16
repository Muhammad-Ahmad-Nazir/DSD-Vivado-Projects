`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2023 01:15:26 AM
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
input [7:0] address,
output reg [7:0] data
    );

reg [7:0] Registers [255:0];

initial
begin
    Registers[0] = 8'b0000_0000;
    Registers[1] = 8'b0000_0001;
    Registers[2] = 8'b0000_0010;
    Registers[3] = 8'b0000_0011;
    Registers[4] = 8'b0000_0100;
    Registers[5] = 8'b0000_0101;
    Registers[6] = 8'b0000_0110;
    Registers[7] = 8'b0000_0111;
    Registers[8] = 8'b0000_1000;
    Registers[9] = 8'b0000_1001;
    Registers[10] = 8'b0000_1010;
    Registers[11] = 8'b0000_1011;
    Registers[12] = 8'b0000_1100;
    Registers[13] = 8'b0000_1101;
    Registers[14] = 8'b0000_1110;
    Registers[15] = 8'b0000_1111;
    Registers[16] = 8'b0001_0000;
    Registers[17] = 8'b0001_0001;
    Registers[18] = 8'b0001_0010;
    Registers[19] = 8'b0001_0011;
    Registers[20] = 8'b0001_0100;
    Registers[21] = 8'b0001_0101;
    Registers[22] = 8'b0001_0110;
    Registers[23] = 8'b0001_0111;
    Registers[24] = 8'b0001_1000;
    Registers[25] = 8'b0001_1001;
    Registers[26] = 8'b0001_1010;
    Registers[27] = 8'b0001_1011;
    Registers[28] = 8'b0001_1100;
    Registers[29] = 8'b0001_1101;
    Registers[30] = 8'b0001_1110;
    Registers[31] = 8'b0001_1111;
    Registers[32] = 8'b0010_0000;
    Registers[33] = 8'b0010_0001;
    Registers[34] = 8'b0010_0010;
    Registers[35] = 8'b0010_0011;
    Registers[36] = 8'b0010_0100;
    Registers[37] = 8'b0010_0101;
    Registers[38] = 8'b0010_0110;
    Registers[39] = 8'b0010_0111;
    Registers[40] = 8'b0010_1000;
    
end
    
always@(posedge clk)
begin
    data = Registers[address];
end

endmodule
