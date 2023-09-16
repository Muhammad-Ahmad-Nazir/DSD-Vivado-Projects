`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 11:32:11 AM
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
//input clk,
input [2:0] state_current,
output reg [2:0] state_next,
output reg [2:0] data
    );
    
//States
parameter [2:0] S0 = 3'b000;
parameter [2:0] S1 = 3'b001;
parameter [2:0] S2 = 3'b010;
parameter [2:0] S3 = 3'b011;
parameter [2:0] S4 = 3'b100;
parameter [2:0] S5 = 3'b101;

//Data
reg [2:0] out_data0 = 3'b000;
reg [2:0] out_data1 = 3'b001;
reg [2:0] out_data2 = 3'b011;
reg [2:0] out_data3 = 3'b101;
reg [2:0] out_data4 = 3'b111;
reg [2:0] out_data5 = 3'b010;

always@(*)
begin
    case (state_current)
    
    S0:
    begin
        state_next = S1;
        data = out_data0;
    end
    
    S1:
    begin
        state_next = S2;
        data = out_data1;
    end
    
    S2:
    begin
        state_next = S3;
        data = out_data2;
    end
    
    S3:
    begin
        state_next = S4;
        data = out_data3;
    end
    
    S4:
    begin
        state_next = S5;
        data = out_data4;
    end
    
    S5:
    begin
        state_next = S0;
        data = out_data5;
    end
    
    endcase
    
end
endmodule
