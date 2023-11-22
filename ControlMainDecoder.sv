module ControlMainDecoder(input logic [1:0]Op, input logic [5:0]Funct, 
									output logic Branch, output logic ALUOp, 
									output logic RegW, output logic MemW, output logic MemtoReg, output logic ALUSrc,output logic [1:0]ImmSrc, output logic [1:0]RegSrc, output logic Shift
);

assign MemtoReg=(Op[0]&Funct[0]);
assign MemW=(Op[0]&~Funct[0]);
assign Branch=Op[1];
assign ALUSrc=(Op[0]|Op[1]|Funct[5]);
assign ImmSrc=Op;
assign RegW=~((Op[0]&~Funct[0])|Op[1]);
assign RegSrc={Op[0],Op[1]};
assign ALUOp=~(Op[0]|Op[1]);
assign Shift=Op==0?~Funct[5]:Funct[5];
endmodule
