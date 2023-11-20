module ALUDecoder(input logic ALUOp, 
						input logic [4:0]Funct,
						input logic[11:0]Src2,
						output logic [2:0]ALUControl, 
						output logic [1:0]FlagW, 
						output logic NoWrite);
						
always_comb begin

if(ALUOp) begin
//COnd tipo inmediato cmd S
case(Funct[4:1])
 4'b0000:begin 
	if(Src2[7:4]==4'b1001) begin
			ALUControl=3'b100;//MUL 1110 00 00 000 0 0001 0000 0001 1001 0011 => mult r1,r3
			FlagW={1'b1,Funct[0]};
			NoWrite=0;
	end else begin
	 		ALUControl=3'b010;//AND 1110 00 0 0000 0 0001 0001 0000 0000 0010
			FlagW={Funct[0],1'b0};
			NoWrite=0;
	end

 end

 4'b0100:begin//ADD	
		ALUControl=3'b000;
		FlagW={Funct[0],Funct[0]};
		NoWrite=0;
 end
 4'b0010:begin//SUB
 		ALUControl=3'b001;
		FlagW={Funct[0],Funct[0]};
		NoWrite=0;
 end
 4'b1100:begin//OR
 		ALUControl=3'b011;
		FlagW={Funct[0],1'b0};
		NoWrite=0;
 end
 
 4'b1010:begin//CMP
 		ALUControl=3'b001;
		FlagW=2'b00;
		NoWrite=1;
 end
 4'b1101:begin//1110 00 0 1101 0 0000 0001 01000 01 0 0001 =>SLR r1,8=>Mov r1,[r1,8]
 		ALUControl=3'b101;
		FlagW=2'b11;
		NoWrite=0;
 end
 
 default: begin 
				ALUControl=3'b00;
				FlagW=2'b00;
				NoWrite=0;
			 end
endcase
end else begin
ALUControl=3'b000;
FlagW=2'b00;
NoWrite=1;
end

end
endmodule