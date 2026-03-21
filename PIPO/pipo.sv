module pipo(input wire clk,
            input wire reset,
            input wire [3:0]din,
            output reg [3:0]dout);

  initial dout=0;
  always @(posedge clk) begin
    if(reset) dout <= 4'b0000;
    else dout <= din;
  end

endmodule

