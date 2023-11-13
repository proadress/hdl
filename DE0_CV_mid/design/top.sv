module top (
    input clk,
    rst,
    output logic [7:0] w_q
);
  logic [7:0] alu_q, mux1_out, ram_out;
  logic [10:0] PC_q, mar_q, PC_next;
  logic [13:0] prog_data, ir_q;
  logic load_pc, load_mar, load_ir, load_w, sel_pc, d, sel_alu, ram_en;
  logic [3:0] op;
  logic GOTO, ADDWF, ANDWF, CLRF, CLRW, COMF, DECF, MOVLW, ADDLW;

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

  always_comb begin
    load_ir = 0;
    load_mar = 0;
    load_pc = 0;
    load_w = 0;
    sel_pc = 0;
    op = 0;
    sel_alu = 0;
    sel_pc = 0;
    ram_en = 0;
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
        if (MOVLW) begin
          op = 5;
          load_w = 1;
        end else if (ADDLW) begin
          op = 0;
          load_pc = 1;
        end else if (GOTO) begin
          sel_pc  = 1;
          load_pc = 1;
        end else if (ADDWF) begin
          op = 0;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (ANDWF) begin
          op = 2;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (CLRF) begin
          op = 8;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (CLRW) begin
          op = 8;
          load_w = 1;
        end else if (COMF) begin
          op = 9;
          sel_alu = 1;
          ram_en = 1;
        end else if (DECF) begin
          op = 7;
          sel_alu = 1;
          ram_en = 1;
        end
      end
      t5: ns = t6;
      t6: ns = t1;
    endcase
  end

  assign MOVLW = ir_q[13:8] == 6'b110000;
  assign ADDLW = ir_q[13:8] == 6'b111110;

  assign GOTO = ir_q[13:11] == 3'b101;
  assign ADDWF = ir_q[13:8] == 6'b000111;
  assign ANDWF = ir_q[13:8] == 6'b000101;
  assign CLRF = ir_q[13:8] == 6'b000001 && ir_q[13:2] != 12'b000001000000;
  assign CLRW = ir_q[13:2] == 12'b000001000000;
  assign COMF = ir_q[13:8] == 6'b001001;
  assign DECF = ir_q[13:8] == 6'b000011;
  assign d = ir_q[7];

  //clk
  always_ff @(posedge clk) begin
    if (rst) ps <= #1 t0;
    else ps <= #1 ns;
  end

  //sel_PC
  always_comb begin
    if (sel_pc) PC_next <= #1 ir_q[10:0];
    else PC_next <= #1 PC_q + 1;
  end
  //PC
  always_ff @(posedge clk) begin
    if (rst) PC_q <= #1 0;
    else if (load_pc) PC_q <= #1 PC_next;
  end
  //MAR
  always_ff @(posedge clk) begin
    if (rst) mar_q <= #1 0;
    else if (load_mar) mar_q <= #1 PC_q;
  end
  //ROM
  Program_Rom PC (
      .Rom_data_out(prog_data),
      .Rom_addr_in (mar_q)
  );
  //IR
  always_ff @(posedge clk) begin
    if (rst) ir_q <= #1 0;
    else if (load_ir) ir_q <= #1 prog_data;
  end

  //ALU
  always_comb begin
    case (op)
      0: alu_q = mux1_out + w_q;
      1: alu_q = mux1_out - w_q;
      2: alu_q = mux1_out & w_q;
      3: alu_q = mux1_out | w_q;
      4: alu_q = mux1_out ^ w_q;
      5: alu_q = mux1_out;
      6: alu_q = mux1_out + 1;
      7: alu_q = mux1_out - 1;
      8: alu_q = 0;
      9: alu_q = ~mux1_out;
      default alu_q = mux1_out + w_q;
    endcase
  end
  //RAM
  single_port_ram_128x8 ram (
      .data(alu_q),
      .addr(ir_q[6:0]),
      .ram_en(ram_en),
      .clk(clk),
      .q(ram_out)
  );
  //sel_alu
  always_comb begin
    if (sel_alu) mux1_out <= #1 ram_out;
    else mux1_out <= #1 ir_q[7:0];
  end
  //W
  always_ff @(posedge clk) begin
    if (rst) w_q <= #1 0;
    else if (load_w) w_q <= #1 alu_q;
  end



endmodule
