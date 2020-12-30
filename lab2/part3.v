module mux(HEX0, SW);
    input [9:0] SW;
    output [6:0] HEX0;

    hex0 u1(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out1(HEX0[0])
        );
		  
    hex1 u2(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out2(HEX0[1])
        );
    
	 hex2 u3(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out3(HEX0[2])
        ); 
		  
    hex3 u4(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out4(HEX0[3])
        );
		 
    hex4 u5(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out5(HEX0[4])
        ); 
		  
    hex5 u6(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out6(HEX0[5])
        );
		 
    hex6 u7(
        .c3(SW[3]),
        .c2(SW[2]),
		  .c1(SW[1]),
        .c0(SW[0]),
        .out7(HEX0[6])
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

