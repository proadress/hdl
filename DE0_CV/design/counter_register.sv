module counter_register (
    input logic clk,
    input logic rst,
    output logic [3:0] load_w,
    a,
    b
);
  logic co_a, co_b;
  counter_4bit cp1 (
      .clk(clk),
      .rst(rst),
      .limit(4'b1001),
      .s(a),
      .co(co_a)
  );
  counter_4bit cp2 (
      .clk(clk),
      .rst(rst),
      .limit(4'b0100),
      .s(b),
      .co(co_b)
  );

  always_comb begin
    if (co_a == 1 && co_b == 1) load_w = a + b;
  end

endmodule
