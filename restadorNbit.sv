module restadorNbit  #(parameter N=32)(output logic [N-1:0]restaOut,
												   output logic [3:0]flags,
												   input logic  [N-1:0]A, 
												   input logic  [N-1:0]B
												  );
												  
	// Wires
	logic carry_in;
	logic carry_out;
	logic [N:0]resultCopy;
	
	//calculo de overflow
	logic overflow[1:0];
	and overflow_and(overflow[0],~A[N-1], ~B[N-1], restaOut[N-1]),overflowand2(overflow[1],A[N-1], B[N-1], ~restaOut[N-1]); 
	or overflow_or(flags[0],overflow[1],overflow[0] ); // V
	
	// Resultado resta
	assign resultCopy = A+ ~B + 1;
	assign restaOut= A-B;
	
	// Asignar flags
	always_comb begin
		// NZCV siendo flag[0] = V
		
		carry_out <= resultCopy[N];
		
		flags[1]<=carry_out;// C
		flags[2]<=A==B;//Z
		flags[3]<=A<B;// N

		carry_in<=0;
		carry_in<=carry_out;
	end
	
endmodule