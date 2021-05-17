module sort(input [31:0] A,output [31:0] B);
	
	reg [31:0] Output_Arr;
	integer i, j;
	reg [3:0] temp;
	reg [3:0] Arr [0:7];


	always @(*)
		begin
		Arr[0] = A[31:28];
		Arr[1] = A[27:24];
		Arr[2] = A[23:20];
		Arr[3] = A[19:16];
		Arr[4] = A[15:12];
		Arr[5] = A[11:8];
		Arr[6] = A[7:4];
		Arr[7] = A[3:0];

		for (i = 7; i >= 0; i = i - 1) begin
			for (j = 0; j < i; j = j + 1) begin
				if (Arr[j] < Arr[j + 1])
				begin
					temp = Arr[j];
					Arr[j] = Arr[j + 1];
					Arr[j + 1] = temp;
				end
			end
		end

		Output_Arr[31:28] = Arr[0];
		Output_Arr[27:24] = Arr[1];
		Output_Arr[23:20] = Arr[2];
		Output_Arr[19:16] = Arr[3];
		Output_Arr[15:12] = Arr[4];
		Output_Arr[11:8] = Arr[5];
		Output_Arr[7:4] = Arr[6];
		Output_Arr[3:0] = Arr[7];
		
	end
	assign B = Output_Arr;
endmodule