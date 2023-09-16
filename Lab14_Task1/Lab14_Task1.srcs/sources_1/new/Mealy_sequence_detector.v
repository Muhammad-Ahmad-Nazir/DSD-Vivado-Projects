`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 02:53:49 PM
// Design Name: 
// Module Name: Mealy_sequence_detector
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


module Mealy_sequence_detector(
input clk,
input reset,
input ain,
output reg [3:0] count = 4'b0000,
output reg yout
    );
    
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;
reg [1:0] state;
reg [1:0] next_state;

reg [3:0] next_count = 4'b000;


always@(posedge clk or posedge reset)
begin
    if (reset == 1)
    begin
        state = 1'b0;
        count = 4'b0000;
    end
    
    else
    begin
        state = next_state;
        count = next_count;
        
    end
end

always@(posedge clk)
begin
    if (ain == 1)
    begin
        next_count = next_count + 1'b1;
    end
end

always@(state or ain)
begin
    case (state)
    
    S0:
    begin
        if (ain == 1'b1)
        begin
            next_state = S1;
        end
        else
        begin
            next_state = S0;
        end
    end
    
    S1:
    begin
        if (ain == 1'b1)
        begin
            next_state = S2;
        end
        else
        begin
            next_state = S1;
        end
    end
    
    S2:
    begin
        if (ain == 1'b1)
        begin
            next_state = S3;
        end
        else
        begin
            next_state = S2;
        end
    end
    
    S3:
    begin
        if (ain == 1'b1)
        begin
            next_state = S1;
        end
        else
        begin
            next_state = S3;
        end
    end
    
    default:
    begin
        next_state = next_state;
    end
    
    endcase
    
end

always@(state or ain)
begin
    case (state)
    
        S0:
        begin
            yout = 1'b0;
        end
        
        S1:
        begin
            yout = 1'b0;
        end
        
        S2:
        begin
            yout = 1'b0;
        end
        
        S3:
        begin
            yout = 1'b1;
        end
        
        default:
        begin
            yout = 1'b0;
        end
     
     endcase
end
endmodule
