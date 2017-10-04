module snk_printer
(
	input CLK,
	input reg [2*3:0] snake,
	input RST,
	output reg [95:0] leds
);
localparam bits = 3; // x and y coded on 3 bits
reg [95:0] temp_leds;

reg [2*bits:0] snk;

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
		leds[xx + 12*yy] = 1;
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
	
	snk = 7'b0011011;
	
end


always @ (posedge CLK)
begin


	clear_leds;
	
	snk = 7'b0011011;
	snk = snake;
	// test print_bit
//	x = snk[5:3] >> bits;
//	y = snk[2:0];
	
	x = snk[2*bits-1:bits];
	y = snk[bits-1:0];
//	x = 3'b011;
//	y = 3'b011;
	
/*	if(x < 0) 
		x = 0;
	
	if(x > 7)
		x = 7;
		
	if(y < 0)
		y = 0;
	
	if(y > 7)
		y = 7;*/
	
	leds[x+12*y] = 1;
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
/*	for(i=0;i<size;i=i+1)
	begin
		print_bit(snake[i]);
	end
*/
	
	//leds = temp_leds;
/*	leds[0] = 1;
	leds[48] = 1;
	leds[13] = 1;
	leds[26] = 1;
	leds[39] = 1;
	leds[52] = 1;
	leds[65] = 1;
	leds[78] = 1;
	leds[91] = 1;
	*/
	
end

endmodule