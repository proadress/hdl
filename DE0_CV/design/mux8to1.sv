module mux8to1 (
    input  logic [2:0] a0,
    input  logic [2:0] a1,
    input  logic [2:0] a2,
    input  logic [2:0] a3,
    input  logic [2:0] a4,
    input  logic [2:0] a5,
    input  logic [2:0] a6,
    input  logic [2:0] a7,
    input  logic [2:0] sel,
    output logic [2:0] y
);

  always_comb begin
    case (sel)
      3'b000:  y = a0;
      3'b001:  y = a1;
      3'b010:  y = a2;
      3'b011:  y = a3;
      3'b100:  y = a4;
      3'b101:  y = a5;
      3'b110:  y = a6;
      3'b111:  y = a7;
      default: y = 3'b000;  // Default case
    endcase
  end

endmodule
