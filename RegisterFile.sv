module RegisterFile( input logic clk, input logic rst,
	input logic[3:0] A1,input logic[3:0] A2,input logic[3:0] A3,input logic[31:0] WD3,  
	input logic[31:0] R15, input logic WE3,
	output logic[31:0] RD1, output logic[31:0] RD2);

	

reg [31:0]r0;
reg [31:0]r1;
reg [31:0]r2;
reg [31:0]r3;
reg [31:0]r4;
reg [31:0]r5;
reg [31:0]r6;
reg [31:0]r7;
reg [31:0]r8;
reg [31:0]r9;
reg [31:0]r10;
reg [31:0]r11;
reg [31:0]r12;
reg [31:0]r13;
reg [31:0]r14;
reg [31:0]r15;
	
always_ff @(posedge clk) begin

case(A1)
 0:RD1=r0;
 1:RD1<=r1;
 2:RD1<=r2;
 3:RD1<=r3;
 4:RD1<=r4;
 5:RD1<=r5;
 6:RD1<=r6;
 7:RD1<=r7;
 8:RD1<=r8;
 9:RD1<=r9;
 10:RD1<=r10;
 11:RD1<=r11;
 12:RD1<=r12;
 13:RD1<=r13;
 14:RD1<=r14;
 15:RD1<=r15;
 default:RD1<=0;
endcase

case(A2)
 0:RD2<=r0;
 1:RD2<=r1;
 2:RD2<=r2;
 3:RD2<=r3;
 4:RD2<=r4;
 5:RD2<=r5;
 6:RD2<=r6;
 7:RD2<=r7;
 8:RD2<=r8;
 9:RD2<=r9;
 10:RD2<=r10;
 11:RD2<=r11;
 12:RD2<=r12;
 13:RD2<=r13;
 14:RD2<=r14;
 15:RD2<=r15;
 default:RD2<=0;
endcase


end

always_ff @(negedge  clk)begin
	if(WE3)begin
		case(A3)
		 0:r0<=WD3;
		 1:r1<=WD3;
		 2:r2<=WD3;
		 3:r3<=WD3;
		 4:r4<=WD3;
		 5:r5<=WD3;
		 6:r6<=WD3;
		 7:r7<=WD3;
		 8:r8<=WD3;
		 9:r9<=WD3;
		 10:r10<=WD3;
		 11:r11<=WD3;
		 12:r12<=WD3;
		 13:r13<=WD3;
		 14:r14<=WD3;
		 15:r15<=WD3;
		 default:r0<=r0;
		endcase
		
	end
	r15<=R15;
end
endmodule	