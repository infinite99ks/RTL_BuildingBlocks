// Synchronus active high reset D-FF
module sync_dff_ah (input d, input rst, input clk, output reg o);
always@(posedge clk) begin
    if(rst)
        o <= 0;
    else
    o <= d;
end
endmodule