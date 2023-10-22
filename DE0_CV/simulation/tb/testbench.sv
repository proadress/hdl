module testbench;
  logic clk;  // 時脈輸入
  logic rst;
  logic [4:0] a, b, c, d, e, s;

  pipeline p (
      .clk(clk),  // 時脈輸入
      .rst(rst),
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d),
      .e  (e),
      .s  (s)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    clk = 0;
    #10 rst = 0;
    @(posedge clk) a = 6;b = 7;c = 8;d = 3;e = 10;
    @(posedge clk) a = 4;b = 8;c = 7;d = 3;e = 1;
    @(posedge clk) a = 1;b = 9;c = 6;d = 3;e = 5;
    @(posedge clk) a = 8;b = 7;c = 3;d = 7;e = 2;
    @(posedge clk) a = 6;b = 10;c = 3;d = 3;e = 10;
    @(posedge clk) a = 11;b = 9;c = 6;d = 5;e = 6;
    @(posedge clk) a = 6;b = 8;c = 2;d = 7;e = 1;
    @(posedge clk) a = 11;b = 10;c = 4;d = 3;e = 2;
    @(posedge clk) a = 7;b = 4;c = 10;d = 7;e = 9;
    @(posedge clk) a = 2;b = 8;c = 11;d = 13;e = 5;
    #15;
    $stop;
  end
endmodule
