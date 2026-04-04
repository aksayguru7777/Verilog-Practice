module alu_tb;

reg [3:0] a, b;
reg [1:0] sel;
wire [7:0] y;
wire error;

alu dut(.a(a), .b(b), .sel(sel), .y(y), .error(error));

initial begin
    a = 0; b = 0; sel = 0;

    #10 a = 4; b = 3; sel = 2'b00;
    #10 a = 7; b = 2; sel = 2'b01;
    #10 a = 3; b = 4; sel = 2'b10;
    #10 a = 8; b = 2; sel = 2'b11;
    #10 a = 5; b = 0; sel = 2'b11;

    #10 $finish;
end

initial begin
  $monitor(" a=%d b=%d sel=%b | y =%d | error=%b",a, b, sel, y, error);
    $dumpfile("wave.vcd");
    $dumpvars(0, alu_tb);
end

endmodule
