// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module bin_to_bcd_tb;
  reg [7:0] in;
  wire [11:0] bcd_out;

  bin_to_bcd uut(.binary(in),.bcd(bcd_out));
  
  initial begin
    in = 8'b00000001; //1
    #10
    $display("Out: %b", bcd_out);
    
    in = 8'b00000011; //3
	#10
	$display("Out: %b", bcd_out);

    // Test decimal 10 (triggers the +3 logic once)
    in = 8'b00001010; 
    #10;
    $display("Out: %b", bcd_out); 
    // Expected Output: 0000_0001_0000 (BCD for 1 0)

    // Test decimal 255 (maximum 8-bit value)
    in = 8'b11111111; 
    #10;
    $display("Out: %b", bcd_out); 
    // Expected Output: 0010_0101_0101 (BCD for 2 5 5)
    
    
  end
endmodule
