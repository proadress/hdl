module top (
    input clk,
    rst,
    output logic [7:0] w_q
);
  logic [7:0] alu_q;
  logic [10:0] PC_q, mar_q;
  logic [13:0] prog_data, ir_q;
  logic load_pc, load_mar, load_ir, load_w;

  typedef enum {
    t0,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6
  } state_s;
  state_s ps, ns;



  Program_Rom PC (
      .Rom_data_out(prog_data),
      .Rom_addr_in (mar_q)
  );
  always_ff @(posedge clk) begin
    if (rst) PC_q = 0;
    else if (load_pc) PC_q = PC_q + 1;
  end

  always_ff @(posedge clk) begin
    if (rst) mar_q = 0;
    else if (load_mar) mar_q = PC_q;
  end

  always_ff @(posedge clk) begin
    if (rst) ir_q = 0;
    else if (load_ir) ir_q = prog_data;
  end

  always_ff @(posedge clk) begin
    if (rst) w_q = 0;
    else if (load_w) w_q = alu_q;
  end


  always_comb begin
    load_ir  = 0;
    load_mar = 0;
    load_pc  = 0;
    load_w   = 0;
    case (ps)
      t0: ns = t1;
      t1: begin
        ns = t2;
        load_mar = 1;
      end
      t2: begin
        ns = t3;
        load_pc = 1;
      end
      t3: begin
        ns = t4;
        load_ir = 1;
      end
      t4: begin
        ns = t5;
        load_w = 1;
      end
      t5: ns = t6;
      t6: ns = t1;
    endcase
  end
  always_ff @(posedge clk) begin
    if (rst) ps <= #1 t0;
    else ps <= #1 ns;
  end

  always_comb begin
    case (ir_q[13:8])
      6'b110000: alu_q = ir_q[7:0];
      6'b111110: alu_q = ir_q[7:0] + w_q;
      6'b111100: alu_q = ir_q[7:0] - w_q;
      6'b111001: alu_q = ir_q[7:0] & w_q;
      6'b111000: alu_q = ir_q[7:0] | w_q;
      6'b111010: alu_q = ir_q[7:0] ^ w_q;
      default alu_q = ir_q[7:0] + w_q;
    endcase
  end





endmodule
