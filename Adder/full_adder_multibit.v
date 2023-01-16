module full_adder_multibit (
    input           A_i,
    input           B_i,
    input           C_i,
    output  [1:0]   F_o
);

    assign  F_o[1] = A_i ^ B_i ^ C_i;
    assign  F_o[0] = ((A_i ^ B_i) & C) | (A & B);

endmodule