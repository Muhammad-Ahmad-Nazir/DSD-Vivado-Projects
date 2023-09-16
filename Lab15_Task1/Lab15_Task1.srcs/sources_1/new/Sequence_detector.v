`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 04:31:44 PM
// Design Name: 
// Module Name: Sequence_detector
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


module Sequence_detector(
input clk,
input reset,
input data_in,
output reg yout
    );
    
parameter [3:0] S0 = 3'b000;
parameter [3:0] S1 = 3'b001;
parameter [3:0] S2 = 3'b010;
parameter [3:0] S3 = 3'b011;
parameter [3:0] S4 = 3'b100;
//parameter [3:0] S5 = 3'b101;
//parameter [3:0] S6 = 3'b110;
//parameter [3:0] S7 = 3'b111;

reg [2:0] state = 3'b000;
reg [2:0] next_state;

always@(posedge clk or posedge reset)
begin
    if ( reset == 1)
    begin
        state = 3'b000;
        //yout = 0;
    end
    
    else
    begin
        state = next_state;
    end
end

always@(state or data_in)
begin
    case (state)
    
    S0:
    begin
        if (data_in == 1)
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
        if (data_in == 1)
        begin
            next_state = S2;
        end
        
        else
        begin
            next_state = S0;
        end
    end
    
    S2:
    begin
        if (data_in == 1)
        begin
            next_state = S3;
        end
        
        else
        begin
            next_state = S0;
        end
    end
    
    S3:
    begin
        if (data_in == 1)
        begin
            next_state = S4;
        end
        
        else
        begin
            next_state = S0;
        end
    end
    
    S4:
    begin
        if (data_in == 1)
        begin
            next_state = S4;
        end
        
        else
        begin
            next_state = S0;
        end
    end 
    
    endcase
    
end

always@(state)
begin
    case (state)
    
    S0,S1,S1,S3:
    begin
        yout = 0;
    end
    
    S4:
    begin
        yout = 1;
    end
    
    endcase
end

endmodule
