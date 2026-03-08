module trafficlight (input wire clk,input wire reset ,output reg red,yellow,green);
  reg [1:0] state;
  reg [3:0] timer;
  parameter s0 = 2'b00;
  parameter s1= 2'b01;
  parameter s2 = 2'b10;
  
  always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= s0;
        timer <= 0;
    end
    else
    begin
        timer <= timer + 1;

        case(state)

        s0:
        begin
            if(timer==5)
            begin
                state <= s1;
                timer <= 0;
            end
        end

        s1:
        begin
            if(timer==2)
            begin
                state <= s2;
                timer <= 0;
            end
        end

        s2:
        begin
            if(timer==5)
            begin
                state <= s0;
                timer <= 0;
            end
        end

        endcase
    end
end
    
    always @(*) begin
      
      red=0;green=0;yellow=0;
      
      case(state)
        s0: red=1;
        s1: yellow=1;
        s2: green=1;
      endcase
      
    end

endmodule
