module food_gen
(
	input CLK,
	input gen, // if it must generate new food.
	output reg [6:0] food
);


integer count;
integer temp;
initial 
	begin
		count = 0;
		temp = 0;
		food = 7'b1001110;
	end


always @ (posedge CLK)
	begin
		count = count + 1;
		if (gen == 1)
		begin
			if (temp != gen)
			begin
				food[5:3] = count[2:0];
				food[2:0] = count[5:3];
			end
		end
		
		temp = gen;
	end

endmodule