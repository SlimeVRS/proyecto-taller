module Implementacion(input logic A[3:0],B[3:0],sel[3:0], output logic out[3:0], flags[3:0],sev_seg[6:0]);
ALU #(4) implementada(A,B,sel, flags,out);
hex_7segments display(out,sev_seg);
endmodule