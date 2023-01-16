module TB_half_adder(
    // TB don't have I/O port
);

    reg     A_i;
    reg     B_i;
    wire    S_o;
    wire    C_o;

    // DUT inst
    half_adder u_half_adder(
        .A_i ( A_i ),
        .B_i ( B_i ),
        .S_o ( S_o ),
        .C_o  ( C_o  )
    );

    // Stimulus
    initial begin
        #0
        A_i = 1'b0;
        B_i = 1'b0;
        
        #5
        A_i = 1'b1;
        B_i = 1'b0;
        
        #5
        A_i = 1'b0;
        B_i = 1'b1;
        
        #5
        A_i = 1'b1;
        B_i = 1'b1;
    end

endmodule