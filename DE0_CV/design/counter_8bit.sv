module counter_4bit (
    input logic clk,
    input logic rst,
    input logic load,
    output logic [7:0] s
);

  always_ff @(posedge clk) begin
    if (rst) s <= #1 8'b0;
    else if (load) s <= #1 s + 1;
    else s <= #1 8'bx;
  end

endmodule
