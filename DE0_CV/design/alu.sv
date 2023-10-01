module alu (
    input logic [3:0] a,
    input logic [3:0] b,
    input logic op,
    output logic [3:0] s
);

  always_comb begin
    if (op) s = a - b;
    else s = a + b;
  end

endmodule
