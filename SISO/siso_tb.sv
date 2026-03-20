i`timescale 1ns/1ps

module siso_tb;

  
  reg clk;
  reg reset;
  reg din;
  wire dout;

  
  siso dut(
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
  );

  
  always #5 clk = ~clk;   

  always @(posedge clk) begin
    $display("clk=%0d din=%b dout=%b", clk,din, dout);
  end
  initial begin
    clk = 0;
    reset = 1;
    din = 0;

   
    repeat(2) @(posedge clk);
    reset = 0;

    
    @(posedge clk); din = 1;
    @(posedge clk); din = 0;
    @(posedge clk); din = 1;
    @(posedge clk); din = 1;

    
    repeat(5) @(posedge clk);

    $finish;
  end

 
  initial begin
   $dumpfile("wave.vcd");
  $dumpvars(0,siso_tb);
  end

endmodule
  
  



