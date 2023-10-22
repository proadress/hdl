module pipeline (
    input logic clk,
    input logic rst,
    input logic [4:0] a,
    b,
    c,
    d,
    e,
    output logic [4:0] s
);

  logic [4:0] absum, cdsum, x_y, x, y, z, s1, s2;

  assign absum = a + b;
  assign cdsum = c + d;
  assign x_y = x - y;
  assign s = s1 & s2;

  always_ff @(posedge clk) begin
    if (rst) x <= #1 5'b00000;
    else x <= #1 absum;
  end
  always_ff @(posedge clk) begin
    if (rst) y <= #1 5'b00000;
    else y <= #1 cdsum;
  end
  always_ff @(posedge clk) begin
    if (rst) y <= #1 5'b00000;
    else z <= #1 e;
  end
  always_ff @(posedge clk) begin
    if (rst) s1 <= #1 5'b00000;
    else s1 <= #1 x_y;
  end
  always_ff @(posedge clk) begin
    if (rst) s2 <= #1 5'b00000;
    else s2 <= #1 z;
  end

endmodule
