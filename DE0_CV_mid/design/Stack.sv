module Stack(
    output logic [10:0] stack_out,
    input [10:0] stack_in,
    input push,pop,reset,clk
);

logic [3:0] stk_ptr,stk_index;
logic [10:0] stack[15:0];

assign stk_index = stk_ptr + 1;
assign stk_out = stack[stk_ptr];

always_ff @(posedge clk) begin
    if(reset) stk_ptr <= 4'b1111;
    else if(push)begin
        stack[stk_index] <= stack_in;
        stk_ptr <= stk_ptr + 1;
    end
    else if(pop) stk_ptr<= stk_ptr-1;
end

endmodule