module sumador_1_bit(input logic carry_in, A,B,output logic S, carry_on);
wire AB,AC,BC;
xor salida(S,A,B,carry_in);
and and_AB(AB,A,B),and_AC(AC,A,carry_in),and_BC(BC,B,carry_in);
or or_carry(carry_on,AB,AC,BC);
endmodule