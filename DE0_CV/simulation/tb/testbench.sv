module testbench;

  //logic [2:0]sel ,y;
  //logic [3:0]a,b,s;
  logic [3:0] a, b, s;
  logic op;

  alu uut (
      .a (a),
      .b (b),
      .op(op),
      .s (s)
  );


  initial begin
    // for (sel = 0; sel <= 7; sel = sel + 1)
    //     #10;
    #10 a = 4'h5;   b  = 4'hB;  op = 0;
    #10 a = 4'hD;   b  = 4'h7;  op = 1;
    #10 $stop;
  end
endmodule
