`include "up_counter.v"

module up_counter_tb;
    reg clk, rst;
    wire [3:0] counter_up;
    // Instanting a DUT.
    up_counter DUT (.clk(clk), .rst(rst), .counter_up(counter_up));
    
    // Clock generation.
    initial begin
        clk = 0;
        forever clk = ~clk;
    end

    // Now onto the actual testbench.
    initial begin
        // Initially rst should be set to 1.
        rst = 1;

        // Then on the negedge of the clk, we should return it to 0.
        @(negedge clk);
        rst = 0;

        // Since it's an up-counter, we simply need to get time to pass.
        repeat(100) @(negedge clk);
        $stop;
    end

    // Now onto monitoring, done on a separate block.
    initial begin
        $monitor("counter = %b, rst = %b.", counter_up, rst);
    end

endmodule