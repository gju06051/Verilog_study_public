module wire_use (
    input   A_i,
    input   B_i,
    input   D_i,
    output  E_o
);

    wire    C_w;
    
    assign  C_w = A_i & B_i;
    assign  E_o = C_w | D_i;
endmodule