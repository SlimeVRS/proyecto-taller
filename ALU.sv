module ALU(input logic[31:0] SrcA, input logic[31:0] SrcB, input logic [2:0]ALUControl,output logic[3:0]ALUFlags, output logic[31:0] ALUResult );
ALUComponent ALUComponent(SrcA,SrcB,ALUControl, ALUFlags, ALUResult);
endmodule