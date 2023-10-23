module testbench;
  logic clk;  // 時脈輸入
  logic rst;
  logic load_ir,load_mar,load_pc;
  logic [10:0] pc,rom_in,rom_out;
  logic [13:0] ir;

  pc1 p (
      .clk(clk),  // 時脈輸入
      .rst(rst),
      .load_ir(load_ir),
      .load_mar(load_mar),
      .load_pc(load_pc),
      .pc  (pc),
      .rom_in  (rom_in),
      .rom_out  (rom_out),
      .ir  (ir)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    clk = 0;
    #10 rst = 0;
    #100;
    $stop;
  end
endmodule
