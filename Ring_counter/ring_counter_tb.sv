`timescale 1ns/1ps

module ringCounter_tb();
  wire [3:0]q;
  reg clk;
  reg reset;
  
  ringCounter dut(.clk(clk),.reset(reset),.q(q));
  
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
    
  end
  always @(posedge clk) begin
    $display(" q=%4b",q);
  end
  initial begin
    reset = 1;#5;
    reset = 0;#1;
    #25;
    $finish;
  end
  
  initial begin
    //$monitor("clk=%0d, q=%4b",clk,q);
    $dumpfile("wave.vcd");
    $dumpvars(0,ringCounter_tb);
  end
  
endmodule
