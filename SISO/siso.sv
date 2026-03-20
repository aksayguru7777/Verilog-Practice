module siso(
    input clk,
    input reset,
    input din,
    output dout
);

reg [3:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset)
        shift_reg <= 4'b0000;
    else
        shift_reg <= {shift_reg[2:0], din};
end

  assign dout = shift_reg[3];

endmodule
