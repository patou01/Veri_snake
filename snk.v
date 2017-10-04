module snk
(
	input reg [1:0] dir,
	input CLK,
	input reg [3:0] score,
	input rst,
	output reg [15:0][2*3:0] snk_bits, // [on/off, x, y], so needs 2*bits + 1.
	output reg dead
);

localparam bits = 3; // 
reg [2*bits:0] head;

integer x;
integer y;

integer i;
integer score_;
initial
begin

	dead = 0;
	head = 7'b1011011;
	for(i=0;i<16;i=i+1)
	begin
		snk_bits[i][6] = 0;
	end
end

always @ (posedge CLK)
begin
	
	if(rst == 1)
	begin
		dead = 0;
		head = 7'b1011011;
		for(i=0;i<16;i=i+1)
		begin
			snk_bits[i][6] = 0;
		end
	end
	x = head[2*bits-1:bits];
	y = head[bits-1:0];
	
	
	// move everything...
	for(i=15; i>0; i=i-1)
	begin
		snk_bits[i][6:0] = snk_bits[i-1][6:0];
		if(i <= score)
		begin
			snk_bits[i][6] = 1;
		end
		else
		begin
			snk_bits[i][6] = 0;
		end
	end
	
	


	// free to move, move
	if(dead == 0)
	begin
		case (dir)
			2'b00 : x=x+1;
			2'b01 : x=x-1;
			2'b10 : y=y+1;
			2'b11 : y=y-1;
		endcase
		
		if(x == 8)
		begin
			x = 0;
		end
		
		if(x ==	0)
		begin
			x = 8;
		end
		
		if(y == 8)
		begin
			y = 0;
		end
		
		if(y == 0)
		begin
			y = 8;
		end
		
		
		// place the head
		head[2*bits-1:bits] = x;
		head[bits-1:0] = y;
		
		snk_bits[0][6:0] = head;
	end	
	
	// check collision
	for(i=2;i<16;i=i+1)
	begin
		if(snk_bits[0][6:0] == snk_bits[i][6:0])
			dead = 1;
	end
	

	
end

endmodule



module snk_tb;
	reg [1:0] dir;
	reg CLK;
	wire [7:0] snk_bits;
	
	
	snk DUT(dir, CLK, snk_bits);

	
initial
begin
	CLK = 0;
	dir[1] = 0;
	dir[0] = 0;
	
	#10 CLK = 1;
	#10 CLK = 0;
	#10 CLK = 1;
	#10 CLK = 0;
	#10 CLK = 1;
	#10 CLK = 0;
	#10 CLK = 1;
	#10 CLK = 0;
	
	

end

endmodule