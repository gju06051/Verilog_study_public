module half_adder(
    input   A_i,
    input   B_i,
    output  S_o,
    output  C_o
);

    assign S_o = A_i ^ B_i;
    assign C_o = A_i & B_i;

endmodule 