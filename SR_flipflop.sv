module SR_flipflop (
    input wire set,
    input wire reset,
    input wire clk,
    output reg q,
    output wire q_bar
);
  initial q=0;
assign q_bar = ~q;

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else if (set && reset)
        $display("Invalid condition");
    else if (set)
        q <= 1'b1;
    else
        q <= q;
end

endmodule
