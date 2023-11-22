module restador1bit(output logic restaOut, c_out, input logic A, B,c_in ); 

	wire xor_cable_input,not_A,and_cable_input, not_xor_cable_input,and_cable_out;
	
	xor xor_input(xor_cable_input, A,B),xor_out(restaOut,xor_cable_input,c_in);
	not n_A(not_A,A),n_x_i(not_xor_cable_input,xor_cable_input);
	and and_input(and_cable_input, not_A, B), and_out(and_cable_out,not_xor_cable_input,c_in);
	or or_out(c_out,and_cable_out, and_cable_input );
						  
endmodule