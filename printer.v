module printer
(
	input CLK,
	input reg [15:0][2*3:0] snake,
	input reg [2*3:0] food,
	input RST,
	output reg [95:0] leds
);
localparam bits = 3; // x and y coded on 3 bits
reg [95:0] temp_leds;


integer i;

integer unsigned x;
integer unsigned y;


task print_bit;
	input [2*bits:0] snk_bit;
	integer xx;
	integer yy;
	begin
		xx = snk_bit[2*bits-1:bits];
		yy = snk_bit[bits-1:0];
		leds[12*xx + yy] = 1;
	end


endtask

task clear_leds;
	begin
		for(i=0;i<96;i=i+1)
		begin
			leds[i] = 0;
		end
	end
endtask

initial
begin
	for(i=0;i<96;i=i+1)
	begin
		leds[i] = 0;
	end
	
	x = 1;
	y = 1;
	
	
end


always @ (posedge CLK)
begin


	clear_leds;
	// test print_bit
//	x = snk[5:3] >> bits;
//	y = snk[2:0];
	
//	x = snk[2*bits-1:bits];
//	y = snk[bits-1:0];
//	x = 3'b011;
//	y = 3'b011;
	
	
	//leds[12*x +y] = 1;
	for(i=0;i<16;i++)
	begin
		if(snake[i][6] == 1)
		begin
			print_bit(snake[i][6:0]);
		end
	end
	print_bit(food);
/* BEGIN LED_WALK

	leds[x + 12*y] = 0;
	x = x + 1;
	
	if(x > 12)
	begin
		y = y+1;
		x = 0;
	end
	if(y > 8)
	begin
		y = 0;
	end
	leds[x + 12*y] = 1;

	END LED_WALK
*/ 	

end

endmodule