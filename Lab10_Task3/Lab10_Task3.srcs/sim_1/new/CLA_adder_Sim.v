`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2023 12:43:54 AM
// Design Name: 
// Module Name: CLA_adder_Sim
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


module CLA_adder_Sim();
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] res;
wire cout;

CLA_adder CLAA1(a,b,cin,res,cout);

initial
begin
    #50
    a = 4'b1001;
    b = 4'b0011;
    cin = 0;
    
    #50
    a = 4'b1001;
    b = 4'b1001;
    cin = 0;
    
    #50
    a = 4'b1001;
    b = 4'b0011;
    cin = 1;

end
endmodule
