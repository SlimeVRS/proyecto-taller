module hex_7segments(input logic  hex_num[3:0], output logic  _7segments[6:0]);

	wire notA, notB, notC, notD;
	wire [3:0] outs_andA;
	wire [3:0] outs_andB;
	wire [2:0] outs_andC;
	wire [3:0] outs_andD;	
	wire [2:0] outs_andE;
	wire [3:0] outs_andF;
	wire [2:0] outs_andG;
	
	not(notA, hex_num[3]);
	not(notB, hex_num[2]);
	not(notC, hex_num[1]);
	not(notD, hex_num[0]);

	// a = A'B'C'D + A'BC'D' + AB'CD + ABC'D
	// hex_num = ABCD
	and(outs_andA[0], notA, notB, notC, hex_num[0]);
	and(outs_andA[1], notA, hex_num[2], notC, notD);
	and(outs_andA[2], hex_num[3], notB, hex_num[1], hex_num[0]);
	and(outs_andA[3], hex_num[3], hex_num[2], notC, hex_num[0]);
	or(_7segments[0], outs_andA[0], outs_andA[1], outs_andA[2], outs_andA[3]);

	// b = BCD' + ACD + ABD' + A'BC'D
	and(outs_andB[0], hex_num[2], hex_num[1], notD);
	and(outs_andB[1], hex_num[3], hex_num[1], hex_num[0]);
	and(outs_andB[2], hex_num[3], hex_num[2], notD);
	and(outs_andB[3], notA, hex_num[2], notC, hex_num[0]);
	or(_7segments[1], outs_andB[0], outs_andB[1], outs_andB[2], outs_andB[3]);

	// c = ABD' + ABC + A'B'CD'
	and(outs_andC[0], hex_num[3], hex_num[2], notD);
	and(outs_andC[1], hex_num[3], hex_num[2], hex_num[1]);
	and(outs_andC[2], notA, notB, hex_num[1], notD);
	or(_7segments[2], outs_andC[0], outs_andC[1], outs_andC[2]);

	//d = BCD + A'B'C'D + A'BC'D'+ AB'CD'
	and(outs_andD[0], hex_num[2], hex_num[1], hex_num[0]);
	and(outs_andD[1], notA, notB, notC, hex_num[0]);
	and(outs_andD[2], notA, hex_num[2], notC, notD);
	and(outs_andD[3], hex_num[3], notB, hex_num[1], notD);
	or(_7segments[3], outs_andD[0], outs_andD[1], outs_andD[2], outs_andD[3]);

	// e = A'D + B'C'D + A'BC'
	and(outs_andE[0], notA, hex_num[0]);
	and(outs_andE[1], notB, notC, hex_num[0]);
	and(outs_andE[2], notA, hex_num[2], notC);
	or(_7segments[4], outs_andE[0], outs_andE[1], outs_andE[2]);
	
	// f = A'B'D + A'B'C + A'CD + ABC'D
	and(outs_andF[0], notA, notB, hex_num[0]);
	and(outs_andF[1], notA, notB, hex_num[1]);
	and(outs_andF[2], notA, hex_num[1], hex_num[0]); 
	and(outs_andF[3], hex_num[3], hex_num[2], notC,hex_num[0]); 
	or(_7segments[5], outs_andF[0], outs_andF[1], outs_andF[2], outs_andF[3]);

	//g = A'B'C'+ A'BCD + ABC'D'
	and(outs_andG[0], notA, notB, notC);
	and(outs_andG[1], notA, hex_num[2], hex_num[1], hex_num[0]);
	and(outs_andG[2], hex_num[3], hex_num[2], notC, notD);
	or(_7segments[6], outs_andG[0], outs_andG[1], outs_andG[2]);


endmodule