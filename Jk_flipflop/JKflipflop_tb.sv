module JKflipflop_tb ();
  wire q;
  wire q_bar;
  reg clk;
  reg reset;
  reg j; 
  reg k;
  
JKflipflop dut(.j(j),.k(k),.clk(clk),.reset(reset),.q(q),.q_bar(q_bar));
  
  initial begin 
    clk = 0;
    forever #4 clk = ~clk;
  end
  
  initial begin 
    j=0;k=0;
    reset=1;#5;
    reset=0;#5;
    j=1;k=0;#10;
    j=0;k=1;#10;
    j=1;k=1;#10;
    $finish;
  end
  
  initial begin
    $monitor("j=%0d,k=%0d, Q=%0d,!Q=%0d",j,k,q,q_bar);
    $dumpfile("wave.vcd");
    $dumpvars(0,JKflipflop_tb);
  end
  
endmodule
