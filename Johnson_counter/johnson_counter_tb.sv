
module johnson_counter_tb();
  wire [3:0]q;
  reg clk;
  reg reset;
  
  johnson_counter dut (.q(q),.clk(clk),.reset(reset));
  
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
  end
  
  initial begin
    reset = 1;#2;
    reset = 0;#2;
    #25;
    $finish;
  end
  
  initial begin
    $monitor("clk=%0d, Q=%4b",clk,q);
    $dumpfile("wave.vcd");
    $dumpvars(0,johnson_counter_tb);
  end
  
endmodule
