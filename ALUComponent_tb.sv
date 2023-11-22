`timescale 1 ps / 1 ps

module ALUComponent_tb;
	
	logic [31:0] A;
	logic [31:0] B;
	logic [2:0] sel;
	logic [3:0] flag;
	logic [31:0] result;
	ALUComponent #(32) dut(A, B, sel, flag, result);
	
	assign A = 32'b100;
	assign B = 32'b001;

	initial begin
	
		// Test 1: Suma
		sel = 3'b000;
		#1;  // Wait for one time unit for the output to stabilize
		if(result == 32'b101) begin
			$display("Correcto. %h + %h = %h flags: %h", A, B, result, flag);
		end else begin
			$display("Incorrecto. %h + %h = %h flags: %h", A, B, result, flag);
		end
		
		// Test 2: Resta
		sel = 3'b001;
		#1;
		if(result == 32'b011) begin
			$display("Correcto. %h - %h = %h flags: %h", A, B, result, flag);
		end else begin
			$display("Incorrecto. %h - %h = %h flags: %h", A, B, result, flag);
		end
		
		// Test 3: AND
		sel = 3'b010;
		#1;
		if(result == 32'b000) begin
			$display("Correcto. %h & %h = %h flags: %h", A, B, result, flag);
		end else begin
			$display("Incorrecto. %h & %h = %h flags: %h", A, B, result, flag);
		end
		
		// Test 4: OR
		sel = 3'b011;
		#1;
		if(result == 32'b101) begin
			$display("Correcto. %h | %h = %h flags: %h", A, B, result, flag);
		end else begin
			$display("Incorrecto. %h | %h = %h flags: %h", A, B, result, flag);
		end
		
		// Test 5: Multiplicacion
		sel = 3'b100;
		#1;
		if(result == 32'b100) begin
			$display("Correcto. %h * %h = %h flags: %h", A, B, result, flag);
		end else begin
			$display("Incorrecto. %h * %h = %h flags: %h", A, B, result, flag);
		end
		
		// Test 6: Asignar B
		sel = 3'b101;
		#1;
		if(result == 32'b001) begin
			$display("Correcto. %h = %h flags: %h", B, result, flag);
		end else begin
			$display("Incorrecto. %h = %h flags: %h", B, result, flag);
		end
	end

endmodule