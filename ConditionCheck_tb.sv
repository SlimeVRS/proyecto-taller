module ConditionCheck_tb;

  // Señales
  logic [3:0] Flags;
  logic [3:0] Cond;
  logic CondEx;

  // Instancia el módulo bajo prueba
  ConditionCheck dut (
    .Flags(Flags),
    .Cond(Cond),
    .CondEx(CondEx)
  );

  // Estímulos y assertions
  initial begin
    // Caso 1: Flags = 4'b0000 (neg = 0, zero = 0, carry = 0, overflow = 0)
    Flags = 4'b0000;

    Cond = 4'b0000; // EQ
    #1;
    assert (CondEx === 1'b0) else $error("Error: EQ condition check failed");

    Cond = 4'b0001; // NE
    #1;
    assert (CondEx === 1'b1) else $error("Error: NE condition check failed");

    Cond = 4'b0010; // CS
    #1;
    assert (CondEx === 1'b0) else $error("Error: CS condition check failed");

    Cond = 4'b0011; // CC
    #1;
    assert (CondEx === 1'b1) else $error("Error: CC condition check failed");

    Cond = 4'b0100; // MI
    #1;
    assert (CondEx === 1'b0) else $error("Error: MI condition check failed");

    Cond = 4'b0101; // PL
    #1;
    assert (CondEx === 1'b1) else $error("Error: PL condition check failed");

    // Caso 2: Flags = 4'b1111 (neg = 1, zero = 1, carry = 1, overflow = 1)
    Flags = 4'b1111;

    Cond = 4'b1000; // HI
    #1;
    assert (CondEx === 1'b0) else $error("Error: HI condition check failed");

    Cond = 4'b1001; // LS
    #1;
    assert (CondEx === 1'b1) else $error("Error: LS condition check failed");

    Cond = 4'b1010; // GE
    #1;
    assert (CondEx === 1'b1) else $error("Error: GE condition check failed");

    Cond = 4'b1011; // LT
    #1;
    assert (CondEx === 1'b0) else $error("Error: LT condition check failed");

    Cond = 4'b1100; // GT
    #1;
    assert (CondEx === 1'b0) else $error("Error: GT condition check failed");

    Cond = 4'b1101; // LE
    #1;
    assert (CondEx === 1'b1) else $error("Error: LE condition check failed");


  end

endmodule