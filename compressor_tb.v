`timescale 1ns / 1ps
`include "compressor.v"

module main_tb #(
        parameter N_FLITS = 10000 
    )();


    input [127 : 0] flit_in;
    wire [127 : 0] comp_out;
    wire [2:0] en_bits;

    compressor comp_uut(
                   .data_in(flit_in),
                //    .data_out(comp_out),
                   .en_out(en_bits)
                //    .is_head(1'b0)
               );



    initial begin
        $dumpfile("compressor_tb.vcd");
        $dumpvars(0, compressor_tb);

        flit_in = 128'hFAC68915ACEF098F;

    end

endmodule

