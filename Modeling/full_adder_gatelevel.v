//This is for the 1-bit full adder module.

module full_adder_gatelevel_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;


	// xor_out_1 and xnor_out_2 is not used
	// wire xor_out_1;
	wire xnor_out_1;
	// xnor_out_2;
	// wire not_out_1;

	wire and_out_1, and_out_2, and_out_3;
	wire or_out_1;

	//sum = (a⊙b)⊙(cin)
	//Fill this out
	xnor_gatelevel_gate xnor_1 (.a(a), .b(b), .out(xnor_out_1));
	xnor_gatelevel_gate xnor_2 (.a(xnor_out_1), .b(cin), .out(sum));
	
	//cout = b(cin) + a(cin) + ab
	//Fill this out
	and_gate and_1 (.a(b), .b(cin), .out(and_out_1));
	and_gate and_2 (.a(a), .b(cin), .out(and_out_2));
	and_gate and_3 (.a(a), .b(b), .out(and_out_3));
	
	or_gate or_1 (.a(and_out_1), .b(and_out_2), .out(or_out_1));
	or_gate or_2 (.a(or_out_1), .b(and_out_3), .out(cout));
	
endmodule