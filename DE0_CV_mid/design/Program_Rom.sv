module Program_Rom (
    output logic [13:0] Rom_data_out,
    input [10:0] Rom_addr_in
);
  //---------
  logic [13:0] data;

  always_comb begin
    case (Rom_addr_in)
      11'h0:   data = 14'h01A5;  //CLRF			ram[25]=0
      11'h1:   data = 14'h0103;  //CLRW			w=0
      11'h2:   data = 14'h3007;  //MOVLW 7		w=7
      11'h3:   data = 14'h07A5;  //ADDLW 0x25,1	ram[25]=7
      11'h4:   data = 14'h0725;  //ADDLW 0x25,0	w=14
      11'h5:   data = 14'h2805;  //GOTO	5
      //這兩行為MPLAB清除暫存器的指令，不用管
      11'h6:   data = 14'h3400;
      11'h7:   data = 14'h3400;
      default: data = 14'h0;
    endcase
  end
  assign Rom_data_out = data;

endmodule







