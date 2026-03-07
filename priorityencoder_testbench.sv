`timescale 1ns/1ps

module priority_encoder_tb(); 
  reg [3:0]d;
  wire [1:0] y;
  wire valid;
  priority_encoder  dut(.d(d),.y(y)); 
  initial begin 
 
    d = 4'b0001;
    #10; d = 4'b0010;
    #10 d = 4'b0100;
    #10; d = 4'b1000;
    #10; d = 4'b1010;
    #10; d = 4'b0110;
    #10;
    $finish;
  end
    initial begin
      $monitor("d=%b y=%b", d, y); 
      $dumpfile("wave.vcd");
      $dumpvars(0,priority_encoder_tb); 
    end

endmodule