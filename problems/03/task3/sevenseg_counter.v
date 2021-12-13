module sevenseg_display(clock, position, positive_pins, segments);

input clock;
input [15:0]position;

output [3:0]positive_pins;
output [6:0]segments;

reg [1:0]i = 0;
assign positive_pins = (4'b0001 << i);

always @(posedge clock)
begin
	i <= i + 2'b01;
end

wire [3:0]b = position[i * 4 +: 4];

hex_table hex_table(.position(b), .segments(segments));

endmodule
