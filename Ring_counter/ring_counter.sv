module ringCounter (input wire clk,reset,output reg [3:0]q);
  
  initial q = 4'b0001;
  
  always @(posedge clk or posedge reset) begin
    if(reset)  q <= 4'b0001;
    else if (q==4'b1000)  q <= 4'b0001;
    else  q <= q<<1;
  end
  
endmodule
