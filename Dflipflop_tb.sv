`timescale 1ns/1ps

module Dflipflop_tb();
  wire q;
  reg d;
  reg clk;
  
  Dflipflop dut (.q(q),.d(d),.clk(clk));
  
  initial begin
    clk=0;
    forever #2 clk = ~ clk;
  end
  
  initial begin
    d=0; #4;
    d=1; #4;
    
    $finish;
  end

  initial begin
    $monitor("D=%0d , Q=%0d",d,q);
    $dumpfile("wave.vcd");
    $dumpvars(0,Dflipflop_tb);
  end
endmodule

