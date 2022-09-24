module TB_wire_use(
    // TB don't have any I/O port
);

    // DUT inst
    wire_use u_wire_use(
        .A_i    ( A_i ),
        .B_i    ( B_i ),
        .D_i    ( D_i ),
        .E_o    ( E_o )
    );

    initial begin
        #0
        A_i = 1'b0;
        B_i = 1'b0;
        D_i = 1'b0;
        
        #5
        A_i = 1'b1;
        B_i = 1'b0;
        D_i = 1'b0;
        
        #5
        A_i = 1'b1;
        B_i = 1'b1;
        D_i = 1'b0;
        
        #5
        A_i = 1'b1;
        B_i = 1'b1;
        D_i = 1'b1;
        
        #5
        A_i = 1'b0;
        B_i = 1'b1;
        D_i = 1'b0;
        
        #5
        A_i = 1'b0;
        B_i = 1'b1;
        D_i = 1'b1;
        
        #5
        A_i = 1'b0;
        B_i = 1'b0;
        D_i = 1'b1;
        
    end

endmodule