`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2023 03:04:11 PM
// Design Name: 
// Module Name: Adder_4_bit
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

//Addition module
module Adder(A,B,an,OV_S,OV_U);
input [3:0] A;
input [3:0] B;
output reg[3:0] an;
output reg OV_S;
output reg OV_U;

reg[4:0] sum;
wire [3:0] check;

//assign an = 4'b0000;
assign check = 4'b1111;

always@(*)
begin

sum = A + B;
//an = sum[3:0];

if ( $signed(sum) > $signed(check) )
begin
    OV_S = 1;
    OV_U = 0;
end
else
begin
    OV_S = 0;
    OV_U = 0;
end

if ( sum > check )
begin
    OV_S = 0;
    OV_U = 1;
end
else
begin
    OV_S = 0;
    OV_U = 0;
end
end

endmodule//end of adder module

////Display module
//module Seven_Segment_Display(sum,Seg);
//input sum;
//output reg [6:0] Seg;

//always@(*)
//begin 
//    case (sum)
    
//    4'd0:	Seg = 7'b0000001;
//    4'd1:	Seg = 7'b1001111;
////    4'd2:	Seg = 7'b0010010;
////    4'd3:	Seg = 7'b0000110;
////    4'd4:	Seg = 7'b1001100;
////    4'd5:	Seg = 7'b0100100;
////    4'd6:	Seg = 7'b0100000;
////    4'd7:	Seg = 7'b0001111;
////    4'd8:	Seg = 7'b0000000;
////    4'd9:	Seg = 7'b0000100;
//	endcase

//end

//endmodule// end of display module

module Seven_Segment_Display(clk1,reset,sum,an,Seg);
input clk1;
input reset;
input [3:0] sum;
output reg [3:0] an;
output reg [6:0] Seg;

reg [1:0] one_second_counter;
reg [3:0] number_to_display;

always @ (posedge clk1 or posedge reset)
begin
    if (reset == 1 || one_second_counter == 3 )
        one_second_counter <= 0;
    else
        one_second_counter <= one_second_counter + 1;
end

always@(*)
begin
    case(one_second_counter)
    
    2'b00:
    begin
        an = 4'b0111;
        number_to_display = 0;
    end
    
    2'b01:
    begin
        an = 4'b1011;
        number_to_display = 0;
    end
    
    2'b10:
    begin
        an = 4'b1101;
        number_to_display = sum/10;
    end
    
    2'b11:
    begin
        an = 4'b1110;
        number_to_display = sum%10;
    end
    
    endcase
end

always@(*)
begin 
    case (sum)
    
    4'd0:	Seg = 7'b0000001;
    4'd1:	Seg = 7'b1001111;
    4'd2:	Seg = 7'b0010010;
    4'd3:	Seg = 7'b0000110;
    4'd4:	Seg = 7'b1001100;
    4'd5:	Seg = 7'b0100100;
    4'd6:	Seg = 7'b0100000;
    4'd7:	Seg = 7'b0001111;
    4'd8:	Seg = 7'b0000000;
    4'd9:	Seg = 7'b0000100;
	endcase

end

endmodule


//Top-level module
module Adder_4_bit(A,B,an,Seg,OV_S,OV_U);
input [3:0] A;
input [3:0] B;
output [3:0] an;
output [6:0] Seg;
output OV_S;
output OV_U;

reg [3:0] sum;

Adder X1(A,B,an,OV_S,OV_U);

Seven_Segment_Display A1(clk1,reset,sum,an,Seg);

endmodule

