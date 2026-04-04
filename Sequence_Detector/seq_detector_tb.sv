module seq_detector_101_tb;

reg clk, reset, din;
wire dout;

seq_detector_101 dut(.clk(clk), .reset(reset), .din(din), .dout(dout));

always #5 clk = ~clk;

initial begin
  
  clk = 0;
  reset = 1;
  
  repeat(2) @(posedge clk);
  reset = 0;
  
  @(posedge clk) din = 1;
  @(posedge clk) din = 0;
  @(posedge clk) din = 1; 
  @(posedge clk) din = 0;
  @(posedge clk) din = 1; 
  
  repeat(3) @(posedge clk);
  $finish;
end
  
initial begin
  $monitor("din=%b, dout=%b",din,dout);
  $dumpfile("wave.vcd");
  $dumpvars(0,seq_detector_101_tb);
end
  
endmodule
