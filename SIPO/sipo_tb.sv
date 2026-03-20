module sipo_tb();
  wire [3:0]q;
  reg clk;
  reg reset;
  reg din;
  
  sipo dut(.clk(clk),.q(q),.reset(reset),.din(din));
  
  always #5 clk = ~clk;
  
  always @(posedge clk) begin
    $display("clk =%0d, din=%b, q=%b",clk,din,q);
  end
  
 initial begin
   clk=0;
   din=0;
   reset=1;
   @(posedge clk);
   reset = 0;
   @(posedge clk); din =1;
   @(posedge clk); din =0;
   @(posedge clk); din =0;
   @(posedge clk); din =1;
   repeat(2) @(posedge clk);
   
   $finish;
   
 end
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,sipo_tb);
  end
endmodule
