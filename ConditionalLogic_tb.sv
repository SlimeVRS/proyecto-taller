`timescale 1 ps / 1 ps

module ConditionalLogic_tb;
  // Inputs
  logic clk;
  logic[3:0] Cond;
  logic[3:0] ALUFlags;
  logic[1:0] FlagW;
  logic PCS;
  logic RegW;
  logic MemW;
  logic NoWrite;

  // Outputs
  logic PCSrc;
  logic RegWrite;
  logic MemWrite;

  // Instantiate the ConditionalLogic module
  ConditionalLogic dut (
    .clk(clk),
    .Cond(Cond),
    .ALUFlags(ALUFlags),
    .FlagW(FlagW),
    .PCS(PCS),
    .RegW(RegW),
    .MemW(MemW),
	 .NoWrite(NoWrite),
    .PCSrc(PCSrc),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite)
  );



  // Stimulus generation
  initial begin
    // Test case 1
	 clk = 1; #20
	 Cond = 4'b0000;
    ALUFlags = 4'hF;
    FlagW = 2'h3;
    PCS = 1'b1;
    RegW = 1'b0;
    MemW = 1'b1;
    clk = 0; #20
	 clk = 1; #20
    // Verify the outputs
    $display("Test case 1: PCSrc = %b, RegWrite = %b, MemWrite = %b", PCSrc, RegWrite, MemWrite);

    // Test case 2
    Cond = 4'b0000;
    ALUFlags = 4'hA;
    FlagW = 2'h1;
    PCS = 1'b0;
    RegW = 1'b1;
    MemW = 1'b0;
    clk = 0;#20
	 clk = 1;#20
    // Verify the outputs
    $display("Test case 2: PCSrc = %b, RegWrite = %b, MemWrite = %b", PCSrc, RegWrite, MemWrite);

  end
endmodule
