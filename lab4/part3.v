module mux(LEDR, SW, KEY);
    input [9:0] SW;
	 input [3:0] KEY;
	 output [9:0] LEDR;
	 wire getout1, getout2, getout3, getout4, getout5, getout6, getout7,getout8;  
	 
	 mux2to1 M1(
	     .x(1'b0),
		  .y(LEDR[7]),
		  .s(KEY[3]),
		  .m(getout1)
		  );
	
	 ShifterBit B1(
	     .load_val(SW[7]),
		  .in(getout1),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout2)
		  );
	 
	 assign LEDR[7] = getout2;
	 
	 ShifterBit B2(
	     .load_val(SW[6]),
		  .in(getout2),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout3)
		  );
	 
	 assign LEDR[6] = getout3;
		  
	 ShifterBit B3(
	     .load_val(SW[5]),
		  .in(getout3),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout4)
		  );
	
	 assign LEDR[5] = getout4;
		  
	 ShifterBit B4(
	     .load_val(SW[4]),
		  .in(getout4),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout5)
		  );
	 
	 assign LEDR[4] = getout5;
		  
	 ShifterBit B5(
	     .load_val(SW[3]),
		  .in(getout5),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout6)
		  );
	 
	 assign LEDR[3] = getout6;
	 
	 ShifterBit B6(
	     .load_val(SW[2]),
		  .in(getout6),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout7)
		  );
	 
	 assign LEDR[2] = getout7;
		  
	 ShifterBit B7(
	     .load_val(SW[1]),
		  .in(getout7),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(getout8)
		  );
	 
	 assign LEDR[1] = getout8;
	 
	 ShifterBit B8(
	     .load_val(SW[0]),
		  .in(getout8),
		  .shift(KEY[2]),
		  .load_n(KEY[1]),
		  .clk(KEY[0]),
		  .reset_n(SW[9]),
		  .out(LEDR[0])
		  );
endmodule
 
module ShifterBit(load_val, in, shift, load_n, clk, reset_n, out);
    input load_val, in, shift, load_n, clk, reset_n;
	 output out;
	 wire connect1, connect2;
	 
	 mux2to1 M2(
	     .x(out),
		  .y(in),
		  .s(shift),
		  .m(connect1)
		  );
	 
	 mux2to1 M3(
	     .x(load_val),
		  .y(connect1),
		  .s(load_n),
		  .m(connect2)
		  );
	 
	 D_flipflop D1(
	     .d(connect2),
		  .clock(clk),
		  .reset_n(reset_n),
		  .q(out)
		  );
endmodule
	  
		  
module mux2to1(x, y, s, m);
    input x; //selected when s is 0
    input y; //selected when s is 1
    input s; //select signal
    output m; //output
  
    assign m = s & y | ~s & x;
endmodule

module D_flipflop(d, clock, reset_n, q);
	 parameter N = 1;
    input [N-1:0] d;
	 input [N-1:0] clock;
	 input [N-1:0] reset_n;
	 output [N-1:0] q;
	 reg [N-1:0] q;
	 
	 always @(posedge clock)
	 begin	 
		if (reset_n == 1'b0)
		    q <= 0;
		else
		    q <= d;
	 end
endmodule
