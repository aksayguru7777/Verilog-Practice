module Dflipflop (input wire d,clk,output reg q);
  
  initial q=0;
  
  always @(posedge clk) begin
     q<=d;
  end
  
endmodule

