`timescale 1ns/1ps

module ALU_tb;

  // Inputs
  logic [31:0] SrcA;
  logic [31:0] SrcB;
  logic [2:0] ALUControl;

  // Outputs
  logic [3:0] ALUFlags;
  logic [31:0] ALUResult;

  // Instantiate the ALU module
  ALU uut (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUFlags(ALUFlags),
    .ALUResult(ALUResult)
  );

  // Test scenario
  initial begin
    // Initialize inputs
    SrcA = 32'h00000001;
    SrcB = 32'h00000002;
    ALUControl = 3'b000;

    // Wait for a few clock cycles
    #20;

    // Apply test vectors
    ALUControl = 3'b001; // Set ALUControl to addition
    // Expected Result: 32'h00000003 (1 + 2)
    if (ALUResult !== 32'h00000003) $fatal("Test failed for addition");

    ALUControl = 3'b010; // Set ALUControl to subtraction
    // Expected Result: 32'hFFFFFFFF (1 - 2, considering two's complement)
    if (ALUResult !== 32'hFFFFFFFF) $fatal("Test failed for subtraction");

    ALUControl = 3'b100; // Set ALUControl to bitwise AND
    // Expected Result: 32'h00000000 (1 & 2)
    if (ALUResult !== 32'h00000000) $fatal("Test failed for bitwise AND");

    // Add more test vectors as needed

    // End simulation after some cycles
    #100 $finish;
  end

endmodule