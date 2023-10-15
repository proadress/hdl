module fsm_ryg (
    input logic clk,
    input logic rst,
    output logic [1:0] r,
    y,
    g
);

  logic co;
  logic [3:0] s;
  logic [1:0] nr, ny, ng;

  counter_4bit cp (
      .clk(clk),
      .rst(rst),
      .limit(4'b1001),
      .s(s),
      .co(co)
  );
  always_ff @(posedge clk) begin
    if (rst) begin
      r <= #1 2'b01;
      y <= #1 2'b00;
      g <= #1 2'b10;
    end else begin
      r <= #1 nr;
      y <= #1 ny;
      g <= #1 ng;
    end
  end

  always_comb begin
    case (s)
      4'h0: begin
        nr = 2'b01;
        ny = 2'b00;
        ng = 2'b10;
      end
      4'h3: begin
        nr = r;
        ny = 2'b10;
        ng = 2'b00;
      end
      4'h5: begin
        nr = 2'b10;
        ny = 2'b00;
        ng = 2'b01;
      end
      4'h8: begin
        nr = r;
        ny = 2'b01;
        ng = 2'b00;
      end
    endcase
  end
endmodule
