module counter_24hr (
    input logic clk,  // 時脈輸入
    input logic rst,
    output logic [3:0] hours_tens,  // 小時的十位數
    output logic [3:0] hours_ones,  // 小時的個位數
    output logic [3:0] minutes_tens,  // 分鐘的十位數
    output logic [3:0] minutes_ones,  // 分鐘的個位數
    output logic day,
    output logic [3:0] ex
);

  logic [2:0] c;

  // 實例化之前提供的4位元計數器
  counter_4bit mo (
      .clk(clk),
      .rst(rst),
      .limit(9),
      .co(c[0]),
      .count(minutes_ones)
  );
  counter_4bit mt (
      .clk(c[0]),
      .rst(rst),
      .limit(5),
      .co(c[1]),
      .count(minutes_tens)
  );
  counter_4bit ho (
      .clk(c[1]),
      .rst(rst),
      .limit(ex),
      .co(c[2]),
      .count(hours_ones)
  );
  counter_4bit ht (
      .clk(c[2]),
      .rst(rst),
      .limit(2),
      .co(day),
      .count(hours_tens)
  );
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      c <= 0;
      hours_tens <= 0;
      hours_ones <= 0;
      minutes_tens <= 0;
      minutes_ones <= 0;
    end else if (hours_tens == 2) begin
      ex <= 3;
    end else begin
      ex <= 9;
    end
  end

endmodule
