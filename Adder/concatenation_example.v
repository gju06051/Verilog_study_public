module concatenation_ex(
    input   [3:0]   a,
    input   [3:0]   b,
    output  [7:0]   c
);
    assign c = {a, b}; 

endmodule