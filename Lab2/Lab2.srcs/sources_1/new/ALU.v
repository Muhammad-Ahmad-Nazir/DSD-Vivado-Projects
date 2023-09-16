`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 11:45:27 AM
// Design Name: 
// Module Name: ALU
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


//module Debounce(clk,b_in,b_out);
//input clk;
//input b_in;
//output b_out;

//wire slower_clock_en; //built to same the FF from frequent switching
//wire S0, S1, S1_bar;

//clock_divider C1(clk, slower_clock_en);

//DFF d1(clk, slower_clock_en, b_in, S0);
//DFF d2(clk, slower_clock_en, S0, S1);

//assign S1_bar = ~S1;
//assign b_out = S0 & S1_bar;

//endmodule

//module debounce_better_version(input pb_1,clk,output pb_out);
//wire slow_clk_en;
//wire Q1,Q2,Q2_bar,Q0;
//clock_enable u1(clk,slow_clk_en);
//my_dff_en d0(clk,slow_clk_en,pb_1,Q0);

//my_dff_en d1(clk,slow_clk_en,Q0,Q1);
//my_dff_en d2(clk,slow_clk_en,Q1,Q2);
//assign Q2_bar = ~Q2;
//assign pb_out = Q1 & Q2_bar;
//endmodule
//// Slow clock enable for debouncing button 
//module clock_enable(input Clk_100M,output slow_clk_en);
//    reg [26:0]counter=0;
//    always @(posedge Clk_100M)
//    begin
//       counter <= (counter>=249999)?0:counter+1;
//    end
//    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
//endmodule
//// D-flip-flop with clock enable signal for debouncing module 
//module my_dff_en(input DFF_CLOCK, clock_enable,D, output reg Q=0);
//    always @ (posedge DFF_CLOCK) begin
//  if(clock_enable==1) 
//           Q <= D;
//    end
//endmodule

module debouncing #(parameter threshold = 100000 )// set parameter thresehold to guage how long button pressed
(
input clk, //clock signal
input btn, //input button
output LED, //LED output. Light up when btn is pressed
output reg dbsig, //debounced signal to logic analyzer
output button_out1, //flip-flop1 signal to logic analyzer
output button_out2 //flip-flop2 signal to logic analyzer
//output reg [3:0] counter
    );
    
reg button_ff1 = 0; //button flip-flop for synchronization. Initialize it to 0
reg button_ff2 = 0; //button flip-flop for synchronization. Initialize it to 0
reg [20:0]count = 0; //20 bits count for increment & decrement when button is pressed or released. Initialize it to 0 

// First use two flip-flops to synchronize the button signal the "clk" clock domain

always @(posedge clk)
begin
button_ff1 <= btn;
button_ff2 <= button_ff1;
end

// When the push-button is pushed or released, we increment or decrement the counter
// The counter has to reach threshold before we decide that the push-button state has changed
always @(posedge clk) begin 
 if (button_ff2) //if button_ff2 is 1
 begin
    if (~&count)//if it isn't at the count limit. Make sure won't count up at the limit. First AND all count and then not the AND
        count <= count+1; // when btn pressed, count up
 end else begin
    if (|count)//if count has at least 1 in it. Make sure no subtraction when count is 0 
        count <= count-1; //when btn relesed, count down
 end
 if (count > threshold)//if the count is greater the threshold 
    dbsig <= 1; //debounced signal is 1
 else
    dbsig <= 0; //debounced signal is 0
end

assign LED = dbsig; // assign debounced signal to LED
assign button_out1 = button_ff1; //assign button_out1 to button_ff1
assign button_out2 = button_ff2; //assign button_out2 to button_ff2

//always@(posedge LED)
//begin  
//        counter = counter + 1'b1;
// end


endmodule


module ALU( clk, value1, value2, Btnl, Btnr, Btnu, Btnd, Btnc, result);
input clk;
input [3:0] value1;
input [3:0] value2;
input Btnl;
input Btnr;
input Btnu;
input Btnd;
input Btnc;
output reg [3:0] result = 0;

reg condition;
wire BTNL;
wire BTNR;
wire BTNU;
wire BTND;
wire BTNC;

wire null1;
wire null2;
wire null3;
wire null4, null5, null6, null7, null8, null9, null10, null11, null12, null13, null14, null15;
//debounce_better_version DB1(Btnl,clk,BNTL);
//debounce_better_version DB2(Btnr,clk,BTNR);
//debounce_better_version DB3(Btnu,clk,BTNU);
//debounce_better_version DB4(Btnd,clk,BTND);
//debounce_better_version DB5(Btnc,clk,BTNC);

debouncing DB1(clk, Btnl, BTNL, null1, null2, null3);
debouncing DB2(clk, Btnr, BTNR, null4, null5, null6);
debouncing DB3(clk, Btnu, BTNU, null7, null8, null9);
debouncing DB4(clk, Btnd, BTND, null10, null11, null12);
debouncing DB5(clk, Btnc, BTNC, null13, null14, null15);

always@(*)
begin
if (BTNL == 1'b1)
begin
    result = value1 + value2;
end

else if ( BTNR == 1'b1) //Subtract
begin
    result = value1 - value2;
end
    
else if ( BTNU == 1'b1) //Signed comparision
begin
    condition = ($signed(value1) < $signed(value2));
    
    if (condition == 1'b1)
    begin
        result = 4'b1111;
    end
    else
    begin
        result = 4'b0000;
    end 
end
    
else if ( BTND == 1'b1) //UnSigned comparision
begin
    condition = (value1 < value2);
    if (condition == 1)
    begin
        result = 4'b1111;
    end
    else
    begin
        result = 4'b0000;
    end
end

else if ( BTNC == 1'b1) //Barrel Shift - left logical
begin
    result = (value1 << value2);
end

else
begin
    result = result + 0;
end

end
endmodule
