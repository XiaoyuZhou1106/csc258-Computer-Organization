module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    mux1 u1(
        .in1(SW[0]),
        .in2(SW[1]),
		  .in3(SW[2]),
		  .in4(SW[3]),
		  .in5(SW[4]),
		  .in6(SW[5]),
		  .in7(SW[6]),
		  .m(SW[9:7]),
        .out1(LEDR[0])
        );
		  
endmodule

module mux1(in1, in2, in3, in4, in5, in6, in7, m, out1);
	 parameter W = 3;
    input in1;
	 input in2;
	 input in3;
	 input in4;
	 input in5;
	 input in6;
	 input in7;
	 input [W-1:0] m;
    output out1; //output
	 reg out1;
	 
	 always @(*)
	 begin	 
		case(m)
			3'b000: out1 = in1;
			3'b001: out1 = in2;
			3'b010: out1 = in3;
			3'b011: out1 = in4;
			3'b100: out1 = in5;
			3'b101: out1 = in6;
			3'b110: out1 = in7;
			default: out1 = in1;
	   endcase
	 end
endmodule
