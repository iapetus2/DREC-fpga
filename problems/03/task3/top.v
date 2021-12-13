module top(clock, DS_EN1, DS_EN2, DS_EN3, DS_EN4, DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G);

input clock;

output DS_EN1, DS_EN2, DS_EN3, DS_EN4;
output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G;

reg [12:0]sevenseg_clock = 0;
reg [21:0]counter_clock = 0;

wire [6:0]segments;
wire [3:0]positive_pins;


assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~positive_pins;

always @(posedge clock)
begin
	sevenseg_clock <= sevenseg_clock + 1;
end

assign clock_seg = sevenseg_clock[12];

always @(posedge clock)
begin
	counter_clock <= counter_clock + 1;
end

assign clock_last = counter_clock[21];

wire [7:0]position_to_seg;
wire [15:0]d = {8'h0, position_to_seg};

master_spi master_spi(.mosi(mosi), .miso(miso), .clock_spi(clock_spi), .clock(clock_last));

slave_spi slave_spi(.mosi(mosi), .miso(miso), .clock(clock_spi), .position_to_seg(position_to_seg));

sevenseg_display sevenseg_display(.clock(clock_seg), .position(d), .positive_pins(positive_pins), .segments(segments));

endmodule
