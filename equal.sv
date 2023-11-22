module equal(input logic A,B, previous, output logic out);
	wire  AB_equal;
	xor notequals(AB_equal, A, B);
	and OUT(out, ~AB_equal,previous);
endmodule