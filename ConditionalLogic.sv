module ConditionalLogic(input logic clk,input logic[3:0] Cond, input logic [3:0]ALUFlags,input logic[1:0] FlagW, input logic PCS, input logic RegW, input logic MemW,input logic NoWrite,
								output logic PCSrc, output logic RegWrite, output logic MemWrite 
);
logic CondEx;
logic [1:0]FlagWrite;
logic [3:0]Flags;

assign PCSrc=CondEx&PCS;
assign RegWrite=CondEx&RegW&~NoWrite;
assign MemWrite=CondEx&MemW;

assign FlagWrite[0]=FlagW[0]&CondEx;
assign FlagWrite[1]=FlagW[1]&CondEx;

ConditionCheck ConditionCheck(Flags, Cond,
							 CondEx);


always_ff @(posedge clk) begin
Flags[3]=ALUFlags[3]&FlagWrite[1];
Flags[2]=ALUFlags[2]&FlagWrite[1];
Flags[0]=ALUFlags[0]&FlagWrite[0];
Flags[1]=ALUFlags[1]&FlagWrite[0];
end
endmodule
