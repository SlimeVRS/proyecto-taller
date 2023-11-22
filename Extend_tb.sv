module Extend_tb;
  // Inputs
  logic [23:0] Imm;
  logic [1:0] ImmSrc;
  
  // Outputs
  logic [31:0] ExtImm;
  
  // Instantiate the module to be tested
  Extend extend_unit (
    .Imm(Imm),
    .ImmSrc(ImmSrc),
    .ExtImm(ExtImm)
  );
  
  // Clock generation
  logic clk;
  
  // Testbench stimulus
  initial begin
    // Initialize inputs
	 clk = 1; #20
    Imm = 24'b100010010000000010010101;
    ImmSrc = 2'b00;
	 
    // Case 1: ImmSrc = 00
	 clk = 0; #20
	 clk = 1; #20
    $display("ExtImm = %h", ExtImm);
    clk = 1; #20
	 
    // Case 2: ImmSrc = 01
    ImmSrc = 2'b01;
    clk = 0; #20
	 clk = 1; #20
    $display("ExtImm = %h", ExtImm);
    clk = 1; #20
	 
    // Case 3: ImmSrc = 10
    ImmSrc = 2'b10;
    clk = 0; #20
	 clk = 1; #20
    $display("ExtImm = %h", ExtImm);
    clk = 1; #20
	 
    // Case 4: ImmSrc = 11 (Default case)
    ImmSrc = 2'b11;
    clk = 0; #20
	 clk = 1; #20
    $display("ExtImm = %h", ExtImm);
    
  end
endmodule
