module ALUComponent #(parameter N=32)(input logic [N-1:0]A, input logic [N-1:0]B, input logic [2:0]Sel, 
													output logic [3:0] flag, output logic [N-1:0]Out);
	logic [N-1:0]Suma;
	logic [N-1:0]Resta;
	logic [3:0]flagSuma;
	logic [3:0]flagResta;
	
	//operaciones 
	//flags neg, zero, carry, overflow
	
	
	n_sumador_completo #(N) op000(flagSuma, Suma, A, B,0);
	//restadorNbit #(N) op001(Resta, flagResta, A, B);
	n_sumador_completo #(N) op001(flagResta, Resta, A, ~B, 1);
	

always_comb begin
	case(Sel)
	3'b000:begin
		Out=Suma;
		flag=flagSuma;
	end
	3'b001:begin
		Out=Resta;
		flag=	flagResta;
	end
	3'b010:begin
		Out=A&B;
		flag=0;
	end
	3'b011:begin
		Out=A|B;
		flag=0;
	end
	3'b100:begin
		Out=A*B;
		
		flag[0]=0; 		// overflow
		flag[1]=0; 		// carry
		if (Out==0) begin
			flag[2]=1; // zero
		end else begin
			flag[2]=0; // not zero
		end
		if(Out<0)begin
			flag[3]=1; // negativo
		end else begin
			flag[3]=0; // not negativo
		end
	end
	3'b101:begin
		Out=B;
		
		flag[0]=0;
		flag[1]=0;
		if (Out==0) begin
			flag[2]=0;
		end else begin
			flag[2]=1;
		end
		if(Out<0)begin
			flag[3]=1;
		end else begin
			flag[3]=0;
		end
	end

	default: begin
		Out=Suma;
		flag=flagSuma;
	end
	endcase
end
	
endmodule 