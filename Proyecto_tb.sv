`timescale 1ns / 1ps

module Proyecto_tb;

  // Parámetros
  parameter TIME_UNIT = 1ns;

  // Entradas
  reg CLOCK2_50;
  reg KEY;
  reg [31:0] ReadData;
  reg [31:0] ALUResult;
  reg RD2;
  reg MemWrite;
  reg END;

  // Salidas
  wire [7:0] VGA_CLK, VGA_HS, VGA_VS, VGA_SYNC_N, VGA_BLANK_N, VGA_R, VGA_G, VGA_B;
  wire [31:0] ADDRES;

  // Instancia del módulo a probar
  Proyecto uut (
    .CLOCK2_50(CLOCK2_50),
    .KEY(KEY),
    .ReadData(ReadData),
    .ALUResult(ALUResult),
    .RD2(RD2),
    .MemWrite(MemWrite),
    .END(END),
    .VGA_CLK(VGA_CLK),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_SYNC_N(VGA_SYNC_N),
    .VGA_BLANK_N(VGA_BLANK_N),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .ADDRES(ADDRES)
  );

  // Generación de la señal de reloj
  initial begin
    CLOCK2_50 = 0;
    forever #TIME_UNIT CLOCK2_50 = ~CLOCK2_50;
  end

  // Estímulo inicial
  initial begin
    // Inicializa las entradas
    KEY = 4'b0000;
    ReadData = 32'h00000000;
    ALUResult = 32'h00000000;
    RD2 = 0;
    MemWrite = 0;
    END = 0;

    // Aplica estímulo
    // Ejemplo de prueba: Lee desde la dirección 32'h1000
    RD2 = 1;
    ADDRES = 32'h1000;

    #10;  // Espera 10 unidades de tiempo

    // Ejemplo de prueba: Realiza una operación ALU con KEY = 4'b0010
    KEY = 4'b0010;

    #10;  // Espera 10 unidades de tiempo

    // Ejemplo de prueba: Escribe en memoria en la dirección 32'h2000
    MemWrite = 1;
    ADDRES = 32'h2000;

    #10;  // Espera 10 unidades de tiempo

    // Restablece las señales
    RD2 = 0;
    MemWrite = 0;

    #70; // Simula durante 70 unidades de tiempo adicionales

    // Finaliza la simulación
    $stop;
  end

endmodule