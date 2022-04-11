`timescale 1ns / 1ps

module compressor #(
        parameter   INPUT_WIDTH  = 128,
        parameter   OUTPUT_WIDTH = 128,
        parameter   CHUNK_SIZE = 8,
        parameter   EN_BITS = 3
        
    ) (
        input  [INPUT_WIDTH - 1 : 0]        data_in, // input flit
        //output [OUTPUT_WIDTH - 1 : 0]       data_out, // compressed flit
        output [EN_BITS - 1 : 0]            en_out // encoding bits for each flit

    );

    wire [CHUNK_SIZE - 1 : 0] Clarge, Csmall,base, sb0_out;
    wire [EN_BITS-1 : 0]  en_bits;



    assign base = (Clarge + Csmall)/2; // Base flit
    assign en_out = en_bits; // Encode bits


    minmax try (
                .input_data(data_in),
                .max(Clarge),
                .min(Csmall)
            );

    subtractor_8bit sb0 (
                    .a(base),
                    .b(Clarge),
                    .diff_out(sb0_out)
                ); // Subtract the maximum value from the base value
                    // max. possible delta

    prio_encoder_8_3 p_enc(
                            .dec_in(sb0_out),
                            .bin_out(en_bits)
                        ); // Encode the difference between the base and maximum values

