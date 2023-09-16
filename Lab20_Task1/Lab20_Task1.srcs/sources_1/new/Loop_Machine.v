`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 04:41:28 PM
// Design Name: 
// Module Name: Loop_Machine
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


module Loop_Machine(
input clk,
input en_loop,
input [7:0] loop_start_address,
input [7:0] loop_end_address,
input [3:0] no_of_loops,
input [7:0] current_counter_value,

output reg loop_end_inst,
output reg loop_end_flag
    );
    
reg [7:0] loop_start_address_register = 8'b0000_0000;
reg [7:0] loop_end_address_register = 8'b0000_0000;
reg [3:0] loop_counter_register = 4'b0;
reg loop_end_addr_flag = 1'b0;
reg en = 1'b0;
reg load;
reg loop_inst = 1'b0;
reg loop_count_zero;
reg loop_end_inst_temp = 1'b1;
reg loop_end_flag_temp;
    
always@(posedge clk or posedge en_loop)
begin
    if ( en_loop == 1 || en_loop == 0 )
    begin
        if ( current_counter_value == loop_start_address && en_loop == 1)
        begin
            loop_inst = 1'b1;
        end
        
        else
        begin
            loop_inst = 1'b0;
        end
        
            loop_start_address_register = loop_start_address;
            loop_end_address_register = loop_end_address;
        
            case (loop_inst)
        
            1'b0:
            begin
                load = loop_counter_register - 1'b1;
            end
        
            1'b1:
            begin
                load = no_of_loops;
            end
            endcase
        
            en = en_loop | loop_end_addr_flag;
            if ( en == 1)
            begin
                loop_counter_register = load;
            end
//    end
    
//    else
//    begin
            if ( current_counter_value == loop_end_address_register)
            begin
                loop_end_addr_flag = 1'b1;
            end
        
            else
            begin
                loop_end_addr_flag = 1'b0;
            end
        
            loop_count_zero = ~( loop_counter_register | loop_counter_register );
        
            loop_end_inst_temp = loop_end_addr_flag & ~(loop_count_zero);
            loop_end_inst = loop_end_inst_temp;
            
            loop_end_flag_temp = loop_end_addr_flag & loop_count_zero;
            loop_end_flag = loop_end_flag_temp;
        
    end
end    
endmodule
