module Counter_Controller #(
    parameter   DWIDTH = 7
)(
    input                   clk,
    input                   rst_n,
    input                   start_i,
    input   [DWIDTH-1:0]    cnt_val_i,
    input   [DWIDTH-1:0]    cnt_i,
    output                  run_o,
    output                  done_o
);

    localparam  S_IDLE = 2'b00,
                S_RUN  = 2'b01,
                S_DONE = 2'b10;

    reg     [1:0]           state, state_n;
    reg     [DWIDTH-1:0]    cnt_val, cnt_val_n;
    
    reg                     run,
                            done;


    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            state   <= S_IDLE;
            cnt_val <= {(DWIDTH){1'b0}};
        end else begin
            state   <= state_n;
            cnt_val <= cnt_val_n;
        end
    end

    always @(*) begin
        state_n     = state;
        cnt_val_n   = cnt_val;
        
        run         = 1'b0;
        done        = 1'b0;
        
        case (state)
            S_IDLE: begin
                if (start_i) begin
                    state_n     = S_RUN;
                    cnt_val_n   = cnt_val_i;
                end
            end
            S_RUN: begin
                run             = 1'b1;
                if (cnt_val-1 == cnt_i) begin
                    state_n     = S_DONE;
                end
            end
            S_DONE: begin
                done            = 1'b1;
                state_n         = S_IDLE;
            end
        endcase
    end
    
    assign run_o    = run;
    assign done_o   = done;

endmodule //counter_controller