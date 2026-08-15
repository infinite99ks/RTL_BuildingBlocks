// DFF with active high Enable and active low preset.

module dff (input d, input e, input pre, input clk, output reg q);
    always@(posedge clk or negedge pre) begin
        if(~pre) begin
            q <= 1;
        end
        else if (e) begin
            q <= d;
        end
    end
endmodule