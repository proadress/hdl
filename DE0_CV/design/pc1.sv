module pc1 (
    input logic clk,
    input logic rst,
    output logic load_mar,
    output logic load_pc,
    output logic load_ir,
    output logic [10:0] pc,rom_in,
    output logic [13:0] rom_out,ir
);

typedef enum { t0,t1,t2,t3 } state_s;
state_s ps,ns;

  ROM r (
      .Rom_addr_in(rom_in),
      .Rom_data_out(rom_out)
  );

always_comb begin
    load_mar = 0;
    load_pc = 0;
    load_ir = 0;
    case(ps)
        t0: begin
            ns = t1;
            end
        t1: begin
            ns = t2;
            load_mar = 1;
            end
        t2: begin
            ns = t3;
            load_pc = 1;
            end
        t3: begin
            ns = t1;
            load_ir = 1;
            end
        endcase
end
//pc+1
always_ff @(posedge clk) begin
    if (rst) pc <= #1 11'b0;
    else if (load_pc) pc <= #1 pc + 1;
end
//state切換下一個
always_ff @(posedge clk) begin
    if (rst) ps <= #1 t0;
    else ps <= #1 ns;
end
//mar = pc
always_ff @(posedge clk) begin
    if (rst) rom_in <= #1 11'b0;
    else if (load_mar) rom_in <= #1 pc;
end
//ir = mar result
always_ff @(posedge clk) begin
    if (rst) ir <= #1 14'b0;
    else if (load_ir) ir <= #1 rom_out;
end

endmodule