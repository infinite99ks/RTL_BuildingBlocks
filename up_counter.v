// 4-bit up counter.
module up_counter (input clk, input rst, output reg [3:0] counter_up);
    always@(posedge clk or posedge rst) begin
        if(rst)
            counter_up <= 4'd0;
        else
            counter_up <= counter_up + 4'd1;
    end
endmodule
