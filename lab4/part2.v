module mux(LEDR, SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    parameter Narrow = 8;
    wire [Narrow-1:0] outt;
    input [9:0] SW;
	 input [2:0] KEY;
    output [9:0] LEDR;
	 output [6:0] HEX0;
	 output [6:0] HEX1;
	 output [6:0] HEX2;
	 output [6:0] HEX3;
	 output [6:0] HEX4;
	 output [6:0] HEX5;

		  
	 trans u1(
        .A(SW[3:0]),
        .B(LEDR[3:0]),
		  .in1(SW[7:5]),
        .out1(outt)
        );
		  
	 D_flipflop a(
		  .d(outt),
		  .clock(KEY[0]),
		  .reset_n(SW[9]),
		  .q(LEDR[7:0])
		  );
	 
	 hex u2(
		  .in2(LEDR[3]),
		  .in3(LEDR[2]),
		  .in4(LEDR[1]),
		  .in5(LEDR[0]),
		  .o2(HEX4[0]),
		  .o3(HEX4[1]),
		  .o4(HEX4[2]),
		  .o5(HEX4[3]),
		  .o6(HEX4[4]),
		  .o7(HEX4[5]),
		  .o8(HEX4[6])
		  );
	 
	 hex u3(
		  .in2(LEDR[7]),
		  .in3(LEDR[6]),
		  .in4(LEDR[5]),
		  .in5(LEDR[4]),
		  .o2(HEX5[0]),
		  .o3(HEX5[1]),
		  .o4(HEX5[2]),
		  .o5(HEX5[3]),
		  .o6(HEX5[4]),
		  .o7(HEX5[5]),
		  .o8(HEX5[6])
		  );
	 
	 hex A(
		  .in2(SW[3]),
		  .in3(SW[2]),
		  .in4(SW[1]),
		  .in5(SW[0]),
		  .o2(HEX0[0]),
		  .o3(HEX0[1]),
		  .o4(HEX0[2]),
		  .o5(HEX0[3]),
		  .o6(HEX0[4]),
		  .o7(HEX0[5]),
		  .o8(HEX0[6])
		  );
		  

	 
	 assign HEX1[6] = 1;
	 assign HEX1[5] = 1;
	 assign HEX1[4] = 1;
	 assign HEX1[3] = 1;
	 assign HEX1[2] = 1;
	 assign HEX1[1] = 1;
	 assign HEX1[0] = 1;
	 
	 assign HEX2[6] = 1;
	 assign HEX2[5] = 1;
	 assign HEX2[4] = 1;
	 assign HEX2[3] = 1;
	 assign HEX2[2] = 1;
	 assign HEX2[1] = 1;
	 assign HEX2[0] = 1;
	 
	 assign HEX3[6] = 1;
	 assign HEX3[5] = 1;
	 assign HEX3[4] = 1;
	 assign HEX3[3] = 1;
	 assign HEX3[2] = 1;
	 assign HEX3[1] = 1;
	 assign HEX3[0] = 1;
		  
endmodule

module D_flipflop(d, clock, reset_n, q);
	 parameter Narrow = 8;
	 parameter N = 1;
    input [Narrow-1:0] d;
	 input [N-1:0] clock;
	 input [N-1:0] reset_n;
	 output [Narrow-1:0] q;
	 reg [Narrow-1:0] q;
	 
	 always @(posedge clock)
	 begin	 
		if (reset_n == 1'b0)
		    q <= 0;
		else
		    q <= d;
	 end
endmodule

module trans(A, B, in1, out1);
    parameter Width = 8;
	 parameter Narrow = 4;
	 parameter W = 3;
    input [Narrow-1:0] A;
	 input [Narrow-1:0] B;
	 input [W-1:0] in1;
    output [Width-1:0]out1;
	 reg [Width-1:0]out1;
	 wire c_out1, c_out2;
	 wire [Narrow-1:0] s_out1;
	 wire [Narrow-1:0] s_out2;
	 
	 adder b1(
	     .a(A),
		  .b(B),
		  .c(1'b0),
		  .outc(c_out1),
		  .outs(s_out1)
		  );
	 
	 adder b2(
	     .a(A),
		  .b(4'b0001),
		  .c(1'b0),
		  .outc(c_out2),
		  .outs(s_out2)
		  );
		  
	 always @(*)
	 begin	 
		case(in1)
			3'b000: out1 = A * B;
			3'b001: out1 = {A | B, A ^ B};
			3'b010: out1 = {c_out1, s_out1};
			3'b011: out1 = A + B;
			3'b100: out1 = {c_out2, s_out2};
			3'b101: out1 = |A | |B;
			3'b110: out1 = B << A;
			3'b111: out1 = B >> A;
			default: out1 = 8'b0000_0000;
	   endcase
	 end
endmodule

module adder(a, b, c, outc, outs);
    parameter Narrow = 4;
    input [Narrow-1:0] a;
	 input [Narrow-1:0] b;
	 input c;
    output outc;
	 output [Narrow-1:0] outs;
	 wire connect1, connect2, connect3;

    full_adder e(
        .A(a[0]),
		  .B(b[0]),
		  .cin(c),
		  .S(outs[0]),
		  .cout(connect1)
        );
		  
    full_adder f(
        .A(a[1]),
		  .B(b[1]),
		  .cin(connect1),
		  .S(outs[1]),
		  .cout(connect2)
        );

     full_adder g(
        .A(a[2]),
		  .B(b[2]),
		  .cin(connect2),
		  .S(outs[2]),
		  .cout(connect3)
        );  
		  
	  full_adder h(
        .A(a[3]),
		  .B(b[3]),
		  .cin(connect3),
		  .S(outs[3]),
		  .cout(outc)
        );  
endmodule

module full_adder(A, B, cin, S, cout);
    input A; 
    input B;
	 input cin; 
    output S;
	 output cout;
  
    assign cout = A&B | A&cin | B&cin;
	 assign S = A ^ B ^ cin;

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
