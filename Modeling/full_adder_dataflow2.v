module full_adder_dataflow2 (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);
    assign {cout, sum} = a + b + cin;

endmodule //full_adder_dataflow2