module upcounter_tb();
  wire [3:0]q;
  reg clk;
  reg reset;
  
  upcounter dut(.clk(clk),.q(q),.reset(reset));
  
  initial begin
    clk=0;
    forever #2 clk = ~clk;
  end
   
  initial begin
    reset=1;#2;
    reset=0;
    #58;
    $finish;
  end
  
initial begin
  $monitor("clk=%0d, q=%4b",clk,q);
  $dumpfile("wve.vcd");
  $dumpvars(0,upcounter_tb);
end
endmodule

