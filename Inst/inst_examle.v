module inst_examle (
    input   A_i,
    input   B_i,
    input   D_i,
    output  E_i
);

    wire    C_w;
    
    and_gate u_and_gate(
        .A_i ( A_i ),
        .B_i ( B_i ),
        .F_o ( C_w )
    );
    
    or_gate u_or_gate(
        .A_i ( C_w ),
        .B_i ( D_i ),
        .F_o ( E_o )
    );

endmodule 