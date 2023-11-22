module n_logical_L_shift #(parameter N=8)(output logic C[N-1:0],input logic A[N-1:0]);
always_comb
begin
C[0]<=0;
C[N-1:1]<=A[N-2:0];
end
endmodule