module Extend(input logic [23:0] Imm,
				  input logic [1:0] ImmSrc,
				  output logic [31:0] ExtImm);
				  
	always_comb begin
		case(ImmSrc)
			// 8-bit unsigned immediate
			2'b00: ExtImm = {24'b0, Imm[7:0]};
			// 12-bit unsigned immediate
			2'b01: ExtImm = {20'b0, Imm[11:0]};
			// 24-bit two's complement shifted branch
			2'b10: ExtImm = {{6{Imm[23]}}, Imm[23:0], 2'b00};
			default: ExtImm = 32'bx; // undefined
		endcase
	end
	
endmodule