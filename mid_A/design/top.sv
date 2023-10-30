module top (
    input clk,
    rst,
    output logic [7:0] w_q
);
  logic [3:0] a_q, b_q, c_q, d_q, a, b, c, d, x, y, pc, PC_q;
  logic [7:0] s, ad_q, bc_q, cnt, w, ad, bc;
  logic [15:0] Rom_out;
  logic load_reg, load_ad, load_bc, load_w;

  typedef enum {
    t1,
    t2,
    t3,
    t4
  } state_s;
  state_s ps, ns;



  Program_Rom PC (
      .Rom_data_out(Rom_out),
      .Rom_addr_in (PC_q)
  );

  always_comb begin
    load_reg = 0;
    load_ad = 0;
    load_w = 0;
    PC_q = pc;
    a_q = a;
    b_q = b;
    c_q = c;
    d_q = d;
    ad_q = ad;
    bc_q = bc;
    w_q = w;
    s = ad - bc;
    case (ps)
      t1: begin
        ns = t2;
        load_reg = 1;
      end
      t2: begin
        ns = t3;
        x = a_q;
        y = d_q;
        load_ad = 1;
      end
      t3: begin
        ns = t4;
        x = b_q;
        y = c_q;
        load_bc = 1;
      end
      t4: begin
        ns = t2;
        load_w = 1;
        load_reg = 1;
      end
    endcase
  end


  always_ff @(posedge clk) begin
    if (rst) begin
      pc  <= #1 4'h0;
      cnt <= #1 8'b0;
      ps  <= #1 t1;
    end else begin
      cnt <= #1 cnt + 1;
      ps  <= #1 ns;
      if (load_reg) begin
        a  <= #1 Rom_out[3:0];
        b  <= #1 Rom_out[7:4];
        c  <= #1 Rom_out[11:8];
        d  <= #1 Rom_out[15:12];
        pc <= #1 PC_q + 1;
      end
      if (load_ad) ad <= #1 x * y;

      if (load_bc) bc <= #1 x * y;

      if (load_w) w <= #1 s;
    end
  end


endmodule
