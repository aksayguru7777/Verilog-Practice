`timescale 1ns/1ps

module piso_tb();

  reg clk;
  reg load;
  reg reset;
  reg [3:0] din;
  wire dout;

  piso dut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .din(din),
    .dout(dout)
  );

  
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    load = 0;
    din = 4'b0000;

    repeat(2) @(posedge clk);
    reset = 0;

    @(posedge clk);
    load = 1;
    din = 4'b1101;

    @(posedge clk);
    load = 0;

    repeat(5) @(posedge clk);
    $finish;
  end
  
  always @(posedge clk) begin
    $display(" din=%b | load=%0b | dout=%b",
               din, load, dout);
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,piso_tb);
  end
endmodule
