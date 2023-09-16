`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2023 01:58:29 PM
// Design Name: 
// Module Name: Non_uniform_adder_Sim
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


module Non_uniform_adder_Sim();
reg [11:0] a;
reg [11:0] b;
reg cin;
wire [11:0] res;
wire cout;

Non_uniform_adder UA1(a, b, cin, res, cout);

initial
begin
    #200
    a = 12'd1000;
    b = 12'd1000;
    cin = 0;
    
    #200
    a = 12'd2000;
    b = 12'd3000;
    cin = 0;
    
    #200
    a = 12'd1000;
    b = 12'd1000;
    cin = 1;
    
    #200
    a = 12'd2000;
    b = 12'd3000;
    cin = 1;
end
endmodule


