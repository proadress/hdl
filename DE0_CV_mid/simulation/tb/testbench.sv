module testbench;
  logic clk, rst;
  logic [7:0] w_q;


  top top1 (
      .clk(clk),
      .rst(rst),
      .w_q(w_q)
  );  //期中考電路


  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #100000 $stop;
  end
endmodule
