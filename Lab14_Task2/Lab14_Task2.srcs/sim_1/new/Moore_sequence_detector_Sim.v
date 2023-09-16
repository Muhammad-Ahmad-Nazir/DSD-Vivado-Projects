`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 12:10:47 AM
// Design Name: 
// Module Name: Moore_sequence_detector_Sim
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


module Moore_sequence_detector_Sim();
reg clk;
reg rs;
reg [1:0] in;
wire out;

Moore_sequence_detector MSD(clk,rs,in,out);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial 
begin
    #10
    rs = 1;
    
    #10
    rs = 0;
    
    #10
    in = 2'b00;
    
    #10
    in = 2'b10;
    
    #10
    in = 2'b00;
    
    #10
    in = 2'b01;
    
    #10
    in = 2'b00;
    
    #10
    in = 2'b11;
    
    #10
    in = 2'b00;

end
endmodule
