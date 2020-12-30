module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;
	 wire connect1, connect2, connect3;

    full_adder a(
        .A(SW[1]),
		  .B(SW[2]),
		  .cin(SW[0]),
		  .S(LEDR[0]),
		  .cout(connect1)
        );
		  
    full_adder b(
        .A(SW[3]),
		  .B(SW[4]),
		  .cin(connect1),
		  .S(LEDR[1]),
		  .cout(connect2)
        );

     full_adder c(
        .A(SW[5]),
		  .B(SW[6]),
		  .cin(connect2),
		  .S(LEDR[2]),
		  .cout(connect3)
        );  
		  
	  full_adder d(
        .A(SW[7]),
		  .B(SW[8]),
		  .cin(connect3),
		  .S(LEDR[3]),
		  .cout(LEDR[4])
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

