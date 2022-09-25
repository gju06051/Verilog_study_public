module FIFO #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8
    )(
    input                       clk,
    input                       rst_n,
    input                       wren_i,
    input                       rden_i,
    input   [DATA_WIDTH-1:0]    wdata_i,
    output  [DATA_WIDTH-1:0]    rdata_o,
    output                      full_o,
    output                      empty_o
    );
    
    localparam FIFO_DEPTH_LG2 = $clog2(FIFO_DEPTH);
    
    reg [FIFO_DEPTH_LG2:0] wrptr;
    reg [FIFO_DEPTH_LG2:0] rdptr;
    
    // Write pointer counter seq logic
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            wrptr <= {(FIFO_DEPTH_LG2+1){1'b0}};
        end else if (wren_i) begin
            wrptr <= wrptr + 'd1;
        end
    end
    
    // Read pointer counter seq logic   
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            rdptr <= {(FIFO_DEPTH_LG2+1){1'b0}};
        end else if (rden_i) begin
            rdptr <= rdptr + 'd1;
        end
    end
    
    // mem(This part is replace by any other memroy & inteface)
    reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
    
    // Write
    always @(posedge clk) begin
        if (wren_i) begin
            mem[wrptr[FIFO_DEPTH_LG2-1:0]] <= wdata_i;
        end
    end
    
    // Read
    assign rdata_o = mem[rdptr[FIFO_DEPTH_LG2-1:0]];
    
    // Full & empty check
    assign empty_o = (wrptr==rdptr);
    assign full_o = (wrptr[FIFO_DEPTH_LG2-1:0]==rdptr[FIFO_DEPTH_LG2-1:0]) & 
                    (wrptr[FIFO_DEPTH_LG2] != rdptr[FIFO_DEPTH_LG2]);


endmodule