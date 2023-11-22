`timescale 1 ps / 1 ps


module Shifter_tb;
	// Inputs
	logic [31:0] RD2; 
	logic [31:0] Rs;
	logic[11:0] Src2;
	logic Shift; 
	// Output
	logic[31:0] Shifted;
	
	Shifter  dut(.RD2(RD2), .Rs(Rs),
					.Src2(Src2),.Shift(Shift), 
					.Shifted(Shifted));
					
	initial begin
		// Inicializar señales de entrada
		 RD2 = 32'hABCDE;
		 Rs = 32'h54321;
		 Src2 = 12'h123;
		 Shift = 1'b1;
		 #10
		 
		 $display("RD2=%h, Rs=%h, Src2=%h, Shift=%b, Shifted=%h", RD2, Rs, Src2, Shift, Shifted);
	
	end
endmodule