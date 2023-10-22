module counter_register2 (
    input logic clk,
    input logic rst,
    output logic load_a,
    output logic load_b,
    output logic [7:0] port_a,
    output logic [7:0] port_b,
    output logic [7:0] w,
    output logic [7:0] s,
    output logic [7:0] b
);
  counter_8bit counter (
      .clk(clk),
      .rst(rst),
      .load(1),
      .s(b)
  );

  always_ff @(posedge clk) begin
    if (rst) w <= #1 8'b00000000;
    else w <= #1 s;
  end

  always_ff @(posedge clk) begin
    if (rst) port_a <= #1 8'b00000000;
    else if (load_a) port_a <= #1 w;
  end

  always_ff @(posedge clk) begin
    if (rst) port_b <= #1 8'b00000000;
    else if (load_b) port_b <= #1 w;
  end

  assign s = w + b;

  always_ff @(posedge clk) begin
    load_a = 0;
    load_b = 0;
    if (b == 10) load_a = 1;
    else if (b == 20) load_b = 1;
  end

endmodule
