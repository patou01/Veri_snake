module screen_driver 
#(parameter rows=8, cols=12, size=8, pwmOn = 30, pwmOff = 500)
(
	input reg [(rows*cols)-1:0] leds,
	input reg CLK,
	output reg [rows-1:0] LED_R,
	output reg [rows-1:0] LED_G,
	output reg [rows-1:0] LED_B,
	output reg [cols-1:0] LED_SELC,
	output reg LED_RST
);


task outCol;
	input reg [4:0] i;
	
	integer j;
	
begin
	for(j=0; j<cols; j=j+1)
	begin
		LED_SELC[j] = 1;
	end
	LED_SELC[i] = 0;
	for(j=0; j<rows; j=j+1)
	begin
		if(leds[i + cols*j] == 1)
		begin
			LED_R[j] = 1;
		end			
	end
end
endtask

task clearLeds;

integer i;

begin
	for(i=0; i<cols;i=i+1) begin
	LED_SELC[i] = 1;
	end
	for(i=0; i < rows; i=i+1) begin
		LED_R[i] = 0;
		LED_G[i] = 0;
		LED_B[i] = 0;
	end
	LED_RST = 1;
	LED_B[0] = 0;
end
endtask

integer i;
integer state;
integer c;


initial 
begin
	clearLeds();
	state = 0;
	LED_RST = 0;
	c = 0;
end

always @(posedge CLK)
begin

//	outCol(state[4:0]);
	state = state + 1;
	LED_RST = 0;

	if(state == 100)
	begin
		c = c + 1;
		if(c == 12)
		begin
			c = 0;
		end
		outCol(c[4:0]);
	end
	if(state == 200)
	begin
		state = 0;
		clearLeds();
	end
	
	
	
end

endmodule

/*
module screen_driver_tb;
parameter rows=8, cols=12, size=8, pwmOn = 30, pwmOff = 500;
	reg clk_sim;
	reg [(rows*cols)-1:0] leds_sim;
	wire [rows-1:0] R;
	wire [rows-1:0] G;
	wire [rows-1:0] B;
	wire [cols-1:0] SELC;
	wire RST;
	
	parameter delay = 10;
	integer i;
	screen_driver DUT(leds_sim, clk_sim, R, G, B, SELC, RST);
	
	
initial
begin
	for(i=0; i<96;i=i+1)
	begin
		leds_sim[i] = 0;
	end
	
	clk_sim = 1;
	leds_sim[0] = 0;
	
	//leds_sim[0] = 1;
//	#(delay) clk_sim = 1; #(delay) clk_sim = 0;
//	leds_sim[0] = 0;
//	#(delay) clk_sim = 1; #(delay) clk_sim = 0;
	
	for(i=0;i<12;i=i+1)
	begin
		leds_sim[i] = 1;
		#100 clk_sim = 1;
		#100 clk_sim = 0;
		#100 leds_sim[i] = 0;
	end

	#100;
	
end

endmodule
*/