module or_gate(
    input   A_i,
    input   B_i,
    output  F_o
);

    assign F_o = A_i | B_i;
    
endmodule