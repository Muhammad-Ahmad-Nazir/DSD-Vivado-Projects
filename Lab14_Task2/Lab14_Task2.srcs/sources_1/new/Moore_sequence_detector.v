`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 04:35:36 PM
// Design Name: 
// Module Name: Moore_sequence_detector
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


module Moore_sequence_detector(
input clk,
input reset,
input [1:0] ain,
output reg yout
    );
    
reg [2:0] state;
reg [2:0] next_state = 3'b000;

parameter [2:0] S0 = 3'b000;
parameter [2:0] S1 = 3'b001;
parameter [2:0] S2 = 3'b010;
parameter [2:0] S3 = 3'b011;
parameter [2:0] S4 = 3'b100;
parameter [2:0] S5 = 3'b101;
parameter [2:0] S6 = 3'b110;

always@(posedge clk or posedge reset)
begin
    if (reset == 1)
    begin
        state <= 3'b000;
        //next_state <= 3'b000;
    end
    
    else
    begin
        state <= next_state;
    end
end

always@(state or ain)
begin
    case (state)
    
    S0:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S0;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S1:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S2;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S2:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S0;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S3:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S4;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S4:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S0;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S5:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S6;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    S6:
    begin
        if ( ain == 2'b00)
        begin
            next_state = S0;
        end
        
        else if ( ain == 2'b01)
        begin
            next_state = S1;
        end
        
        else if ( ain == 2'b10)
        begin
            next_state = S3;
        end
        
        else if ( ain == 2'b11)
        begin
            next_state = S5;
        end
    end
    
    endcase
end

always@(state)
begin
    case (state)
    
    S0:
    begin
        yout = yout;
    end
    
    S1:
    begin
        yout = yout;
    end
    
    S2:
    begin
        yout = 0;
    end
    
    S3:
    begin
        yout = yout;
    end
    
    S4:
    begin
        yout = ~yout;
    end
    
    S5:
    begin
        yout = yout;
    end
    
    S6:
    begin
        yout = 1;
    end
    
    endcase
end
endmodule
