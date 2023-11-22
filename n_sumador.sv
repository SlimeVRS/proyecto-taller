module n_sumador_completo #(parameter N=8)(output logic [3:0]flag,
 output logic [N-1:0]C,
 input logic [N-1:0]A,
 input logic[N-1:0]B,
 input logic c_in);
logic carry_out[N-1:0];
logic carry_in[N-1:0];
sumador_1_bit op[N-1:0](carry_in,A,B,C,carry_out);

wire overflow[1:0];
and overflow_and(overflow[0],~A[N-1], ~B[N-1], C[N-1]),overflowand2(overflow[1],A[N-1], B[N-1], ~C[N-1]); 
or overflow_or(flag[0],overflow[1],overflow[0] );

always_comb
begin
carry_in[0]<=c_in;
carry_in[N-1:1]<=carry_out[N-2:0];
flag[1]<=carry_out[N-1];//NZCV
flag[3]<=0;
flag[2]<=0;
end
endmodule