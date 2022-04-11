module prio_encoder_8_3 #(
    parameter INPUT_WIDTH = 8,
    parameter OUTPUT_WIDTH = 3
) (
    input[INPUT_WIDTH-1 : 0] dec_in,
    output[OUTPUT_WIDTH-1 : 0] bin_out
);

    always @(dec_in) begin
        casez (dec_in)
            'b1???????:
                bin_out = 3'b111;

            8'b01??????:
                bin_out = 3'b111;

            8'b001?????:
                bin_out = 3'b111;

            8'b0001????:
                bin_out = 3'b110;

            8'b00001???:
                bin_out = 3'b101;

            8'b000001??:
                bin_out = 3'b100;

            8'b0000001?:
                bin_out = 3'b011;

            8'b00000001:
                bin_out = 3'b010;

            8'b00000000:
                bin_out = 3'b000;

            default:
                bin_out = 3'b000;
        endcase
    end
    
endmodule
