`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 10:16:29 AM
// Design Name: 
// Module Name: Nested_Loop_Machine
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


module Nested_Loop_Machine(
input clk,
input reset,
input loop_instr,
input [7:0] program_counter,
input [7:0] end_address,
input [3:0] loop_count,
//input [7:0] start_address,

output reg loop_end_flag,
output reg loop_end_instr_flag,
output reg [7:0] next_address
    );
    
reg [7:0] start_address_stack [3:0];
reg [7:0] end_address_stack [3:0];
reg [7:0] selected_end_address;
reg [3:0] loop_count_stack [3:0];
reg [3:0] selected_loop_count;

reg push = 1'b0;
reg write_en = 1'b0;
reg [1:0] incremented;
reg [1:0] current;

reg [3:0] write_MUX = 4'b0000;
reg comparator_state = 1'b0;
reg [3:0] down_counter_value;
reg zero_check_state;
//reg temp_loop_end = 1'b0;


always@(posedge clk)
begin
    if ( reset == 1)
    begin
        start_address_stack[0] <= 8'b0000_0000;
        start_address_stack[1] <= 8'b0000_0000;
        start_address_stack[2] <= 8'b0000_0000;
        start_address_stack[3] <= 8'b0000_0000;
        
        end_address_stack[0] <= 8'b0000_0000;
        end_address_stack[1] <= 8'b0000_0000;
        end_address_stack[2] <= 8'b0000_0000;
        end_address_stack[3] <= 8'b0000_0000;
        
        loop_count_stack[0] <= 4'b0000;
        loop_count_stack[1] <= 4'b0000;
        loop_count_stack[2] <= 4'b0000;
        loop_count_stack[3] <= 4'b0000;
        
        incremented <= 2'b11;
        current <= 2'b00;
        push <= 1'b0;
        write_en <= 1'b0;
        loop_end_flag <= 1'b0;
        loop_end_instr_flag <= 1'b0;
        next_address <= 8'b0000_0000;
        zero_check_state <= 1'b0;
    end
    
    else
    begin
        // Stack pointer logic
        if ( loop_instr == 1'b1 )
        begin
            push <= 1'b1;
            write_en <= 1'b1;
        end
        
        else if ( loop_instr == 1'b0 )
        begin
            push <= 1'b0;
            write_en <= 1'b0;
        end
        else;
        
        if ( push == 1'b1 )
        begin
            incremented <= incremented + 2'b01;
        end
        
        else;
        
        if ( push == 1'b1 )
        begin
            current <= incremented;
        end
         
        if (loop_end_flag == 1'b1)
        begin
            current <= current - 1'b1;
        end
         
        // Writer Control
        case ( incremented )
        
        2'b00:
        begin
            write_MUX <= 4'b0001;
        end
        
        2'b01:
        begin
            write_MUX <= 4'b0010;
        end
        
        2'b10:
        begin
            write_MUX <= 4'b0100;
        end
        
        2'b11:
        begin
            write_MUX <= 4'b1000;
        end
        endcase
        
        //Checks which position to write the address on
        if ( write_MUX[0] == 1'b1 )
        begin
            start_address_stack[0] <= program_counter;
            end_address_stack[0] <= end_address;
            loop_count_stack[0] <= loop_count;
        end
        
        else if ( write_MUX[1] == 1'b1 )
        begin
            start_address_stack[1] <= program_counter;
            end_address_stack[1] <= end_address;
            loop_count_stack[1] <= loop_count;
        end
        
        else if ( write_MUX[2] == 1'b1 )
        begin
            start_address_stack[2] <= program_counter;
            end_address_stack[2] <= end_address;
            loop_count_stack[2] <= loop_count;
        end
        
        else if ( write_MUX[3] == 1'b1 )
        begin
            start_address_stack[3] <= program_counter;
            end_address_stack[3] <= end_address;
            loop_count_stack[3] <= loop_count;
        end
        
        else;
        
        //Sending out start and end addresses and loop count
        case ( current )
        
        2'b00:
        begin
            next_address = start_address_stack[0];
            selected_end_address = end_address_stack[0];
            selected_loop_count = loop_count_stack[0];
        end
        
        2'b01:
        begin
            next_address = start_address_stack[1];
            selected_end_address = end_address_stack[1];
            selected_loop_count = loop_count_stack[1];
        end
        
        2'b10:
        begin
            next_address = start_address_stack[2];
            selected_end_address = end_address_stack[2];
            selected_loop_count = loop_count_stack[2];
        end
        
        2'b11:
        begin
            next_address = start_address_stack[3];
            selected_end_address = end_address_stack[3];
            selected_loop_count = loop_count_stack[3];
        end
        endcase
        
        //Address comparator
        
        if ( program_counter == selected_end_address )
        begin
            comparator_state = 1'b1;
        end
        
        else
        begin
            comparator_state = 1'b0;
        end
        
        //Down counter
        
        if ( push == 1'b1 || loop_end_flag == 1'b1 )
        begin
            down_counter_value = selected_loop_count;
        end
        
        else
        begin
            down_counter_value = down_counter_value - 1'b1;
        end
        
        zero_check_state <= ~ ( down_counter_value[0] | down_counter_value[1] | down_counter_value[2] | down_counter_value[3]);
        
        loop_end_instr_flag <= comparator_state & ~(zero_check_state);
        loop_end_flag <= comparator_state & down_counter_value;
    
    end
end    
endmodule
