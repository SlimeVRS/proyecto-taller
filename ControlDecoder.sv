module ControlDecoder(input logic[1:0] Op ,input logic [5:0]Funct, input logic [3:0]Rd,input logic[11:0] Src2,
					output logic[1:0] FlagW, output logic PCS, output logic RegW, output logic MemW,
					output logic MemtoReg, output logic ALUSrc, output logic [1:0]ImmSrc, output logic [1:0]RegSrc, 
					output logic[2:0] ALUControl, output logic NoWrite, output logic Shift
);

PCLogic PCLogic(Rd, Branch, RegW, 
					PCS);

ControlMainDecoder ControlMainDecoder(Op, Funct, 
									Branch, ALUOp, 
									RegW, MemW, MemtoReg, ALUSrc,ImmSrc, RegSrc, Shift);

ALUDecoder ALUDecoder( ALUOp, Funct,Src2,
							ALUControl, FlagW, NoWrite);


endmodule