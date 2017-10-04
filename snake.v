module snk
#(parameter bits = 4)
(
	input reg [1:0] dir,
	input CLK,
	output reg [2*bits-1:0] snk_bits
);

reg [2*bits-1:0] head;

reg [bits-1:0] x;
reg [bits-1:0] y;
integer i;
initial
begin
	for(i=0;i<2*bits-1;i=i+1)
	begin
		head[i] = 0;
	end
	head[2*bits-2] = 1;
	head[bits-2] = 1;
end

always @ (posedge CLK)
begin
	
	x = head[2*bits-1:bits];
	y = head[bits-1:0];
// check boundaries
	


// free to move, move
	case (dir)
		2'b00 : y=y-1;
		2'b01 : y=y+1;
		2'b10 : x=x-1;
		2'b11 : x=x+1;
	endcase
	
	head[2*bits-1:bits] = x;
	head[bits-1:0] = y;
	
end

endmodule