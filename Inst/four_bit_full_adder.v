module four_bit_full_adder (
    input   [3:0]   A_i,
    input   [3:0]   B_i,
    input           C_i,
    output  [3:0]   S_o,
    output          C_o
);

    wire    [4:0]   C_w;
    assign  C_w[0] = C_i;
    
    // full adder inst
    full_adder u_full_adder_0(  .A_i( A_i[0] ), .B_i( B_i[0] ), .C_i( C_w[0] ), 
                                .S_o( S_o[0] ), .C_o( C_w[1] ) );
    full_adder u_full_adder_1(  .A_i( A_i[1] ), .B_i( B_i[1] ), .C_i( C_w[1] ), 
                                .S_o( S_o[1] ), .C_o( C_w[2] ) );
    full_adder u_full_adder_2(  .A_i( A_i[2] ), .B_i( B_i[2] ), .C_i( C_w[2] ), 
                                .S_o( S_o[2] ), .C_o( C_w[3] ) );
    full_adder u_full_adder_3(  .A_i( A_i[3] ), .B_i( B_i[3] ), .C_i( C_w[3] ), 
                                .S_o( S_o[3] ), .C_o( C_w[4] ) );
    
    assign  C_o = C_w[4];

endmodule //four_bit_full adder