module PC(input logic clk, input logic[32:0] PCin, output logic[32:0] PCout );

always_ff @(posedge clk) begin

PCout<=PCin;

end


endmodule
