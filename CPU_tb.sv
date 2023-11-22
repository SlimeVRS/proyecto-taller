`timescale 1ns/1ps

module CPU_tb;

  // Inputs
  logic clk;
  logic rst;
  logic [31:0] ReadDataIn;

  // Outputs
  logic [31:0] ALUResultOut;
  logic [31:0] RD2Out;
  logic MemWriteOut;
  logic [31:0] END;

  // Instantiate the CPU module
  CPU uut (
    .clk(clk),
    .rst(rst),
    .ReadDataIn(ReadDataIn),
    .ALUResultOut(ALUResultOut),
    .RD2Out(RD2Out),
    .MemWriteOut(MemWriteOut),
    .END(END)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    rst = 0;
    ReadDataIn = 32'h00000001;

    // Apply reset
    #10 rst = 1;

    // Wait for a few clock cycles after reset
    #20;

    // Apply test vectors
    ReadDataIn = 32'h00000002;
    #10;
    ReadDataIn = 32'h00000003;
    #10;
    // Add more test vectors as needed

    // End simulation after some cycles
    #100 $finish;
  end

endmodule