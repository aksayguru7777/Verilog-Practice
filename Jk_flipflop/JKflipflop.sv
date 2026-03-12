module JKflipflop (input wire j,k,reset,clk,
                   output reg q,q_bar);
  
  initial q = 0;
  assign q_bar = ~ q;
  
  always @ (posedge clk or posedge reset) begin
    
    if(reset) q<=0;
    else if(j && k) q<=q;
    else if (j) q<=1;
    else if (k) q<=0;
    else q <= q_bar;
  
  end
endmodule
