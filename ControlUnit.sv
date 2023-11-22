module ControlUnit(input logic clk, input logic[3:0]Cond, input logic[1:0]Op, input logic[5:0] Funct, input logic[3:0]Rd, input logic[3:0] flags,input logic[11:0] Src2,
						output logic PCSrc, output logic MemtoReg, output logic MemWrite, output logic [2:0]ALUControl, output logic ALUSrc, output logic [1:0]ImmSrc, output logic RegWrite, output logic [1:0]REGSrc, output logic Shift
 );

 ConditionalLogic ConditionalLogic(xlk, Cond, flags,FlagW, PCS, RegW, MemW,NoWrite,
								PCSrc, RegWrite, MemWrite);
 
 ControlDecoder ControlDecoder( Op ,Funct, Rd,Src2,
					FlagW, PCS, RegW, MemW,
					MemtoReg, ALUSrc, ImmSrc, REGSrc, ALUControl, NoWrite, Shift
);

endmodule
