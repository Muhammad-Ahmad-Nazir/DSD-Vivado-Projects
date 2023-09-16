//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 06/14/2023 12:34:31 PM
//// Design Name: 
//// Module Name: Debounce
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

//module DFF(clk,clk_slow,D,Q);
//input clk;
//input clk_slow;
//input D;
//output reg Q = 0;

//always @ (posedge clk)
//begin
//    if (clk_slow)
//        Q <= D;
//end

//endmodule


//module clock_divider(clk_in,clk_out_en);
//input clk_in;
//output reg clk_out_en;

//reg [26:0] counter = 0;

//always @ (posedge clk_in)
//begin
//    counter <= (counter >= 49)? 0 : counter+1;
//    clk_out_en <= (counter == 49)?1'b1:1'b0;
//end



//endmodule


//module Debounce(clk,b_in,b_out, slower_clock_en);
//input clk;
//input b_in;
//output b_out;

//output slower_clock_en; //built to same the FF from frequent switching
//wire S0, S1, S1_bar;

//clock_divider C1(clk, slower_clock_en);

//DFF d1(clk, slower_clock_en, b_in, S0);
//DFF d2(clk, slower_clock_en, S0, S1);

//assign S1_bar = ~S1;
//assign b_out = S0 & S1_bar;

//endmodule

module debounce_better_version(input pb_1,reset,clk,output pb_out, reg [3:0] counter);
wire slow_clk_en;
wire Q1,Q2,Q2_bar,Q0;
clock_enable u1(clk,slow_clk_en);
my_dff_en d0(clk,slow_clk_en,pb_1,Q0);

my_dff_en d1(clk,slow_clk_en,Q0,Q1);
my_dff_en d2(clk,slow_clk_en,Q1,Q2);
assign Q2_bar = ~Q2;
assign pb_out = Q1 & Q2_bar;

always@(*)
begin
    if (pb_out == 1'b1)
    begin
        counter = counter + 1'b1;
    end
    
    if (reset == 1'b1)
    begin
        counter = 4'b0000;
    end
end
endmodule
// Slow clock enable for debouncing button 
module clock_enable(input Clk_100M,output slow_clk_en);
    reg [26:0]counter=0;
    always @(posedge Clk_100M)
    begin
       counter <= (counter>=249999)?0:counter+1;
    end
    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
endmodule
// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(input DFF_CLOCK, clock_enable,D, output reg Q=0);
    always @ (posedge DFF_CLOCK) begin
  if(clock_enable==1) 
           Q <= D;
    end
endmodule 