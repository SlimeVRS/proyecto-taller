module ControlDecoder_tb;

  // Inputs
  reg [1:0] Op;
  reg [5:0] Funct;
  reg [3:0] Rd;
  reg [11:0] Src2;
  
  // Outputs
  wire [1:0] FlagW;
  wire PCS;
  wire RegW;
  wire MemW;
  wire MemtoReg;
  wire ALUSrc;
  wire [1:0] ImmSrc;
  wire [1:0] RegSrc;
  wire [2:0] ALUControl;
  wire NoWrite;
  wire Shift;
  
  // Instantiate the module under test
  ControlDecoder dut (
    .Op(Op),
    .Funct(Funct),
    .Rd(Rd),
    .Src2(Src2),
    .FlagW(FlagW),
    .PCS(PCS),
    .RegW(RegW),
    .MemW(MemW),
    .MemtoReg(MemtoReg),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegSrc(RegSrc),
    .ALUControl(ALUControl),
    .NoWrite(NoWrite),
    .Shift(Shift)
  );
  
  // Clock
  reg clk = 0;
  
  // Test stimulus
  initial begin
  clk = 1;#20
    // Testcase 1 Verifica que PClogic devuelva 0, cuando Rd no es 15
    Op = 2'b00;    
    Funct = 6'b000000;
    Rd = 4'b0110;
    Src2 = 12'b000000000000;
	 clk = 0;#20
	 clk = 1;#20	 
	 $display("Testcase 1 Verifica que PClogic devuelva 0, cuando Rd no es 15");
	 $display("MemtoReg=%b",
                MemtoReg);
			      $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",
                Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
	 clk = 1;#20
	 // Testcase 2 Verifica que PCLogic devuelva 1 cuando se usa Rd =15
	 Op = 2'b00;    
    Funct = 6'b000000;
    Rd = 4'b1111;
    Src2 = 12'b000000000000;
	 clk = 0;#20
	 clk = 1;#20
	 $display("Testcase 2 Verifica que PCLogic devuelva 1 cuando se usa Rd =15");
	 $display("MemtoReg=%b",
                MemtoReg);
			      $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",
                Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);

	 clk = 0;#20
	 clk = 1;#20
	 //Testcase 3 Verifica que MemtoReg sea 1
	 Op = 2'b01;    
    Funct = 6'b010001;
    Rd = 4'b0000;
    Src2 = 12'b000000000000;
	 clk = 0;#20
	 clk = 1;#20
	 $display("Testcase 3 Verifica que MemtoReg sea 1");
	$display("MemtoReg=%b",
                MemtoReg);
			      $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",
                Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
	 clk = 0;#20
	 clk = 1;#20
	 // Testcase 4 Verifica que MemtoReg sea 0 y MemW sea 1
	 Op = 2'b01;    
    Funct = 6'b000000;
    Rd = 4'b0000;
    Src2 = 12'b000000000000;
	 clk = 0; #20
	 clk = 1; #20
	 $display("Testcase 4 Verifica que MemtoReg sea 0 y MemW sea 1");
	 $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
   clk = 0;#20
	 clk = 1;#20
	 // Testcase 5 Verifica que ALUControl sea 100 o MULT
	 Op = 2'b00;    
    Funct = 6'b000000;
    Rd = 4'b0000;
    Src2 = 12'b000010010000;
	 clk = 0; #20
	 clk = 1; #20
	 $display("Testcase 5 Verifica que ALUControl sea 100 o MULT");
	 $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
	 clk = 0;#20
	 clk = 1;#20
	 // Testcase 6 Verifica que ALUControl sea 010 o AND
	 Op = 2'b00;    
    Funct = 6'b000000;
    Rd = 4'b0000;
    Src2 = 12'b000000000000;
	 clk = 0; #20
	 clk = 1; #20
	 $display("Testcase 6 Verifica que ALUControl sea 010 o AND");
	 $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
	 clk = 0;#20
	 clk = 1;#20
	 // Testcase 7 Verifica que ALUControl sea 000 o ADD
	 Op = 2'b00;    
    Funct = 4'b0100;
    Rd = 4'b0000;
    Src2 = 12'b000000000000;
	 clk = 0; #20
	 clk = 1; #20
	 $display("Testcase 7 Verifica que ALUControl sea 000 o ADD");
	 $display("Op=%b, Funct=%b, Rd=%b, Src2=%b, FlagW=%b, PCS=%b, RegW=%b, MemW=%b, MemtoReg=%b, ALUSrc=%b, ImmSrc=%b, RegSrc=%b, ALUControl=%b, NoWrite=%b, Shift=%b",Op, Funct, Rd, Src2, FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Shift);
    // End the simulation
  end
  
endmodule