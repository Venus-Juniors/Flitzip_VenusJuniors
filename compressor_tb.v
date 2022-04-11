`timescale 1ns/1ns
`include "compressor.v"

module compressor_tb;

    reg [INPUT_WIDTH - 1 : 0] flit_in;
    wire [EN_BITS - 1 : 0] en_out;

    // compressor uut(
    //     .data_in(flit_in),
    //     .en_out(en_out),
    // );
    
    compressor uut(flit_in, en_out);

    initial begin
        $dumpfile("compressor_tb.vcd");
        $dumpvars(0, compressor_tb);

        flit_in = 128'hFAC68915ACEF098F;

    end

endmodule
