`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2023 09:40:58 AM
// Design Name: 
// Module Name: RISC_V_main
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


module RISC_V_main(
input clk_in,
input reset,
//output [31:0] x,
output [31:0] out
    );

//Setting intermodule connection wires  
wire clk; 
wire [31:0] Counterplus4_value;
wire [31:0] Counter_value;
wire [31:0] PC_input;
wire [31:0] ALU_result;
wire [31:0] Instruction_code;
wire [31:0] write_back;
wire [31:0] source_register1_data, source_register2_data, Register_4;
wire [31:0] Imm_gen_output;
wire [31:0] alu_input1, alu_input2;
wire [31:0] Data_mem_out;

//Control Unit wires
wire PC_sel;
wire [4:0] source_reg1_adr, source_reg2_adr, destination_reg_adr;
wire BrLT, Breq;
wire [19:0] Imm_gen_input;
wire [3:0] ALU_sel;
wire [2:0] Load_type;
wire [1:0] Store_type, WB_sel;
wire Reg_write_en, I_type_en, B_Sel, L_type_en, S_type_en, Mem_write_en, B_type_en, A_Sel, BrUn, PC_Sel, J_type_en, U_type_en;


//Module calling according to procedure

//Clock_divider CD1( clk_in, clk);
assign clk = clk_in;
MUX_2x1 pc_input_mux( Counterplus4_value, ALU_result, PC_sel, PC_input);

Program_Counter PC1( clk, reset, PC_input, Counter_value);

Program_Counter_ALU PCA1( Counter_value, Counterplus4_value);

Program_memory PM1( Counter_value, Instruction_code);

Control_Unit CU1( Instruction_code, BrLT, Breq, source_reg1_adr, source_reg2_adr, destination_reg_adr, Imm_gen_input,
                  ALU_sel, Load_type, Store_type, WB_sel, Reg_write_en, I_type_en, B_Sel, L_type_en,
                  S_type_en, Mem_write_en, B_type_en, A_Sel, BrUn, PC_Sel, J_type_en, U_type_en);

Register_file RF1( clk, write_back, source_reg1_adr, source_reg2_adr, destination_reg_adr,
                   Reg_write_en, source_register1_data, source_register2_data, Register_4);

Immediate_value_gen IMMG1( Imm_gen_input, I_type_en, L_type_en, S_type_en, B_type_en, J_type_en, U_type_en, Imm_gen_output);

MUX_2x1 alu_data1_sel( source_register1_data, Counter_value, A_Sel, alu_input1);
MUX_2x1 alu_data2_sel( source_register2_data, Imm_gen_output, B_Sel, alu_input2);

Arithematic_and_Logic_Unit ALU1( ALU_sel, alu_input1, alu_input2, ALU_result);

Branch_Comparator BC1( source_register1_data, source_register2_data, BrUn, BrLT, Breq);

Data_Memory DM1( clk, Mem_write_en, Load_type, Store_type, ALU_result, source_register2_data, Data_mem_out);

MUX_3x1 write_back_mux( Data_mem_out, ALU_result, Counterplus4_value, WB_sel, write_back);

// For Fibonacci sequence

assign out = Register_4;

endmodule
