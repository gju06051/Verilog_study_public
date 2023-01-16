module full_adder (
    input   A_i,
    input   B_i,
    input   C_i,
    output  S_o,
    output  C_o
);

    assign  S_o = A_i ^ B_i ^ C_i;
    assign  C_o = ((A_i ^ B_i) & C) | (A & B);

endmodule