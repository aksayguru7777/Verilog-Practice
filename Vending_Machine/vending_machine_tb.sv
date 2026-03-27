module vending_machine_tb;

reg clk;
reg reset;
reg [1:0] coin;
wire dispense;
wire change;

vending_machine dut (
    .clk(clk),
    .reset(reset),
    .coin(coin),
    .dispense(dispense),
    .change(change)
);

always #5 clk = ~clk;

always @(posedge clk) begin
  $display("Time=%0t | coin=%2d | dispense=%b | change=%b",$time, coin, dispense, change);
end

initial begin
    clk = 0;
    reset = 1;
    coin = 2'b00;

    repeat(2) @(posedge clk);
    reset = 0;

    @(posedge clk); coin = 2'b01; 
    @(posedge clk); coin = 2'b10; 

    @(posedge clk); coin = 2'b10; 
    @(posedge clk); coin = 2'b01; 

    @(posedge clk); coin = 2'b10; 
    @(posedge clk); coin = 2'b10; 

    @(posedge clk); coin = 2'b00;

    repeat(5) @(posedge clk);

    $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, vending_machine_tb);
end

endmodule
