module alu(
    input [3:0] a,
    input [3:0] b,
    input [1:0] sel,
  output reg [7:0] y,
  output reg error
);
  
initial error=0;
  
always @(*) begin
    case(sel)
        2'b00: y = a + b;   
        2'b01: y = a - b;   
        2'b10: y = a * b;   
        2'b11: begin
          if(b==0) begin
            y = 0;
            error = 1;
          end
          else y = a / b;
        end
        default: y = 8'b00000000;
    endcase
end

endmodule
