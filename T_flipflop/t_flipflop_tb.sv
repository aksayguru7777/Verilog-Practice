module t_flipflop_tb;

reg clk;
reg t;
wire q;

  t_flipflop dut(clk,t,q);

always #5 clk = ~clk;

always @(posedge clk)
  $display(" T=%0b q=%0b", t, q);

initial begin
clk = 0;
t = 0;

#10 t = 1;
#10 t = 0;
#10 t = 1;
#10;
 $finish;
end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,t_flipflop_tb);
  end

endmodule
