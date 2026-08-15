// Trying to make sense of FSMs attempt #1.
// Some stuff to keep in mind: "State Memory" i.e. (CS <= STO and CS <= NS) is purely sequential,
// while next state logic can be sequential or combinational.
// Let's start with this simple example.

// Starting with two process FSMs (Moore).

/*
 * FSM STATE DIAGRAM (Moore Machine)
 *
 *                       [Reset]
 *                          |
 *                          v
 *                    ( ST0: Y=1 )
 *                    ^            \
 *                   /               \
 *                  /                  v
 *     ( ST3: Y=4 ) <------- X ------- ( ST1: Y=2 )
 *                  ^                  /
 *                   \               /
 *                    \            v
 *                    ( ST2: Y=3 )
 *
 */

 module two_process_fsm(input clk, input rst, input x, output reg y);
 
    reg cs, ns;
    parameter st0 = 00, st1 = 01, st2 = 10, st3 = 11;
    // Starting with said "State Memory", sequential in nature.
    always@(posedge clk) begin
        // Active high, synchronus.
        if(rst) begin
            cs <= st0;
        end
        else begin
            cs <= ns;
        end
    end

    // Combinational logic.
    always@(cs or x) begin
        case(cs)
        
        st0: begin
            y=1; 
            ns = st1;
        end

        st1: begin
            if(x) ns = st3;
            else begin
                ns = st2;
            end
            y = 2;
        end

        st2: begin
            ns = st3;
            y = 3;
        end

        st3: begin
            ns = st0;
            y = 4;
        end
        default: begin
            y=1;
            ns = st0;
        end
        endcase
    end
 endmodule

 module fsm_3p (input clk, input rst, input x, output reg y);
    // Params for the states.
    parameter st0 = 00, st1 = 01, st2 = 10, st3 = 11;
    reg cs, ns;

    // "State Memory", sequential, async reset.
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            cs <= st0;
        end
        else begin
            cs <= ns;
        end
    end

    // Next state logic, combinational.
    always@(cs or x) begin
        case(cs)
            st0: ns = st1;
            st1:begin
                if (x) ns = st2;
                else ns = st3;
            end
            st2: ns = st3;
            st3: ns = st0;
            default: ns = st0;
        endcase
    end

    // Output logic, combinational.
    always@(cs) begin
        case (cs)
            st0: y = 1;
            st1: y = 2;
            st2: y = 3;
            st3: y = 4;
            default: y = 1;
        endcase
    end
 endmodule