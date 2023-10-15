module testbench;
  logic clk;  // 時脈輸入
  logic rst;
  logic [3:0] load_w, a, b;

  counter_register c (
      .clk(clk),  // 時脈輸入
      .rst(rst),
      .load_w(load_w),
      .a(a),
      .b(b)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    clk = 0;
    load_w = 4'b0;

    #1 rst = 0;

    #20;
    $stop;
  end
endmodule
