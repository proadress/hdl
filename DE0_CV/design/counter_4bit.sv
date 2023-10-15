module counter_4bit (
    input logic clk,
    input logic rst,
    input logic [3:0] limit,

    output logic co,
    output logic [3:0] s
);

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      co <= 0;
      s <= 4'b0000;  // 復位到0
    end else if (s == limit) begin
      co <= 1;
      s <= 4'b0000;  // 當計數達到limit時重新歸零
    end else begin
      co <= 0;
      s <= s + 1;  // 正常計數，每個時鐘週期加1
    end
  end

endmodule
