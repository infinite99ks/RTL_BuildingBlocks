module shift_left_reg(input c, input si, input aload, input rst, input [7:0] d, output reg so);

    reg[7:0] register;

always@(posedge c, posedge aload, posedge rst) begin
    if(rst) begin
        register <= 8'h00;
    end
    else if(aload) begin
        register = d;
    end
    else begin
        register <= {register[6:0], si};
    end
    assign so = register[7];
end

endmodule