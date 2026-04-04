module bin_to_gray_tb;

  reg [3:0] bin;
  wire [3:0] gray;

  // DUT
  bin_to_gray dut(.bin(bin), .gray(gray));

  initial begin
    $dumpfile("comb.vcd");
    $dumpvars(0, bin_to_gray_tb);

    $monitor("Time=%0t | Bin=%b | Gray=%b", $time, bin, gray);

    bin = 4'b0000; #10;
    bin = 4'b0001; #10;
    bin = 4'b0010; #10;
    bin = 4'b0011; #10;
    bin = 4'b0100; #10;
    bin = 4'b0101; #10;
    bin = 4'b0110; #10;
    bin = 4'b0111; #10;
    bin = 4'b1000; #10;

    #10 $finish;
  end

endmodule
