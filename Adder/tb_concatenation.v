module tb_concatenation (
    // TB don't have any I/O port
);

    reg     [3:0]   a;
    reg     [3:0]   b;
    wire    [7:0]   c;

    // DUT inst
    concatenation_ex u_concatenation_ex(
        .a ( a ),
        .b ( b ),
        .c ( c )
    );

    initial begin
        #0 
        a = 4'b0101;
        b = 4'b1111;
        
        #5
        a = 4'b1010;
        b = 4'b0000;
        
        #5
        a = 4'b1011;
        b = 4'b0110;
    end


endmodule 