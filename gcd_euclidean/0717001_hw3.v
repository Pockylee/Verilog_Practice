module gcd_top(clk, reset, A, B, C, start, D, valid);
input clk;
input reset;
input wire [16-1:0] A;
input wire [16-1:0] B;
input wire [16-1:0] C;
input wire  start;
output reg [16-1:0] D;
output reg valid;

reg [16-1:0] a, b, c;
reg [16-1:0] ans_ab;
reg done_first_stage;

always @(posedge clk, posedge reset)begin
    if (start || reset)begin
        a <= A;
        b <= B;
        c <= C;
        valid <= 0;
        done_first_stage <= 0;
    end
    else if (done_first_stage == 0)begin
        if (b == 0 )begin
            ans_ab <= a;
            done_first_stage <= 1;
        end
        else if (a > b)begin
            a <= a - b;
        end
        else begin
            b <= b - a;
        end
    end
    else if (done_first_stage == 1)begin
        if (c == 0)begin
            D <= ans_ab;
            valid <= 1;
        end
        else if (ans_ab > c)begin
            ans_ab <= ans_ab - c;
        end
        else begin
            c <= c - ans_ab;
        end
    end
end
endmodule