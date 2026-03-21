module piso(input wire clk,
            input wire load,
            input wire reset,
            input wire [3:0]din,
            output reg dout);
  
  reg [3:0]shift_reg;
  
  initial dout=0;
  
  always @(posedge clk) begin
    if(reset) shift_reg <= 4'b0000;
    else if(load) shift_reg <= din;
    else begin 
      dout <= shift_reg[3];
      shift_reg <= shift_reg << 1;
    end
  end

endmodule

