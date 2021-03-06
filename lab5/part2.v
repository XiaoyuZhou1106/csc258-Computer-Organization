module mux(SW, KEY, CLOCK_50, HEX0);
    input [1:0] SW;
	 input [2:0] KEY;
	 input CLOCK_50;
	 output [6:0] HEX0;
	 wire connect;
	 wire [3:0] Q;

		  
	 RateDivider a(
		  .m(SW[1]),
		  .n(SW[0]),
		  .clock(CLOCK_50),
		  .out(connect)
		  );
		  
	 DisplayCounter b(
		  .enable(connect),
		  .reset_n(KEY[0]),
		  .clock2(CLOCK_50),
		  .q(Q[3:0])
		  );
	 
	 hex u0(
		  .in2(Q[3]),
		  .in3(Q[2]),
		  .in4(Q[1]),
		  .in5(Q[0]),
		  .o2(HEX0[0]),
		  .o3(HEX0[1]),
		  .o4(HEX0[2]),
		  .o5(HEX0[3]),
		  .o6(HEX0[4]),
		  .o7(HEX0[5]),
		  .o8(HEX0[6])
		  );
		  
endmodule


module RateDivider(m, n, clock, out);
    parameter N = 28;
    input m, n;
	 input clock;
	 output out;
	 reg [N-1:0] count;
	 reg out;
	 
	 always @(posedge clock)
	 begin
		  if (m == 0)
		      begin
					if (n == 0)
						assign count = clock;
					else if (n == 1)
						 begin
							 if (count == 28'b0010111110101111000001111111)
								  count <= 0;
							 else
								  count <= count + 1'b1;  
						 end
				 end
		      
		   else if (m == 1)
		      begin
				    if (n == 0)
							begin
								 if (count == 28'b0101111101011110000011111111)
									  count <= 0;
								 else
									  count <= count + 1'b1;
									 
							end
			
					  else if (n == 1)
							begin
								 if (count == 28'b1011111010111100000111111111)
									  count <= 0;
								 else
									  count <= count + 1'b1;
							end
				 end

		  if (count == 0)
				out <= 1;
		  else 
				out <= 0;
	 end
endmodule

		      
module DisplayCounter(enable, reset_n, clock2, q);
    parameter k = 4;
    input enable, reset_n, clock2;
    output [k-1:0] q;
    reg [k-1:0] q;
    
    always @(posedge clock2)
    begin
        if (reset_n == 1'b0)
		      q <= 0;
		  else if (enable == 1'b1)
		      begin
		          if (q == 4'b1111)
				        q <= 0;
					 else
				        q <= q + 1'b1;
				end
	 end		
endmodule


module hex(in2, in3, in4, in5, o2, o3, o4, o5, o6, o7, o8);
    input in2;
	 input in3;
	 input in4;
	 input in5;
    output o2;
	 output o3;
	 output o4;
	 output o5;
	 output o6;
	 output o7;
	 output o8;

    hex0 u1(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out1(o2)
        );
		  
    hex1 u2(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out2(o3)
        );
    
	 hex2 u3(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out3(o4)
        ); 
		  
    hex3 u4(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out4(o5)
        );
		 
    hex4 u5(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out5(o6)
        ); 
		  
    hex5 u6(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out6(o7)
        );
		 
    hex6 u7(
        .c3(in2),
        .c2(in3),
		  .c1(in4),
        .c0(in5),
        .out7(o8)
        );
endmodule

module hex0(c3, c2, c1, c0, out1);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out1; //output
  
    assign out1 = ~c3 & c2 & ~c1 & ~c0 | c3 & c2 & ~c1 & c0 | c3 & ~c2 & c1 & c0 | ~c3 & ~c2 & ~c1 & c0;

endmodule

module hex1(c3, c2, c1, c0, out2);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out2; //output
  
    assign out2 = c2 & c1 & ~c0 | c3 & c1 & c0 | ~c3 & c2 & ~c1 & c0 | c3 & c2 & ~c0;

endmodule

module hex2(c3, c2, c1, c0, out3);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out3; //output
  
    assign out3 = ~c3 & ~c2 & c1 & ~c0 | c3 & c2 & c1 | c3 & c2 & ~c0;

endmodule

module hex3(c3, c2, c1, c0, out4);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out4; //output
  
    assign out4 = ~c3 & c2 & ~c1 & ~c0 | ~c2 & ~c1 & c0 | c2 & c1 & c0 | c3 & ~c2 & c1 & ~c0;

endmodule

module hex4(c3, c2, c1, c0, out5);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out5; //output
  
    assign out5 = ~c3 & c2 & ~c1 | ~c2 & ~c1 & c0 | ~c3 & c0;

endmodule

module hex5(c3, c2, c1, c0, out6);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out6; //output
  
    assign out6 = ~c3 & ~c2 & c0 | ~c3 & ~c2 & c1 | ~c3 & c1 & c0 | c3 & c2 & ~c1 & c0;

endmodule

module hex6(c3, c2, c1, c0, out7);
    input c3; //selected when s is 0
    input c2; //selected when s is 1
    input c1; //select signal
	 input c0;
    output out7; //output
  
    assign out7 = ~c3 & ~c2 & ~c1 | c3 & c2 & ~c1 & ~c0 | ~c3 & c2 & c1 & c0;

endmodule
