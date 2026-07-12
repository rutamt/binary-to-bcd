module bin_to_bcd (
    input  [7:0] binary,  // 8-bit binary input (0 to 255)
    output reg [11:0] bcd // 12-bit BCD output (Hundreds, Tens, Ones)
);

    integer i;

    always @(*) begin
        // Initialize BCD output to 0
        bcd = 12'b0;
        
        // Loop through all 8 bits of the input
        for (i = 7; i >= 0; i = i - 1) begin
            
            // Check individual BCD columns; if any column is >= 5, add 3
            if (bcd[3:0] >= 5) begin
                bcd[3:0] = bcd[3:0] + 3;
            end
            
            if (bcd[7:4] >= 5) begin
                bcd[7:4] = bcd[7:4] + 3;
            end
            
            if (bcd[11:8] >= 5) begin
                bcd[11:8] = bcd[11:8] + 3;
            end
            
            // Shift the BCD register left by 1 and pull in the next binary bit
            bcd = {bcd[10:0], binary[i]};
        end
    end

endmodule
