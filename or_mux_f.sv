module or_mux_f(output logic flags,input logic muxf1000,muxf1001,muxf1010,muxf1011,muxf1100,muxf1101);
	or or_mux_flags(flags,muxf1000,muxf1001,muxf1010,muxf1011,muxf1100,muxf1101);
endmodule