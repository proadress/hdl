module Program_Rom (
    output logic [13:0] Rom_data_out,
    input [10:0] Rom_addr_in
);
  //---------
  logic [13:0] data;

  always_comb begin
    // case (Rom_addr_in)
    //   11'h0:   data = 14'h3001;  //MOVLW 1 
    //   11'h1:   data = 14'h3E02;  //ADDLW 2
    //   11'h2:   data = 14'h3003;  //MOVLW 3
    //   11'h3:   data = 14'h3004;  //MOVLW 4
    //   default: data = 14'h0;
    // endcase
    case (Rom_addr_in)
      11'h0:   data = 14'h3044;
      11'h1:   data = 14'h3E01;
      11'h2:   data = 14'h3802;
      11'h3:   data = 14'h39FE;
      11'h4:   data = 14'h3C47;
      11'h5:   data = 14'h3A55;
      11'h6:   data = 14'h3AAA;
      default: data = 14'h0;
    endcase
  end
  assign Rom_data_out = data;

endmodule







