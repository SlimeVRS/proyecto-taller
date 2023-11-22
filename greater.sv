module greater(input logic A,equals,previous, output logic out);
	// Negative
	wire B_greater,previous_greater;
	and isGreater(B_greater, ~equals, ~A);
	and isGreater2(previous_greater, equals, previous);
	or OUT(out,B_greater, previous_greater);

endmodule