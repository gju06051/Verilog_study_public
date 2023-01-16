module wire_not_use (
    input   A_i,
    input   B_i,
    input   D_i,
    output  E_o
);

    assign  E_o = ((A_i & B_i) | D_i);
    
endmodule