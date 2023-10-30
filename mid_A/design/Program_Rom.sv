module Program_Rom (
    output logic [15:0] Rom_data_out,
    input [3:0] Rom_addr_in
);

  //---------

  //---------
  always_comb begin
    case (Rom_addr_in)
      4'h0:    Rom_data_out = 16'h4234;  // a = 4 、b = 3、 c = 2、 d = 4 ， w_q = ad-bc = 10
      4'h1:    Rom_data_out = 16'h2138;  // a = 8 、b = 3、 c = 1、 d = 2 ， w_q = ad-bc = 13
      4'h2:    Rom_data_out = 16'h9256;  // a = 6 、b = 5、 c = 2、 d = 9 ， w_q = ad-bc = 44
      4'h3:    Rom_data_out = 16'h7757;  // a = 7 、b = 5、 c = 7、 d = 7 ， w_q = ad-bc = 14
      default: Rom_data_out = 14'h0;
    endcase
  end
endmodule
