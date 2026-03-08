module trafficlight_tb ();
  
  wire red,green,yellow;
  reg clk,reset;

  trafficlight dut (.red(red),.green(green),.yellow(yellow),.clk(clk),.reset(reset));
  
  always begin 
    #5 clk = !clk;
  end
  initial begin
    clk = 0;
    reset=1;
    #10;
    reset=0;
    #100;
    $finish;
  end
  initial begin
    $monitor("time=%0d, red=%0d, yellow=%0d, green=%0d",$time,red,yellow,green);
    
  end
endmodule
