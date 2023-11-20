module nfulladder #(parameter N=8)(output logic flag[3:0], C[N-1:0],
											  input logic A[N-1:0],B[N-1:0]);

	logic  carry_out[N-1:0];
	logic carry_in[N-1:0];
	1bitadder op[N-1:0](carry_in,A,B,C,carry_out);

	wire overflow[1:0];
	and overflow_and(overflow[0],~A[N-1], ~B[N-1], C[N-1]),overflowand2(overflow[1],A[N-1], B[N-1], ~C[N-1]); 
	or overflow_or(flag[0],overflow[1],overflow[0] );

	always_comb
		begin
			carry_in[0]<=0;
			carry_in[N-1:1]<=carry_out[N-2:0];
			flag[1]<=carry_out[N-1];//NZCV

		end
endmodule