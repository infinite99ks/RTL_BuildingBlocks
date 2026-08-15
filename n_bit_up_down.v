module up_down_n #(parameter width = 8) (input rst, input clk, input en_load, input up_ndown, input [width-1: 0] load, output reg [width-1:0] cnt); 
    always@(posedge clk) begin
        // Synchronus load and reset, thus not included in the sensitivty list.
        if(~rst) begin // Active low.
            cnt <= 0;
        end
        else if (en_load) begin
            cnt <= load;
        end else begin
            if(up_ndown) begin
                cnt <= cnt + 1;
            end
            else begin
                cnt <= cnt - 1;
            end
        end
    end
endmodule