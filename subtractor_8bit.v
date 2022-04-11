module subtractor_8bit #(
    parameter INPUT_WIDTH = 8,
    parameter OUTPUT_WIDTH = 8
) (
    input[INPUT_WIDTH-1 : 0] a, b;
    output[OUTPUT_WIDTH-1 : 0] diff_out
);

    assign diff_out = b-a;
    
endmodule
