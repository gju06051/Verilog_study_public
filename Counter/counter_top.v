module Counter_top #(
    parameter   DWIDTH = 7
)(
    input                   clk,
    input                   rst_n,
    input                   start_i,
    input   [DWIDTH-1:0]    cnt_val_i,
    output  [DWIDTH-1:0]    cnt_o,
    output                  done_o
);
    
    wire [DWIDTH-1:0]   cnt_w;
    wire                en_w;
    
    Counter #(
        .DWIDTH     ( DWIDTH )
    )u_Counter(
        .clk        ( clk   ),
        .rst_n      ( rst_n ),
        .en         ( en_w  ),
        .cnt_o      ( cnt_w )
    );

    Counter_Controller #(
        .DWIDTH     ( DWIDTH )
    )u_Counter_Controller(
        .clk        ( clk       ),
        .rst_n      ( rst_n     ),
        .start_i    ( start_i   ),
        .cnt_val_i  ( cnt_val_i ),
        .cnt_i      ( cnt_w     ),
        .run_o      ( en_w      ),
        .done_o     ( done_o    )
    );

    assign cnt_o = cnt_w;

endmodule