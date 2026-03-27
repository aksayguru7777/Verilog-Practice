module vending_machine(
    input clk,
    input reset,
    input [1:0] coin,   
    output reg dispense,
    output reg change
);

reg [1:0] state, next_state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

always @(*) begin
    dispense = 0;
    change = 0;

    case(state)

        S0: begin
            if (coin == 2'b01)
                next_state = S1;
            else if (coin == 2'b10)
                next_state = S2;
            else
                next_state = S0;
        end

        S1: begin
            if (coin == 2'b01)
                next_state = S2;
            else if (coin == 2'b10) begin
                next_state = S0;
                dispense = 1;
            end
            else
                next_state = S1;
        end

        S2: begin
            if (coin == 2'b01) begin
                next_state = S0;
                dispense = 1;
            end
            else if (coin == 2'b10) begin
                next_state = S0;
                dispense = 1;
                change = 1;
            end
            else
                next_state = S2;
        end

        default: next_state = S0;

    endcase
end

endmodule
