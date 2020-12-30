module mux(SW, KEY, HEX0, HEX1);
    wire [7:0] Q;
    input [1:0] SW;
	 input [2:0] KEY;
	 output [6:0] HEX0;
	 output [6:0] HEX1;

		  
	 counter a(
		  .enable(SW[1]),
		  .clock(KEY[0]),
		  .clearb(SW[0]),
		  .Q(Q[7:0])
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
	 
	 hex u1(
		  .in2(Q[7]),
		  .in3(Q[6]),
		  .in4(Q[5]),
		  .in5(Q[4]),
		  .o2(HEX1[0]),
		  .o3(HEX1[1]),
		  .o4(HEX1[2]),
		  .o5(HEX1[3]),
		  .o6(HEX1[4]),
		  .o7(HEX1[5]),
		  .o8(HEX1[6])
		  );
		  
endmodule

module counter(enable, clock, clearb, Q);
    input enable;
	 input clock;
	 input clearb;
    output [7:0] Q;
	 wire in1, in2, in3, in4, in5, in6, in7, in8;

		  
	 T_flipflop a(
		  .T(enable),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[7])
		  );
	 
	 assign in1 = enable & Q[7];
		 
	 T_flipflop b(
		  .T(in1),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[6])
		  );
		  
	 assign in2 = in1 & Q[6];
	 
	 T_flipflop c(
		  .T(in2),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[5])
		  );
		  
	 assign in3 = in2 & Q[5];
	
	 T_flipflop d(
		  .T(in3),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[4])
		  );
		  
	 assign in4 = in3 & Q[4];
		  
	 T_flipflop e(
		  .T(in4),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[3])
		  );
		  
	 assign in5 = in4 & Q[3];
	 
	 T_flipflop f(
		  .T(in5),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[2])
		  );
		  
	 assign in6 = in5 & Q[2];
	 
	 T_flipflop g(
		  .T(in6),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[1])
		  );
		  
	 assign in7 = in6 & Q[1];
	 
	 T_flipflop h(
		  .T(in7),
		  .clock(clock),
		  .c(clearb),
		  .Q(Q[0])
		  );
endmodule

module T_flipflop(T, clock, c, Q);
	 parameter N = 1;
    input T;
	 input [N-1:0] clock;
	 input [N-1:0] c;
	 output Q;
	 wire connect;
	 
	 assign connect = T ^ Q;
	 
	 D_flipflop dd(
		  .d(connect),
		  .clock(clock),
		  .reset_n(c),
		  .q(Q)
		  );	 
endmodule

module D_flipflop(d, clock, reset_n, q);
    parameter N = 1;
    input d;
	 input [N-1:0] clock;
	 input [N-1:0] reset_n;
	 output q;
	 reg q;
	 
	 always @(posedge clock, negedge reset_n)
	 begin	 
		if (reset_n == 1'b0)
		    q <= 0;
		else
		    q <= d;
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
