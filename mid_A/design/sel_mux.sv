module sel_mux (
    input logic [3:0] a,
    b,
    input logic sel,
    output logic [3:0] x
);

  always_comb begin
    case (sel)
      0: begin
        x = a;
      end
      1: begin
        x = b;
      end
    endcase
  end

endmodule
