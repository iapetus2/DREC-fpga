module master_spi (miso, mosi, clock_spi, clock);

input clock, miso;

output mosi, clock_spi;

reg [3:0]position = 0;
reg [3:0]div_counter = 0;
reg [7:0]hex_counter = 0;
reg [7:0]shifted_value;

reg spi_enable;

always @(posedge clock)
begin
	if (position < 8)
	begin
		spi_enable <= 1;
	end
	else
	begin
		spi_enable <= 0;
	end
	
	div_counter <= div_counter + 1;
	
	if (div_counter == 0)
	begin
		hex_counter <= hex_counter + 1;
	end
	position <= position + 1;
end

always @(posedge clock) 
begin
    if (spi_enable) 
	 begin
		 shifted_value <= {shifted_value[6:0], miso};
    end
	 else 
	 begin
		 shifted_value <= hex_counter;
    end
end

and(clock_spi, clock, spi_enable);
assign mosi = shifted_value[7];

endmodule
