module slave_spi(mosi, miso, clock, position_to_seg);

input mosi, clock;

output miso;
output [7:0]position_to_seg;

reg [3:0]positions_read = 0;
reg [7:0]shifted_value;
reg [7:0]out;

always @(posedge clock)
begin
    if (positions_read[3])
	 begin
	     out <= shifted_value;
		  positions_read <= 0;
	 end
	 else
	 begin
	     positions_read <= positions_read + 1; 
		  shifted_value <= {shifted_value[6:0], mosi};
	 end
end

assign miso = shifted_value[7];

assign position_to_seg = out;

endmodule
