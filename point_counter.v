module point_counter
(
	input reg [6:0] food,
	input reg [6:0] head,
	input reg rst,
	input clk,
	output reg gen,
	output reg [3:0] score
);

integer count;
initial
begin
	count = 0;
end

always @ (posedge clk)
begin
	if (rst == 1)
	begin
		gen = 1;
		count = 0;
	end
	if(food[5:0] == head[5:0])
	begin
		gen = 1;
		count = count + 1;
	end
	else
	begin
		gen = 0;
	end
	
	score = count;
	
end

endmodule