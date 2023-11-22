`timescale 1 ps / 1 ps
module Logic_data_manipulation_test_bench();


//=======================================================
//  REG/WIRE declarations
//=======================================================

logic clk;
logic clk2;
assign clk2=0;
logic rst;
logic[31:0] Result;

//PC
 logic [31:0]PCin;
 logic  [31:0]PCout;
 logic [31:0]PCPlus4;
 assign PCPlus4=PCout+4;
 logic [31:0]PCPlus8;
 assign PCPlus8=PCPlus4+4;
 
//ROM_WIRES
 logic[31:0] instr;

//Instruction_Wires;
 logic[3:0] RDI1;
 assign RDI1=instr[19:16];
 logic[3:0] RDI2;
 assign RDI2=instr[3:0];
 logic[3:0] RDI3;
 assign RDI3=instr[15:12];
 logic[23:0] Imm;
 assign Imm=instr[23:0];
 logic[3:0] Cond;
 assign Cond=instr[31:28];
 logic[1:0] Op;
 assign Op=instr[27:26];
 logic [5:0]Funct;
 assign Funct=instr[25:20];
 logic [3:0]Rd;
 assign Rd=instr[15:12];
 logic [11:0]Src2;
 assign Src2=instr[11:0];
 
//Data_Memory_WIRES
 logic[31:0] ReadData;

//Extend_wires
 logic[31:0] ExtImm;

//CPUWIRES
 logic[3:0] RA1;
 logic[3:0] RA2;
 
 logic[31:0] RD1; 
 logic[31:0] RD2; 
 
//Control_unit_WIRES
 logic [1:0]REGSrc;
 logic RegWrite;
 logic ALUSrc;
 logic MemWrite;
 logic MemtoReg;
 logic[1:0] ImmSrc;
 logic PCSrc;
 logic[2:0] ALUControl;
 logic[3:0] ALUflags;
 
 
//ALU_WIRES 
 logic[31:0] ALUResult;
 
//Shifter_WIRES
 logic[31:0] Shifted;
 
//MUXes
 logic[31:0] SrcB;
//=======================================================
//  Structural coding
//=======================================================
PC PC(clk, PCin, PCout);



InstructionMemory InstructionMemory(
	PCout,
	clk2,
	instr);
	
DataMemory DataMemory(
	ALUResult,
	clk2,
	RD2,
	MemWrite,
	ReadData);
	
Extend Extend(Imm, ImmSrc,
		ExtImm);
	
RegisterFile RF(clk,rst, RA1, RA2, RDI3, Result, PCPlus8, RegWrite,
	RD1, RD2);
	
ALU ALU(RD1, SrcB,ALUControl,ALUflags, ALUResult);
 
ControlUnit ControlUnit(clk, Cond, Op, Funct, Rd, ALUflags,Src2,
			  PCSrc, MemtoReg, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite,REGSrc,Shift
 );

shifter shifter(RD2, RD1,
					Src2,Shift, 
					 Shifted);
 
MUX1_2_4 inst_RA1(
	RDI1,
	15,
	REGSrc[0],
	RA1);
	
	
MUX1_2_4 inst_RA2(
	RDI2,
	RDI3,
	REGSrc[1],
	RA2);

MUX1_2_32 Shifted_SrcB(
	Shifted,
	ExtImm,
	ALUSrc,
	SrcB
);

MUX1_2_32 ReadData_Result(
	ALUResult,
	ReadData,
	MemtoReg,
	Result
);

MUX1_2_32 Result_PC(
	Result,
	PCPlus4,
	PCSrc,
	PCin
);


//=======================================================
//  Test Bench conditions
//=======================================================
initial begin
ALUResult=0;
rst=0;
clk=1;
#20
//check add and mov
instr='hE3A01003;//mov r1,3
clk=0;
#20
clk=1;
#20
instr='hE2811000;//add r1,0
clk=0;
#20
clk=1;
#20


if (ALUResult!=3) begin
 $display(" first set of instruction failed");
end


//check sub and negatives
instr='hE3A02002;//mov r2,4
clk=0;
#20
clk=1;
#20
instr='hE0411002;//sub r1,r2//1110 00 0 0010 0 0001 0001 00000 00 0 0010
clk=0;
#20
clk=1;
#20


if (ALUResult!=-1) begin
 $display(" Second set of instruction failed");
end

end

endmodule 