module mux(SW, KEY, CLOCK_50, LEDR);
    input [2:0] SW;
	 input [2:0] KEY;
	 input CLOCK_50;
	 output [1:0] LEDR;
	 wire connect;
	 wire [11:0] Q;

		  
	 RateDivider a(
		  .clock(CLOCK_50),
		  .out(connect)
		  );
		  
	 DisplayCounter b(
		  .enable(connect),
		  .reset_n(KEY[0]),
		  .in(q[11:0]),
		  .start(KEY[1]0,
		  .clock2(CLOCK_50),
		  .L(LEDR[0])
		  );
		  
	 LUT c(
	     .m(SW[2]),
		  .n(SW[1]),
		  .o(SW[0]),
		  .outt(Q[11:0])
		  );
		  
endmodule


module RateDivider(clock, out);
    parameter N = 25;
	 input clock;
	 output out;
	 reg [N-1:0] count;
	 reg out;
	 
	 always @(posedge clock)
	 begin
		 if (count == 25'b1011111010111100001000000)
			  count <= 0;
		 else
			  count <= count + 1'b1;  

		 if (count == 0)
			  out <= 1;
   	 else 
			  out <= 0;
	 end
endmodule

		      
module ShiftRegister(enable, reset_n, in, start, clock2, L);
    parameter k = 11;
	 parameter s = 3;
    input enable, reset_n, start, clock2;
	 input [k-1:0] in;
    output L;
	 wire [s-1:0] q;
    
    always @(posedge clock2, posedge reset_n)
    begin
        if (reset_n == 1'b0)
		      q <= 0;
		  else if (start == 1'b1)
		      q <= 0;
		  else if (enable == 1'b1)
		      begin
		          if (q == 4'b1111)
				        q <= 0;
					 else
				        q <= q + 1'b1;
				end
	 end
    
    always @(posedge clock2, posedge reset_n)
	 begin
	    case(q)
		   4'b0000: L = 0;
			4'b0001: L = in[10];
			4'b0010: L = in[9];
			4'b0011: L = in[8];
			4'b0100: L = in[7];
			4'b0101: L = in[6];
			4'b0110: L = in[5];
			4'b0111: L = in[4];
			4'b1000: L = in[3];
			4'b1001: L = in[2];
			4'b1010: L = in[1];
			4'b1011: L = in[0];
			default L = 0
	     endcase
	 end
endmodule


module LUT(m, n, o, outt);
    parameter a = 11;
	 input m, n, o;
	 output [a-1:0] outt;
	 
	 always @(*)
	 begin	 
		case(in1)
			3'b000: outt = 11'b10111000000;
			3'b001: outt = 11'b11101010100;
			3'b010: outt = 11'b11101011101
			3'b011: outt = 11'b11101010000;
			3'b100: outt = 11'b10000000000;
			3'b101: outt = 11'b10101110100;
			3'b110: outt = 11'b11101110100;
			3'b111: outt = 11'b10101010000;
			default: out1 = 11'b0000_0000_000;
	   endcase
	 end
endmodule
