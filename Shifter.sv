module Shifter(input logic [31:0] RD2, input logic [31:0] Rs,
						input logic[11:0] Src2,input logic Shift, 
					output logic[31:0] Shifted);
					
always_comb begin
if(Shift) begin
	if(~Src2[4]) begin
		case(Src2[6:5])
			2'b00:Shifted=RD2<<Src2[11:7];
			2'b01:Shifted=RD2>>Src2[11:7];
			default:Shifted=RD2<<Src2[11:7];
		endcase
	end else begin
		case(Src2[6:5])
			2'b00:Shifted=RD2<<Rs;
			2'b01:Shifted=RD2>>Rs;
			default:Shifted=RD2<<Rs;
		endcase
	end
end else begin
Shifted=RD2;
end
end
endmodule 