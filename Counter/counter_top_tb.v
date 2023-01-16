`timescale 1ps/1ps
`define CLOCK_PERIOD 10
`define DELTA 1

module Counter_top_TB #(
    parameter   DWIDTH = 7
)(
    // TB don't have I/O port
);
    
    // Driver
    reg                   clk;
    reg                   rst_n;
    reg                   start_i;
    reg   [DWIDTH-1:0]    cnt_val_i;
    wire  [DWIDTH-1:0]    cnt_o;
    wire                  done_o;

    // DUT inst
    Counter_top #(
        .DWIDTH    ( DWIDTH )
    )u_Counter_top(
        .clk       ( clk       ),
        .rst_n     ( rst_n     ),
        .start_i   ( start_i   ),
        .cnt_val_i ( cnt_val_i ),
        .cnt_o     ( cnt_o     ),
        .done_o    ( done_o    )
    );

    // clock signal
    initial begin
        clk = 1'b0;
        forever begin
            #(`CLOCK_PERIOD/2) clk = ~clk;
        end
    end
    
    integer i;


    initial begin
        
        // 0. initialize
        rst_n = 1'b1;
        start_i = 1'b0;
        cnt_val_i = 'd0;
        
        // 1. reset
        @(posedge clk);
        #(`DELTA)
        rst_n = 1'b0;   // reset on
        @(posedge clk);
        #(`DELTA)
        rst_n = 1'b1;   // reset off
        
        // 2. cnt start
        @(posedge clk);
        #(`DELTA)
        start_i = 1'b1;
        cnt_val_i = 'd100;
        @(posedge clk);
        #(`DELTA)
        start_i = 1'b0;
        cnt_val_i = 'd0;

        // 3. wait
        @(done_o);

        $stop;
    end
endmodule


    