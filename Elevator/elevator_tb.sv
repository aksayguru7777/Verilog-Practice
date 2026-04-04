module elevator_tb();

  reg clk, rst;
  reg [1:0] request_floor;
  wire [1:0] current_floor;
  wire door;

  elevator dut(.current_floor(current_floor),.request_floor(request_floor),.door(door),.clk(clk),.rst(rst));

  always #5 clk = ~clk;

  initial begin
    request_floor = 0;
    clk = 0;
    @(posedge clk); rst = 1;#50;
    @(posedge clk); rst = 0;#50;

    @(posedge clk);request_floor = 2'b00;#50;
    @(posedge clk);request_floor = 2'b11;#50;
    @(posedge clk);request_floor = 2'b10;#50;
    @(posedge clk);request_floor = 2'b01;#50;
    @(posedge clk);request_floor = 2'b11;#50;
    @(posedge clk);request_floor = 2'b00;#50;

    repeat(2) @(posedge clk);
    #100;
    $finish;
  end

  initial begin
    $monitor(" Current=%d | Request=%d | Door=%d",current_floor, request_floor, door);
    $dumpfile("wave.vcd");
    $dumpvars(0, elevator_tb);
  end

endmodule
