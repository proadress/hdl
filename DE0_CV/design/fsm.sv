module fsm (
    input clk,
    input rst,
    output logic [7:0] s
);

  logic load_counter;
  counter_8bit counter1 (
      .clk(clk),
      .rst(rst),
      .load(load),
      .s(s)
  );

  logic [1:0] ns, ps;
  always_ff @(posedge clk) begin
    if (rst) ps <= #1 2'b0;
    else ps <= #1 ns;
  end

  always_comb begin
    ns = 2'h0;
    load_counter = 0;
    case (ps)
      2'h0: begin
        load_counter = 1;
        ns = 2'h1;
      end
      2'h1: ns = 2'h2;
      2'h2: ns = 2'h3;
      2'h3: ns = 2'h0;
    endcase
  end
endmodule
