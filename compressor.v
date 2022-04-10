`timescale 1ns / 1ps

module compressor #(
        parameter   INPUT_WIDTH  = 128,
        parameter   OUTPUT_WIDTH = 128,
        parameter   CHUNK_SIZE = 8,
        
    ) (
        input  [INPUT_WIDTH - 1 : 0]        data_in, // input flit
        //output [OUTPUT_WIDTH - 1 : 0]       data_out, // compressed flit
         
    );
    wire [CHUNK_SIZE - 1 : 0] Clarge, Csmall,base;
   minmax try (
               .input_data(data_in),
               .max(Clarge),
               .min(Csmall)
           );
  assign base = (Clarge + Csmall)/2; // Base flit

 

  
  
