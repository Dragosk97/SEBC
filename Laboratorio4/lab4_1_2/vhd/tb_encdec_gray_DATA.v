`timescale 1ns/1ps
//`define ADDRESS	// uncomment for address analysis
`define DATA	// uncomment for data analysis
module testbench();

	// inputs of the DUT.
	reg [7:0] Ain;
	reg ck, rst;
	
	// outputs of the DUT.
	wire [7:0] AGRAYENC, CGRAYENC;
	wire [7:0] COUNTGRAYENC;

	// just for power report.
	wire CK, RST;
	wire [7:0] A;
	
	// file descriptor
	integer infile, count;
	
	// store each line of file
	reg [7:0] line;
	
	parameter CLOCK_PERIOD = 10;
	parameter DELAY = 0.1;

	// component businvbeh

	grayencoder UGRAYENC (
		.ck(ck),
		.rst(rst),
		.A(AGRAYENC),
		.B(COUNTGRAYENC),
		.C(CGRAYENC)
	);

	// component transbases

	// component grayencoder

	// component t0encdec
	
	
	// Executed only once at the beginning of the simulation
	initial
	 begin
		ck = 1'b0;
		rst = 1'b0;
		Ain = 0;
		#0.1;
		rst = 1'b1;
		#0.2;
		rst = 1'b0;
	end
	
	initial
	begin
		infile = $fopen("rndin.txt", "r");
		if (infile == 0) begin
			$display("infile descriptor is NULL");
			$finish;
		end
	end
	
	// clock generation
	always
	begin
		#(CLOCK_PERIOD/2.0)ck <= ~ck;
	end
	
`ifdef ADDRESS
    // add like inputs
	always @(posedge ck or posedge rst)
	begin
		if (rst) begin
			Ain <= 0;
		end
		else begin
			if(!$feof(infile)) begin
				count = $fscanf(infile, "%b\n", line);
				if(A == 63) begin
					#DELAY Ain[7:6] <= line[7:6];
					#DELAY Ain[5:0] <= 6'b0;
				end
				else begin
					#DELAY Ain <= Ain + 1;
				end
			end
	    end
	end
`endif
	
`ifdef DATA
	// data like inputs
	always @(posedge ck or posedge rst)
	begin
		if (rst) begin
			Ain <= 0;
		end
		else begin
			if(!$feof(infile)) begin
				count = $fscanf(infile, "%b\n", line);
				// data with almost equal 1 and 0 probability
				#DELAY Ain <= line;
			end
		end
	end
`endif
	
	assign AGRAYENC = Ain;
	assign A = Ain;
	assign CK = ck;
	assign RST = rst;

	        
endmodule
