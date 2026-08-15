module alu_4bit(input [3:0] a, input [3:0] b, input[1:0] opcode, input rst, input clk, output reg[7:0] out);
reg [3:0] A_reg;
reg [3:0] B_reg;
reg [1:0] opcode_reg;

// Grabbing a snapshot.
always@(posedge clk or posedge rst) begin
    if(rst) begin
        A_reg <= 0;
        B_reg <= 0;
        opcode_reg <= 0;
    end else begin
        A_reg <= a;
        B_reg <= b;
        opcode_reg <= b;
    end
end

// Now onto the logic in of itself.
always@(posedge clk or posedge rst) begin
    case(opcode_reg)
        2'b00: out <= A_reg + B_reg;
        2'b01: out <= A_reg * B_reg;
        2'b10: out <= A_reg | B_reg;
        2'b11: out <= A_reg & B_reg; 
    endcase
end

// Aaand we succesfully made a two-step module lol.
endmodule