module elevator(
  input clk,
  input rst,
  input [1:0] request_floor,
  output reg door,
  output reg [1:0] current_floor
);

  parameter Ground = 2'b00, First_floor = 2'b01, second_floor = 2'b10, third_floor = 2'b11;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      current_floor <= Ground;
      door <= 0;
    end
    else begin
      if (current_floor < request_floor) begin
        current_floor <= current_floor + 1;
        door <= 0;
      end
      else if (current_floor > request_floor) begin
        current_floor <= current_floor - 1;
        door <= 0;
      end
      else begin
        door <= 1; 
      end
    end
  end

endmodule

