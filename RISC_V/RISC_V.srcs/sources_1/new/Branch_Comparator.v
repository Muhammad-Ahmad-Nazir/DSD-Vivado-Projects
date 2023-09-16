`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 12:20:41 PM
// Design Name: 
// Module Name: Branch_Comparator
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


module Branch_Comparator(
input [31:0] source_register1,
input [31:0] source_register2,
input BrUn,
output reg BrLT,
output reg BrEq
    );


always@(*)
begin
	if (BrUn == 1)
	begin
		if ( source_register1 < source_register2)
		begin
			BrLT = 1;
			BrEq = 0;
		end
		
		else if ( source_register1 == source_register2)
		begin
			BrLT = 0;
			BrEq = 1;
		end
		
		else
		begin
			BrLT = 0;
			BrEq = 0;
		end
	end
	
	else
	begin
		if ( $signed(source_register1) < $signed(source_register2) )
		begin
			BrLT = 1;
			BrEq = 0;
		end
		
		else if ( source_register1 == source_register2)
		begin
			BrLT = 0;
			BrEq = 1;
		end
		
		else
		begin
			BrLT = 0;
			BrEq = 0;
		end
	end
end

endmodule
