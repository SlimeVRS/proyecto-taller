`timescale 1 ps / 1 ps

module RegisterFile_tb;
  // Inputs
  logic clk;
  logic rst;
  logic[3:0] A1;
  logic[3:0] A2;
  logic[3:0] A3;
  logic[31:0] WD3;
  logic[31:0] R15;
  logic WE3;

  // Outputs
  logic [31:0] RD1;
  logic [31:0] RD2;

  // Instantiate the RegisterFile module
  RegisterFile dut (
    .clk(clk),
    .rst(rst),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .R15(R15),
    .WE3(WE3),
    .RD1(RD1),
    .RD2(RD2)
  );

  // Clock generation
  
  // Reset generation
  initial begin
    rst = 1;
    #10 rst = 0;
  end

  // Stimulus generation
  initial begin
    // Test case 1
	 clk = 1;#20
	 A1 = 0;
    A2 = 2; // lectura del registro 2
    A3 = 2; // escritura en el registro 2
    WD3 = 'h12345678; // write data
    R15 = 'hABCDEF01; 
    WE3 = 1;
	 clk=0;#20
	 
	 clk = 1;#20
    // Verify the outputs
	 if (RD2 == WD3) begin
		$display("Test case 1: RD1 = %h, RD2 = %h", RD1, RD2);
		$display("Data wroted succesfully in TEST CASE 1");
		end
	 else begin
		$display("Failure at TEST CASE 1");
		end

    // Test case 2
    A1 = 3; // registro a leer
    A2 = 4; // registro a leer
    A3 = 4;
    WD3 = 'h87654321;
    R15 = 'hFEDCBA09;
    WE3 = 1;
	 
    clk = 0; #20
	 clk = 1; #20
    // Verify the outputs
	 if (RD2 == WD3) begin
		$display("Test case 2: RD1 = %h, RD2 = %h", RD1, RD2);
		$display("Data wroted succesfully in TEST CASE 2");
		end
	else begin
		$display("Failure at TEST CASE 2");
		end

    // Add more test cases as needed
  end
endmodule