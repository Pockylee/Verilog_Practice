`include "0717001_hw2.v"
module sort_tb;
    reg clk;
    reg  [4-1:0] in1,  in2,  in3,  in4,  in5, in6, in7, in8;
    wire [4-1:0] out1, out2, out3, out4, out5, out6, out7, out8;

    sort dut (
        .A ({in1,  in2,  in3,  in4,  in5, in6, in7, in8}),
        .B({out1, out2, out3, out4, out5, out6, out7, out8})
    );

    always @(posedge clk) begin
        in1 <= 5;
        in2 <= 2;
        in3 <= 14;
        in4 <= 11;
        in5 <= 15;
        in6 <= 3;
        in7 <= 7;
        in8 <= 6;
    end

    /*always @(posedge clk) begin
        
    end*/

    initial begin
        $monitor("In:  %0d %0d %0d %0d %0d %0d %0d %0d", in1,  in2,  in3,  in4,  in5, in6, in7, in8);
        $monitor("Out: %0d %0d %0d %0d %0d %0d %0d %0d", out1, out2, out3, out4, out5, out6, out7, out8);
    end

    initial begin
        #100;
        $finish;
    end

    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    initial
    begin
        $dumpfile("tt.vcd");
        $dumpvars;
    end
endmodule