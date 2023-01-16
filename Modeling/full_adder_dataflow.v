
//This is for the 1-bit full adder module.

module full_adder_dataflow_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	
	//sum   = ab’(cin)’ + a’b’(cin) + ab(cin) + a’b(cin)’
	//      = (a⊙b)⊙(cin)
	//Fill this out
	assign sum = ((a)&(!b)&(!cin))
				|((!a)&(!b)&(cin))
				|((a)&(b)&(cin))
				|((!a)&(b)&(!cin));

	//cout = b(cin) + a(cin) + ab
	//Fill this out
	assign cout = (b&cin)|(a&cin)|(a&b);
	
	
endmodule