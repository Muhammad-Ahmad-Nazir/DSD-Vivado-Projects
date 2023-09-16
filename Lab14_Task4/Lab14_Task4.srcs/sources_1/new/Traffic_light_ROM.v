`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 02:50:50 PM
// Design Name: 
// Module Name: Traffic_light_ROM
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


module Traffic_light_ROM(
input [2:0] state_current,
output reg [2:0] state_next,
output reg [1:0] signal_1,
output reg [1:0] signal_2
    );
    
//States
parameter [2:0] S0 = 3'b000;
parameter [2:0] S1 = 3'b001;
parameter [2:0] S2 = 3'b010;
parameter [2:0] S3 = 3'b011;
parameter [2:0] S4 = 3'b100;
parameter [2:0] S5 = 3'b101;
parameter [2:0] S6 = 3'b110;
parameter [2:0] S7 = 3'b111;

//Data
reg [1:0] Green = 2'b00;
reg [1:0] Yellow = 2'b01;
reg [1:0] Red = 2'b10;

always@(*)
begin
    case (state_current)
    
    S0:
    begin
        state_next = S1;
        signal_1 = Green;
        signal_2 = Red;
    end
    
    S1:
    begin
        state_next = S2;
        signal_1 = Green;
        signal_2 = Red;
    end
    
    S2:
    begin
        state_next = S3;
        signal_1 = Yellow;
        signal_2 = Red;
    end
    
    S3:
    begin
        state_next = S4;
        signal_1 = Red;
        signal_2 = Yellow;
    end
    
    S4:
    begin
        state_next = S5;
        signal_1 = Red;
        signal_2 = Green;
    end
    
    S5:
    begin
        state_next = S6;
        signal_1 = Red;
        signal_2 = Green;
    end
    
    S6:
    begin
        state_next = S0;
        signal_1 = Yellow;
        signal_2 = Yellow;
    end
    
    S7:
    begin
        state_next = S0;
        signal_1 = Yellow;
        signal_2 = Yellow;
    end
    
    endcase
end    
endmodule
