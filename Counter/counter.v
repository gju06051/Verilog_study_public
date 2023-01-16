module Counter #(
    parameter   DWIDTH = 7        // Puropose is counting 100(2^7 = 128)
)(
    input                   clk,
    input                   rst_n,
    input                   en,
    output  [DWIDTH-1:0]    cnt_o
);

    reg [DWIDTH-1:0] cnt;
    
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            cnt <= {(DWIDTH){1'b0}};        
        end else if (en) begin
            cnt <= cnt + 'd1;
        end
    end
    
    assign cnt_o = cnt;
    
endmodule