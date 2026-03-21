`timescale 1ns/1ps
module pipo_tb();

  reg clk;
  reg reset;
  reg [3:0] din;
  wire [3:0]dout;

  pipo dut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
  );

  
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    din = 4'b0000;

    repeat(2) @(posedge clk);
    reset = 0;

    @(posedge clk);
    din = 4'b0101;

    repeat(5) @(posedge clk);
    $finish;
  end
  
  always @(posedge clk) begin
    $display(" din=%b | dout=%b",
               din, dout);
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,pipo_tb);
  end
endmodule
