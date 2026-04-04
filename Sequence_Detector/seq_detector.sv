module seq_detector_101(
    input clk,
    input reset,
    input din,
    output reg dout
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

reg [1:0] state, next_state;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

always @(*) begin
    case(state)
        S0: next_state = (din) ? S1 : S0;
        S1: next_state = (din) ? S1 : S2;
        S2: next_state = (din) ? S3 : S0;
        S3: next_state = (din) ? S1 : S2; 
        default: next_state = S0;
    endcase
end

always @(*) begin
    dout = (state == S3);
end

endmodule
