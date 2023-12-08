module top (
    input clk,
    rst,
    output logic [7:0] w_q
);
  logic [7:0] alu_out, mux1_out, ram_out, RAM_mux, bcf_mux, bsf_mux, databus;
  logic [10:0] PC_q, mar_q, PC_next;
  logic [13:0] prog_data, ir_q;
  logic
      load_pc,
      load_mar,
      load_ir,
      load_w,
      sel_pc,
      d,
      sel_alu,
      ram_en,
      sel_bus,
      btfsc_btfss_skip_bit,
      btfsc_skip_bit,
      btfss_skip_bit,
      alu_zero;
  logic [3:0] op;
  logic
      GOTO,
      ADDWF,
      ANDWF,
      CLRF,
      CLRW,
      COMF,
      DECF,
      MOVLW,
      ADDLW,
      SUBLW,
      ANDLW,
      IORLW,
      XORLW,
      INCF,
      IORWF,
      MOVF,
      MOVWF,
      SUBWF,
      XORWF,
      BCF,
      BSF,
      BTFSC,
      BTFSS,
      DECFSZ,
      INCFSZ;
  logic [1:0] sel_RAM_mux;
  logic [2:0] sel_bit;

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

  //ROM
  Program_Rom rom (
      .Rom_addr_in (mar_q),
      .Rom_data_out(prog_data)
  );

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
    sel_bus = 0;
    sel_RAM_mux = 0;
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
          load_w = 1;
        end else if (SUBLW) begin
          op = 1;
          load_w = 1;
        end else if (ANDLW) begin
          op = 2;
          load_w = 1;
        end else if (IORLW) begin
          op = 3;
          load_w = 1;
        end else if (XORLW) begin
          op = 4;
          load_w = 1;
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
          ram_en = 1;
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
        end else if (INCF) begin
          op = 6;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (IORWF) begin
          op = 3;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (MOVF) begin
          op = 5;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (MOVWF) begin
          ram_en  = 1;
          sel_bus = 1;
        end else if (SUBWF) begin
          op = 1;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (XORWF) begin
          op = 4;
          sel_alu = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (BCF) begin
          sel_alu = 1;
          sel_RAM_mux = 1;
          op[3:0] = 5;
          ram_en = 1;
        end else if (BSF) begin
          sel_alu = 1;
          sel_RAM_mux = 2;
          op[3:0] = 5;
          ram_en = 1;
        end else if (BTFSC | BTFSS) begin
          if (btfsc_btfss_skip_bit) load_pc = 1;
        end else if (DECFSZ) begin
          sel_alu = 1;
          op[3:0] = 7;
          if (alu_zero) load_pc = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end else if (INCFSZ) begin
          sel_alu = 1;
          op[3:0] = 6;
          if (alu_zero) load_pc = 1;
          if (d) ram_en = 1;
          else load_w = 1;
        end
      end
      t5: ns = t6;
      t6: ns = t1;
    endcase
  end

  assign MOVLW = ir_q[13:8] == 6'b110000;
  assign ADDLW = ir_q[13:8] == 6'b111110;
  assign SUBLW = ir_q[13:8] == 6'b111100;
  assign ANDLW = ir_q[13:8] == 6'b111001;
  assign IORLW = ir_q[13:8] == 6'b111000;
  assign XORLW = ir_q[13:8] == 6'b111010;

  assign GOTO = ir_q[13:11] == 3'b101;
  assign ADDWF = ir_q[13:8] == 6'b000111;
  assign ANDWF = ir_q[13:8] == 6'b000101;
  assign CLRF = ir_q[13:8] == 6'b000001 && ir_q[13:2] != 12'b000001000000;
  assign CLRW = ir_q[13:2] == 12'b000001000000;
  assign COMF = ir_q[13:8] == 6'b001001;
  assign DECF = ir_q[13:8] == 6'b000011;
  assign d = ir_q[7];

  assign INCF = ir_q[13:8] == 6'b001010;
  assign IORWF = ir_q[13:8] == 6'b000100;
  assign MOVF = ir_q[13:8] == 6'b001000;
  assign MOVWF = ir_q[13:8] == 6'b000000;
  assign SUBWF = ir_q[13:8] == 6'b000010;
  assign XORWF = ir_q[13:8] == 6'b000110;

  assign BCF = ir_q[13:10] == 4'b0100;
  assign BSF = ir_q[13:10] == 4'b0101;
  assign BTFSC = ir_q[13:10] == 4'b0110;
  assign BTFSS = ir_q[13:10] == 4'b0111;
  assign DECFSZ = ir_q[13:8] == 6'b001011;
  assign INCFSZ = ir_q[13:8] == 6'b001111;




  assign sel_bit = ir_q[9:7];
  assign btfsc_skip_bit = ram_out[ir_q[9:7]] == 0;
  assign btfss_skip_bit = ram_out[ir_q[9:7]] == 1;
  assign btfsc_btfss_skip_bit = (BTFSC & btfsc_skip_bit) | (BTFSS & btfss_skip_bit);
  assign alu_zero = (alu_out == 0) ? 1'b1 : 1'b0;

  //clk
  always_ff @(posedge clk) begin
    if (rst) ps <= #1 t0;
    else ps <= #1 ns;
  end
  //alu_out
  always_comb begin
    case (op)
      0: alu_out = mux1_out + w_q;
      1: alu_out = mux1_out - w_q;
      2: alu_out = mux1_out & w_q;
      3: alu_out = mux1_out | w_q;
      4: alu_out = mux1_out ^ w_q;
      5: alu_out = mux1_out;
      6: alu_out = mux1_out + 1;
      7: alu_out = mux1_out - 1;
      8: alu_out = 0;
      9: alu_out = ~mux1_out;
      default alu_out = mux1_out + w_q;
    endcase
  end
  //sel_bus
  always_comb begin
    if (sel_bus) databus = w_q;
    else databus = alu_out;
  end
  //RAM
  single_port_ram_128x8 ram (
      .data(databus),
      .addr(ir_q[6:0]),
      .ram_en(ram_en),
      .clk(clk),
      .q(ram_out)
  );
  //sel_alu
  always_comb begin
    if (sel_alu) mux1_out = RAM_mux;
    else mux1_out = ir_q[7:0];
  end
  //sel_pc
  always_comb begin
    if (sel_pc) PC_next = ir_q[10:0];
    else PC_next = PC_q + 1;
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
  //IR
  always_ff @(posedge clk) begin
    if (rst) ir_q <= #1 0;
    else if (load_ir) ir_q <= #1 prog_data;
  end
  //W
  always_ff @(posedge clk) begin
    if (rst) w_q <= #1 0;
    else if (load_w) w_q <= #1 alu_out;
  end
  //ram mux
  always_comb begin
    case (sel_RAM_mux)
      0: RAM_mux = ram_out;
      1: RAM_mux = bcf_mux;
      2: RAM_mux = bsf_mux;
    endcase
  end
  //BCF
  always_comb begin
    case (sel_bit)
      3'b000: bcf_mux = ram_out & 8'b1111_1110;
      3'b001: bcf_mux = ram_out & 8'b1111_1101;
      3'b010: bcf_mux = ram_out & 8'b1111_1011;
      3'b011: bcf_mux = ram_out & 8'b1111_0111;
      3'b100: bcf_mux = ram_out & 8'b1110_1111;
      3'b101: bcf_mux = ram_out & 8'b1101_1111;
      3'b110: bcf_mux = ram_out & 8'b1011_1111;
      3'b111: bcf_mux = ram_out & 8'b0111_1111;
    endcase
  end
  //BSF
  always_comb begin
    case (sel_bit)
      3'b000: bsf_mux = ram_out | 8'b0000_0001;
      3'b001: bsf_mux = ram_out | 8'b0000_0010;
      3'b010: bsf_mux = ram_out | 8'b0000_0100;
      3'b011: bsf_mux = ram_out | 8'b0000_1000;
      3'b100: bsf_mux = ram_out | 8'b0001_0000;
      3'b101: bsf_mux = ram_out | 8'b0010_0000;
      3'b110: bsf_mux = ram_out | 8'b0100_0000;
      3'b111: bsf_mux = ram_out | 8'b1000_0000;
    endcase
  end
endmodule
