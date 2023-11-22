module n_aritmetic_L_shift #(parameter N=8)(output logic C[N-1:0],input logic A[N-1:0]);
always_comb
begin
C[0]<=0;
C[N-2:1]<=A[N-3:0];
C[N-1]<=A[N-1];
end
endmodule