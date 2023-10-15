module fsm_mealey (
    input clk,
    input rst,
    input x,
    output logic y
);
//正反
  logic [1:0] present_state, next_state;
  always_ff @(posedge clk) begin
    if (rst) present_state <= #1 2'b00;
    else present_state <= #1 next_state;
  end
//控制next_state
  always_comb begin
    case (present_state)
      2'b00: begin
        if (x) next_state = 2'b01;
        else next_state = 2'b00;
      end
      2'b01: begin
        if (x) next_state = 2'b11;
        else next_state = 2'b00;
      end
      default: begin
        next_state = 2'b00;
      end
    endcase
  end
//控制y
  always_comb begin
    case (present_state)
      2'b00: begin
        if (x) y = 1'b0;
        else y = 1'b0;
      end
      2'b01: begin
        if (x) y = 1'b0;
        else y = 1'b1;
      end
      default: begin
        y = 1'bx;
      end
    endcase
  end
endmodule
