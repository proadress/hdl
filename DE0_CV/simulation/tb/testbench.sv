module testbench;
  logic clk;  // 時脈輸入
  logic rst;
  logic [3:0] hours_tens;  // 小時的十位數
  logic [3:0] hours_ones;  // 小時的個位數
  logic [3:0] minutes_tens;  // 分鐘的十位數
  logic [3:0] minutes_ones;  // 分鐘的個位數
  logic day;

  counter_24hr cc (
      .clk(clk),  // 時脈輸入
      .rst(rst),
      .hours_tens(hours_tens),  // 小時的十位數
      .hours_ones(hours_ones),  // 小時的個位數
      .minutes_tens(minutes_tens),  // 分鐘的十位數
      .minutes_ones(minutes_ones),  // 分鐘的個位數
      .day(day)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    clk = 0;
    day = 0;
    hours_tens = 0;
    hours_ones = 0;
    minutes_tens = 0;
    minutes_ones = 0;

    #1 rst = 0;

    #5000;
    $stop;
  end
endmodule
