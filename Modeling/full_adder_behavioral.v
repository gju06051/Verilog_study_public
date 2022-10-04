module full_adder_behavioral (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

    always @(*) begin
        {cout, sum} = a + b + cin; 
    end        

endmodule //full_adder_behavioral