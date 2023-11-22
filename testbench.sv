module testbench;
parameter N=4;
logic  A[N-1:0];
logic  B[N-1:0]; 
logic sel[3:0];
logic  flag[3:0], Out[N-1:0];

ALU #(4) alu(A,B,sel,flag,Out);
initial begin
$monitor("A=%p,B=%p,sel=%p: out=%p, flag=%p",A,B,sel,flag,Out);
assign A='{0, 0, 0, 1};
assign B='{0, 0, 0, 1};
assign sel='{0, 0, 0, 0};
//Model sim tiene un error y primero se debe analisar contra packed para que acepte el analisis y despues se debe simular con unpakeds
#1ns not_gate: assert(Out=={1, 1, 1, 0});
assign sel='{0, 0, 0, 1};
#1ns and_gate:assert(Out=={0,0,0,1});
assign sel='{0, 0, 1, 0};
#1ns or_gate:assert(Out=={0,0,0,1});
assign sel='{0, 0, 1, 1};
#1ns xor_gate:assert(Out=={0,0,0,0});
assign sel='{0, 1, 0, 0};
#1ns rigth_shift:assert(Out=={0,0,0,0});
assign sel='{0, 1, 0, 1};
#1ns left_shift:assert(Out=={0,0,1,0});
assign sel='{1, 0, 0, 0};
#1ns Suma:assert(Out=={0,0,1,0});
assign sel='{1, 0, 0, 1};
#1ns Resta:assert(Out=={0,0,0,0});
assign sel='{1, 1, 0, 0};
assign A='{1, 0, 0, 1};
#1ns Right_shift:assert(Out=={1,1,0,0});
assign sel='{1, 1, 0, 1};
#1ns Left_shift:assert(Out=={1,0,1,0});


assign B='{0, 1, 0, 1};

assign sel='{0, 0, 0, 0};
#1ns not_gate2:assert(Out=={0, 1, 1, 0});
assign sel='{0, 0, 0, 1};
#1ns and_gate2:assert(Out=={0,0,0,1});
assign sel='{0, 0, 1, 0};
#1ns or_gate2:assert(Out=={1,1,0,1});
assign sel='{0, 0, 1, 1};
#1ns xor_gate2:assert(Out=={1,1,0,0});
assign sel='{0, 1, 0, 0};
#1ns rigth_shift2:assert(Out=={0,1,0,0});
assign sel='{0, 1, 0, 1};
#1ns left_shift2:assert(Out=={0,0,1,0});
assign sel='{1, 0, 0, 0};
#1ns Suma2:assert(Out=={1,1,1,0});
assign sel='{1, 0, 0, 1};
#1ns Resta2:assert(Out=={0,1,0,0});
assign sel='{1, 1, 0, 0};
assign A='{1, 1, 1, 1};
#1ns Right_shift2:assert(Out=={1,1,1,1});
assign sel='{1, 1, 0, 1};
#1ns Left_shift2:assert(Out=={1,1,1,0});

end
endmodule