module TB_four_bit_full_adder (
    // TB don't have and I/O port
);

    reg     [3:0]   A_i;
    reg     [3:0]   B_i;
    reg             C_i;
    wire    [3:0]   S_o;
    wire            C_o;

    four_bit_full_adder u_four_bit_full_adder(
        .A_i ( A_i ),
        .B_i ( B_i ),
        .C_i ( C_i ),
        .S_o ( S_o ),
        .C_o ( C_o )
    );

    initial begin
        #0
            A_i = 'd10;
            B_i = 'd5;
            C_i = 'd0;
        #5
            A_i = 'd3;
            B_i = 'd7;
            C_i = 'd0;
        #5
            A_i = 'd2;
            B_i = 'd3;
            C_i = 'd0;
    end

endmodule