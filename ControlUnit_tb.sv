`timescale 1ns/1ps

module ControlUnit_tb;

  // Inputs
  logic clk;
  logic [3:0] Cond;
  logic [1:0] Op;
  logic [5:0] Funct;
  logic [3:0] Rd;
  logic [3:0] flags;
  logic [11:0] Src2;

  // Outputs
  logic PCSrc;
  logic MemtoReg;
  logic MemWrite;
  logic [2:0] ALUControl;
  logic ALUSrc;
  logic [1:0] ImmSrc;
  logic RegWrite;
  logic [1:0] REGSrc;
  logic Shift;

  // Instantiate the ControlUnit module
  ControlUnit uut (
    .clk(clk),
    .Cond(Cond),
    .Op(Op),
    .Funct(Funct),
    .Rd(Rd),
    .flags(flags),
    .Src2(Src2),
    .PCSrc(PCSrc),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUControl(ALUControl),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite),
    .REGSrc(REGSrc),
    .Shift(Shift)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    Cond = 4'b0000;
    Op = 2'b00;
    Funct = 6'b000000;
    Rd = 4'b0000;
    flags = 4'b0000;
    Src2 = 12'b000000000000;

    // Wait for a few clock cycles
    #20;

    // Apply test vectors
    Cond = 4'b1010; // Set condition bits
    Op = 2'b01;     // Set operation bits
    Funct = 6'b011010; // Set function bits
    Rd = 4'b0010;   // Set Rd bits
    flags = 4'b1100; // Set flags
    Src2 = 12'b101010101010; // Set Src2 bits

    // Wait for a few more clock cycles
    #20;

    // Add more test vectors as needed

    // End simulation after some cycles
    #100 $finish;
  end

endmodule