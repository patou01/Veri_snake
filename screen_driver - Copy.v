module screen_driver 
#(parameter rows=8, columns=12, size=8, pwmOn = 30, pwmOff = 500)
(

	input reg [rows-1:0] rowIn, 
	input reg [columns-1:0] colIn, 
	input reg CLK,
	output reg [rows-1:0] LED_R,
	output reg [rows-1:0] LED_G,
	output reg [rows-1:0] LED_B,
	output reg [columns-1:0] LED_SELC,
	output reg LED_RST
);


task outLeds;
	input [rows-1:0] rowInn;
	input [columns-1:0] colInn;
	input col;
	
	integer j;
	integer k;
begin
	for(i=0;i<rows;i=i+1)
	begin
		if(rowInn[i] == 1)
		begin
			if(colInn[col] == 1)
			begin
				LED_R[i] = 1;
				LED_SELC[j] = 0;
			end
		end
/*		for(j=0;j<columns;j=j+1)
		begin
			if(rowInn[i] == 1)
			begin
				if(colInn[j] == 1)
				begin
					LED_R[i] = 1;
					LED_SELC[j] = 0;
				end	
			end
		end
*/
	end
end

//LED_R[0] = 1;
//LED_SELC[0] = 0;

endtask

reg [rows-1:0] rin;
reg [columns-1:0] cin;

integer i;
integer state;


initial 
begin
	LED_RST = 1;	
	for(i=0; i < rows; i=i+1) begin
		LED_R[i] = 0;
		LED_G[i] = 0;
		LED_B[i] = 0;
		rin[i] = 0;
	end
	for(i=0; i<columns;i=i+1) begin
	LED_SELC[i] = 1;
	cin[i] = 0;
	end
	state = 0;
	
	LED_RST = #100 0;
	
//	rin[1] = 1;
//	rin[0] = 1;
//	cin[1] = 1;
	
end

always @(posedge CLK)
begin
	rin <= rowIn;
	cin <= colIn;

	state = state + 1;
	
	if(state > pwmOff)
	begin
		LED_RST = 0;
		outLeds(rin,cin, state % columns);
//		LED_RST = 0;
//		LED_R[2] = 1;
//		LED_SELC[2] = 0;
		if(state > pwmOff + columns)
		begin
			state = 0;
		end
	end
	else
	begin
		LED_RST = 1;
	end
	
	
	
	if(state > pwmOn + pwmOff)
	begin
		state = 0;
	end
	
	
	
end

endmodule
