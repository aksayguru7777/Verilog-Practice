module SR_flipflop_tb();

reg clk;
reg reset;
reg set;

wire q;
wire q_bar;

SR_flipflop dut (.set(set), .reset(reset), .clk(clk), .q(q), .q_bar(q_bar));

initial begin
  clk = 0;
  reset = 0;
  set = 0;
end

// clock generation
always #2 clk = ~clk;

initial begin
  
  #10 set = 1; reset = 0;
  #10 set = 0; reset = 1;
  #10 set = 1; reset = 1;
  #10 $finish;
end

initial begin
  $monitor("S=%0d R=%0d Q=%0d Q_bar=%0d", set, reset, q, q_bar);
  $dumpfile("wave.vcd");
  $dumpvars(0,SR_flipflop_tb);
end

endmodule
