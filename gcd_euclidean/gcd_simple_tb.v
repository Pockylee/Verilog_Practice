`timescale 1ns/1ps
`include "0717001_hw3.v"
module gcd_simple_tb;

real CYCLE=1000;

// Input signals
reg clk;
reg reset;
reg start_input;
reg [15:0] A_input;
reg [15:0] B_input;
reg [15:0] C_input;
// Output signals
wire valid_out;
wire [15:0] D_out;

// other
reg [15:0] correct_data;
integer i;

gcd_top dut(
	.clk(clk),
	.reset(reset),
	.A(A_input),
	.B(B_input),
	.C(C_input),
	.start(start_input),
	.D(D_out),
	.valid(valid_out)
);


initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

initial begin
    // Setup the signal dump file.
    $dumpfile("gcd_simple.vcd"); // Set the name of the dump file.
    $dumpvars;                   // Save all signals to the dump file.

    // Display the signal values whenever there is a change.
    //$monitor("valid_in = %b,A = %d,B = %d,valid_out = %b,C = %d",
    //            valid_in, A_input, B_input, valid_out, C_out);

    // Initialize the input signals

    A_input = 0;
    B_input = 0;
    C_input = 0;
    start_input = 0;
    clk = 0;
    reset = 0;
    @(posedge clk); //Initialize reset
    #1; 			//Simulate flip-flop delay
    reset = 1;      //positive reset
    @(posedge clk); //Initialize reset
    #1; 			//Simulate flip-flop delay
    reset = 0;

    @(posedge clk);
    #1; //Simulate flip-flop delay

	// hint: Try to use $urandom to generate random case or write some case by yourself.
	A_input = 16'd16;
	B_input = 16'd8;
	C_input = 16'd4;
	correct_data = 16'd4;

    start_input = 1;
	@(posedge clk);
    #1; //Simulate flip-flop delay
    start_input = 0;
	@(posedge clk);
    #1; //Simulate flip-flop delay

	//Note: Your program should not finish this case in one cycle.
	while (!valid_out) begin
		@(posedge clk);
		#1; //Simulate flip-flop delay
		// Please write some code to test the start signal is activated again
		// before the previous computation is finished case.
	end

    if (D_out == correct_data) begin
        $display("=========================");
        $display("Congratulations!!! Case 1 pass");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
        $display("=========================");
    end else begin
        $display("Case 1 failed");
        $display("some errors happened!!!");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
        @(posedge clk);
        $finish;
    end

    @(posedge clk);
    #1; //Simulate flip-flop delay

	// hint: Try to use $urandom to generate random case or write some case by yourself.
	A_input = 16'd3571;
	B_input = 16'd2711;
	C_input = 16'd1543;
	correct_data = 16'd1;

    start_input = 1;
	@(posedge clk);
    #1; //Simulate flip-flop delay
    start_input = 0;
	@(posedge clk);
    #1; //Simulate flip-flop delay

	//Note: Your program should not finish this case in one cycle.

    while (!valid_out) begin
		@(posedge clk);
		#1; //Simulate flip-flop delay    
		// Please write some code to test the start signal is activated again
		// before the previous computation is finished case.
	end

    if (D_out == correct_data) begin
        $display("=========================");
        $display("Congratulations!!! Case 2 pass");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
        $display("Now try to modify this testbench to test input cases consecutively!!!");
        $display("=========================");
    end else begin
        $display("Case 2 failed");
        $display("some errors happened!!!");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
    end

    @(posedge clk);
    #1; //Simulate flip-flop delay

	// hint: Try to use $urandom to generate random case or write some case by yourself.
	A_input = 16'd479;
	B_input = 16'd654;
	C_input = 16'd217;
	correct_data = 16'd1;

    start_input = 1;
	@(posedge clk);
    #1; //Simulate flip-flop delay
    start_input = 0;
	@(posedge clk);
    #1; //Simulate flip-flop delay

	//Note: Your program should not finish this case in one cycle.

    while (!valid_out) begin
		@(posedge clk);
		#1; //Simulate flip-flop delay    
		// Please write some code to test the start signal is activated again
		// before the previous computation is finished case.
	end

    if (D_out == correct_data) begin
        $display("=========================");
        $display("Congratulations!!! Case 3 pass");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
        $display("Now try to modify this testbench to test input cases consecutively!!!");
        $display("=========================");
    end else begin
        $display("Case 3 failed");
        $display("some errors happened!!!");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
    end
 @(posedge clk);
    #1; //Simulate flip-flop delay

	// hint: Try to use $urandom to generate random case or write some case by yourself.
	A_input = 16'd345;
	B_input = 16'd765;
	C_input = 16'd095;
	correct_data = 16'd5;

    start_input = 1;
	@(posedge clk);
    #1; //Simulate flip-flop delay
    start_input = 0;
	@(posedge clk);
    #1; //Simulate flip-flop delay

	//Note: Your program should not finish this case in one cycle.

    while (!valid_out) begin
		@(posedge clk);
		#1; //Simulate flip-flop delay    
		// Please write some code to test the start signal is activated again
		// before the previous computation is finished case.
	end

    if (D_out == correct_data) begin
        $display("=========================");
        $display("Congratulations!!! Case 4 pass");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
        $display("Now try to modify this testbench to test input cases consecutively!!!");
        $display("=========================");
    end else begin
        $display("Case 4 failed");
        $display("some errors happened!!!");
        $display("A: %d, B: %d, C: %d, D: %d",A_input,B_input,C_input,D_out);
    end
    
    @(posedge clk);
    $finish;
end

endmodule



