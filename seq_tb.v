// Now onto something that is cool, forever loop.
// Mainly used for clock generation.
// Not synthesiable.

// Let's first make a simple d-type flip-flop.
module d_type_ff (input d, input clk, input rst, output reg q);
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            q <= 0;
        end
        else begin
            q<=d;
        end
    end
endmodule

// Now let's make a testbench for this.
module dff_tb;
    reg clk, rst, d;
    wire q;

    integer i = 0;
// Generating the clock.
initial begin
    clk = 0;
    forever
    #1 clk = ~clk;
end

// Now onto the the tb in of itself.
initial begin
    // Reset and initial values.
    rst = 1;
    d = 0;
    // Then at the negdge of the clock, we set the reset to 0.
    @(negedge clk);
    rst = 0;
    // Now randomize the input inside a loop.
    
    for(i=0; i<100; i = i+1) begin
        d = $random;
        @(negedge clk); // Wait til the negedge of the clk so it would propagate properly, and we move on to the next clock cycle.
    end
    $stop;
end
endmodule