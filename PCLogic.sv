module PCLogic( input logic[3:0] Rd, input logic Branch, input logic RegW, 
						output logic PCS
);
assign PCS=((Rd==15)&RegW)|Branch;
endmodule
