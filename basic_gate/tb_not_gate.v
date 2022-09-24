`timescale 1ns/1ns
module TB_not_gate(
    // Testbench don't have any I/O port
);
    reg     A_i;
    wire    F_o;
    
    
    // DUT inst
    not_gate u_not_gate(
        .A_i    ( A_i ),
        .F_o    ( F_o )
    );

    initial begin
        #0 A_i = 1'b0;
        #5 A_i = 1'b1;
        #5 A_i = 1'b0;
        #5 A_i = 1'b0;
    end

endmodule