module nlRshift #(parameter N=8)(output logic C[N-1:0], 
										   input logic A[N-1:0]);
always_comb
	begin
		C[N-1]<=0;
		C[N-2:0]<=A[N-1:1];
	end
endmodule